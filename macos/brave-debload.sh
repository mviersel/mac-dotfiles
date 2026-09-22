#!/bin/zsh

set -euo pipefail

PLIST="/Library/Managed Preferences/com.brave.Browser.plist"
PLISTBUDDY="/usr/libexec/PlistBuddy"

if [[ $EUID -ne 0 ]]; then
    echo "Administratorrechten zijn vereist."
    exec sudo "$0" "$@"
fi

ACTION="${1:-apply}"

# Managed Preferences directory aanmaken
mkdir -p "/Library/Managed Preferences"
chown root:wheel "/Library/Managed Preferences"
chmod 755 "/Library/Managed Preferences"

# Nieuwe geldige plist maken indien nodig
if [[ ! -f "$PLIST" ]]; then
    /usr/bin/plutil -create xml1 "$PLIST"
fi

# Backup maken
BACKUP="${PLIST}.backup.$(date +%Y%m%d-%H%M%S)"
cp -p "$PLIST" "$BACKUP"

set_bool() {
    local key="$1"
    local value="$2"

    # Verwijder bestaande waarde zodat datatype gegarandeerd boolean is
    "$PLISTBUDDY" -c "Delete :$key" "$PLIST" >/dev/null 2>&1 || true
    "$PLISTBUDDY" -c "Add :$key bool $value" "$PLIST"
}

remove_key() {
    local key="$1"
    "$PLISTBUDDY" -c "Delete :$key" "$PLIST" >/dev/null 2>&1 || true
}

case "$ACTION" in

apply)
    echo "Brave WinUtil-equivalent toepassen..."

    set_bool BraveRewardsDisabled true
    set_bool BraveWalletDisabled true
    set_bool BraveVPNDisabled true
    set_bool BraveAIChatEnabled false
    set_bool BraveStatsPingEnabled false
    set_bool BraveNewsDisabled true
    set_bool BraveTalkDisabled true
    set_bool TorDisabled true
    set_bool BraveP3AEnabled false
    set_bool UrlKeyedAnonymizedDataCollectionEnabled false
    set_bool SafeBrowsingExtendedReportingEnabled false
    set_bool MetricsReportingEnabled false
    ;;

undo)
    echo "Brave WinUtil-equivalent verwijderen..."

    remove_key BraveRewardsDisabled
    remove_key BraveWalletDisabled
    remove_key BraveVPNDisabled
    remove_key BraveAIChatEnabled
    remove_key BraveStatsPingEnabled
    remove_key BraveNewsDisabled
    remove_key BraveTalkDisabled
    remove_key TorDisabled
    remove_key BraveP3AEnabled
    remove_key UrlKeyedAnonymizedDataCollectionEnabled
    remove_key SafeBrowsingExtendedReportingEnabled
    remove_key MetricsReportingEnabled
    ;;

status)
    echo "Huidige Brave managed policies:"
    /usr/bin/plutil -p "$PLIST"
    exit 0
    ;;

*)
    echo "Gebruik:"
    echo "  sudo $0 apply"
    echo "  sudo $0 undo"
    echo "  sudo $0 status"
    exit 1
    ;;
esac

chown root:wheel "$PLIST"
chmod 644 "$PLIST"

/usr/bin/plutil -lint "$PLIST"

# macOS preference cache vernieuwen
killall cfprefsd >/dev/null 2>&1 || true

echo
echo "Klaar."
echo "Backup: $BACKUP"
echo "Sluit Brave volledig af en start het opnieuw."
echo "Controleer daarna brave://policy"
