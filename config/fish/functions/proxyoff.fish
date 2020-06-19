function proxyoff
    for e in (echo {http,https,ftp,telnet,all,HTTP,HTTPS,FTP,TELNET,ALL}_{proxy,PROXY} | tr ' ' \n);
        set -e $e
    end
end
