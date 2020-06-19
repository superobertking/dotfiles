function proxyon
    set addr 'http://127.0.0.1:1081'
    if count $argv > /dev/null
        set addr $argv[1]
    end
    export {http,https,ftp,telnet,all,HTTP,HTTPS,FTP,TELNET,ALL}_{proxy,PROXY}=$addr
end

