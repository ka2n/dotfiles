case $EUID in
    0) : already root - fall through ;;
    *) # not root, become root for the rest of this session
       # (and ask for the sudo password only once)
       exec sudo $0 "$@" ;;
esac

{{_cursor_}}
