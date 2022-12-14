#22012014-1

cat > /root/etc/r.json <<EOF
{
  "endpoints": [
    {
      "remark":"默认","listen":"0.0.0.0:26580","remote":"0.0.0.0:13800","listen_transport": "tls;servername=wvccgg.org"
    }
  ],
  "log": {"level": "warn"},
  "dns": {"mode": "ipv4_and_ipv6","protocol": "tcp_and_udp","min_ttl": 0,"max_ttl": 60,"cache_size": 5},
  "network": {"use_udp": true,"zero_copy": true,"tcp_timeout": 300,"udp_timeout": 30,"send_proxy": false,"send_proxy_version": 2,"accept_proxy": false,"accept_proxy_timeout": 5}
}
EOF
