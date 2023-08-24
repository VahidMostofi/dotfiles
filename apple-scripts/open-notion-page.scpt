on run argv

set targetPage to item 1 of argv

tell application "Notion"
    open location targetPage
end tell
tell application "notion" to activate
end run
