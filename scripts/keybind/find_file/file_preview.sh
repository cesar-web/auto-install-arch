#!bin/sh

file=$1

# Get text after final period and turn it to lower case
extension=$(echo ${file} | awk -F . '{print $NF}')
extension=$(echo ${extension} | awk '{print tolower($0)}')

case $extension in
    mp3 ) mediainfo "$file" ;;
    wav ) mediainfo "$file" ;;
    wma ) mediainfo "$file" ;;
    flac) mediainfo "$file" ;;

    mp4 ) mediainfo "$file" ;;
    mov ) mediainfo "$file" ;;
    wmv ) mediainfo "$file" ;;

    jpg ) viu "$file" ;;
    jpeg) viu "$file" ;;
    png ) viu "$file" ;;
    gif ) viu "$file" ;;
    webp) viu "$file" ;;

    pdf ) mediainfo "$file" ;;
    epub) mediainfo "$file" ;;

    a   ) pygmentize "$file" ;;
    asm ) pygmentize "$file" ;;
    asp ) pygmentize "$file" ;;
    awk ) pygmentize "$file" ;;
    bat ) pygmentize "$file" ;;
    bmp ) pygmentize "$file" ;;
    btm ) pygmentize "$file" ;;
    btm ) pygmentize "$file" ;;
    c   ) pygmentize "$file" ;;
    cmd ) pygmentize "$file" ;;
    cpp ) pygmentize "$file" ;;
    csv ) pygmentize "$file" ;;
    cur ) pygmentize "$file" ;;
    cxx ) pygmentize "$file" ;;
    dart) pygmentize "$file" ;;
    db  ) pygmentize "$file" ;;
    def ) pygmentize "$file" ;;
    des ) pygmentize "$file" ;;
    dlg ) pygmentize "$file" ;;
    dll ) pygmentize "$file" ;;
    don ) pygmentize "$file" ;;
    dpc ) pygmentize "$file" ;;
    dpj ) pygmentize "$file" ;;
    dtd ) pygmentize "$file" ;;
    dump) pygmentize "$file" ;;
    dxp ) pygmentize "$file" ;;
    eng ) pygmentize "$file" ;;
    exe ) pygmentize "$file" ;;
    flt ) pygmentize "$file" ;;
    fmt ) pygmentize "$file" ;;
    font) pygmentize "$file" ;;
    fp  ) pygmentize "$file" ;;
    ft  ) pygmentize "$file" ;;
    h   ) pygmentize "$file" ;;
    hdb ) pygmentize "$file" ;;
    hdl ) pygmentize "$file" ;;
    hid ) pygmentize "$file" ;;
    hpp ) pygmentize "$file" ;;
    hrc ) pygmentize "$file" ;;
    html) pygmentize "$file" ;;
    hxx ) pygmentize "$file" ;;
    ico ) pygmentize "$file" ;;
    idl ) pygmentize "$file" ;;
    ih  ) pygmentize "$file" ;;
    ilb ) pygmentize "$file" ;;
    inc ) pygmentize "$file" ;;
    inf ) pygmentize "$file" ;;
    ini ) pygmentize "$file" ;;
    inl ) pygmentize "$file" ;;
    ins ) pygmentize "$file" ;;
    java) pygmentize "$file" ;;
    jar ) pygmentize "$file" ;;
    jnl ) pygmentize "$file" ;;
    js  ) pygmentize "$file" ;;
    json) pygmentize "$file" ;;
    jsp ) pygmentize "$file" ;;
    l   ) pygmentize "$file" ;;
    lgt ) pygmentize "$file" ;;
    lib ) pygmentize "$file" ;;
    lin ) pygmentize "$file" ;;
    ll  ) pygmentize "$file" ;;
    ln3 ) pygmentize "$file" ;;
    lng ) pygmentize "$file" ;;
    lnk ) pygmentize "$file" ;;
    lnx ) pygmentize "$file" ;;
    log ) pygmentize "$file" ;;
    lst ) pygmentize "$file" ;;
    lst ) pygmentize "$file" ;;
    mac ) pygmentize "$file" ;;
    map ) pygmentize "$file" ;;
    mk  ) pygmentize "$file" ;;
    mk  ) pygmentize "$file" ;;
    mod ) pygmentize "$file" ;;
    nt2 ) pygmentize "$file" ;;
    o   ) pygmentize "$file" ;;
    obj ) pygmentize "$file" ;;
    par ) pygmentize "$file" ;;
    pfa ) pygmentize "$file" ;;
    pfb ) pygmentize "$file" ;;
    pl  ) pygmentize "$file" ;;
    pl  ) pygmentize "$file" ;;
    plc ) pygmentize "$file" ;;
    pld ) pygmentize "$file" ;;
    pld ) pygmentize "$file" ;;
    plf ) pygmentize "$file" ;;
    pm  ) pygmentize "$file" ;;
    pmk ) pygmentize "$file" ;;
    pre ) pygmentize "$file" ;;
    prj ) pygmentize "$file" ;;
    prt ) pygmentize "$file" ;;
    ps  ) pygmentize "$file" ;;
    ptr ) pygmentize "$file" ;;
    py  ) pygmentize "$file" ;;
    r   ) pygmentize "$file" ;;
    rc  ) pygmentize "$file" ;;
    rdb ) pygmentize "$file" ;;
    res ) pygmentize "$file" ;;
    s   ) pygmentize "$file" ;;
    s   ) pygmentize "$file" ;;
    sbl ) pygmentize "$file" ;;
    scp ) pygmentize "$file" ;;
    scr ) pygmentize "$file" ;;
    sda ) pygmentize "$file" ;;
    sdb ) pygmentize "$file" ;;
    sdc ) pygmentize "$file" ;;
    sdd ) pygmentize "$file" ;;
    sdg ) pygmentize "$file" ;;
    sdm ) pygmentize "$file" ;;
    sds ) pygmentize "$file" ;;
    sdv ) pygmentize "$file" ;;
    sdw ) pygmentize "$file" ;;
    sdi ) pygmentize "$file" ;;
    seg ) pygmentize "$file" ;;
    seg ) pygmentize "$file" ;;
    set ) pygmentize "$file" ;;
    sgl ) pygmentize "$file" ;;
    sh  ) pygmentize "$file" ;;
    sid ) pygmentize "$file" ;;
    smf ) pygmentize "$file" ;;
    sms ) pygmentize "$file" ;;
    so  ) pygmentize "$file" ;;
    sob ) pygmentize "$file" ;;
    sob ) pygmentize "$file" ;;
    soc ) pygmentize "$file" ;;
    sod ) pygmentize "$file" ;;
    soe ) pygmentize "$file" ;;
    sog ) pygmentize "$file" ;;
    soh ) pygmentize "$file" ;;
    src ) pygmentize "$file" ;;
    srs ) pygmentize "$file" ;;
    tab ) pygmentize "$file" ;;
    tfm ) pygmentize "$file" ;;
    thm ) pygmentize "$file" ;;
    tpt ) pygmentize "$file" ;;
    tsc ) pygmentize "$file" ;;
    ttf ) pygmentize "$file" ;;
    ttf ) pygmentize "$file" ;;
    txt ) pygmentize "$file" ;;
    txt ) pygmentize "$file" ;;
    unx ) pygmentize "$file" ;;
    unx ) pygmentize "$file" ;;
    urd ) pygmentize "$file" ;;
    url ) pygmentize "$file" ;;
    vms ) pygmentize "$file" ;;
    vor ) pygmentize "$file" ;;
    w32 ) pygmentize "$file" ;;
    wav ) pygmentize "$file" ;;
    wmf ) pygmentize "$file" ;;
    xml ) pygmentize "$file" ;;
    xpm ) pygmentize "$file" ;;
    xrb ) pygmentize "$file" ;;
    y   ) pygmentize "$file" ;;
    yxx ) pygmentize "$file" ;;
    yaml) pygmentize "$file" ;;

    *) cat "$file"
esac
