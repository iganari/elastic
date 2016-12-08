```
[22:33:29][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ echo '*.hejda.org' > samplefile.txt
[22:33:40][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ openssl md5 samplefile.txt > rand.dat
[22:33:51][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ openssl genrsa -rand rand.dat -aes128 2048 > wildcard.hejda.org.key
54 semi-random bytes loaded
Generating RSA private key, 2048 bit long modulus
.....+++
..........................................+++
e is 65537 (0x10001)
Enter pass phrase:
Verifying - Enter pass phrase:
[22:34:04][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ openssl rsa -in wildcard.hejda.org.key -out wildcard.hejda.org.key.nopass
Enter pass phrase for wildcard.hejda.org.key:
writing RSA key
[22:34:38][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ ll
total 32
-rw-r--r--  1 vpn-igarashi  staff    54 Sep 19 22:33 rand.dat
-rw-r--r--  1 vpn-igarashi  staff    12 Sep 19 22:33 samplefile.txt
-rw-r--r--  1 vpn-igarashi  staff  1766 Sep 19 22:34 wildcard.hejda.org.key
-rw-r--r--  1 vpn-igarashi  staff  1679 Sep 19 22:34 wildcard.hejda.org.key.nopass
[22:34:40][vpn-igarashi@AFN-vpn-iga ssl-sha2]$ openssl req -new -key wildcard.hejda.org.key -out wildcard.hejda.org.csr -sha256
Enter pass phrase for wildcard.hejda.org.key:
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:Tokyo
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:hejda.org
Organizational Unit Name (eg, section) []:Development
Common Name (e.g. server FQDN or YOUR name) []:*.hejda.org
Email Address []:info@hejda.org

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:igaguri7985
An optional company name []:igaguri7986

[22:36:32][vpn-igarashi@AFN-vpn-iga ssl-sha2]$openssl x509 -text < wildcard.hejda.org.crt
Certificate:
    Data:
        Version: 1 (0x0)
        Serial Number:
            c0:4b:c1:a2:9a:c0:bb:8c
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=JP, ST=Tokyo, O=hejda.org, OU=Development, CN=*.hejda.org/emailAddress=info@hejda.org
        Validity
            Not Before: Sep 20 16:22:27 2016 GMT
            Not After : Sep 18 16:22:27 2026 GMT
        Subject: C=JP, ST=Tokyo, O=hejda.org, OU=Development, CN=*.hejda.org/emailAddress=info@hejda.org
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
            RSA Public Key: (2048 bit)
                Modulus (2048 bit):
                    00:b1:db:00:52:64:63:79:d5:41:ec:a3:3a:f9:a4:
                    3f:17:83:af:87:e5:a8:7a:ef:2c:c9:e2:2a:26:72:
                    87:78:65:43:34:0a:c9:24:ec:08:62:8c:05:27:86:
                    19:cd:4c:ea:b2:22:18:17:29:bd:28:e8:34:cd:d5:
                    09:13:fa:d1:54:74:89:88:14:14:0f:49:92:31:29:
                    c8:58:92:c6:e4:c2:ad:27:02:97:09:94:95:45:a9:
                    9b:95:3a:a0:35:cd:8f:a5:e3:20:96:71:25:59:75:
                    90:5f:ae:74:3b:76:45:8a:3e:cf:4c:73:b0:63:11:
                    7c:9a:d4:0c:0f:1f:d4:00:6d:ba:24:ae:7b:dd:8d:
                    e5:5d:82:16:01:22:de:b9:9c:15:de:72:4b:53:f4:
                    24:27:c4:a2:f2:2a:69:e8:1f:f3:f8:b8:db:62:a1:
                    6f:45:9d:56:86:56:02:a7:67:76:5d:95:f5:ae:85:
                    77:0a:c9:0e:1f:a8:1d:43:7f:66:37:a5:47:6a:1e:
                    e4:56:85:f7:61:df:0b:9a:13:8b:23:61:cf:e0:19:
                    e1:b9:55:d1:c6:52:38:25:33:74:95:ae:27:2b:eb:
                    d4:10:b1:a4:17:76:a1:73:80:58:08:d6:b4:45:87:
                    e3:34:c3:3b:87:3c:64:8d:06:fe:8e:3e:68:45:82:
                    d8:e1
                Exponent: 65537 (0x10001)
    Signature Algorithm: sha256WithRSAEncryption
        80:3c:d8:04:1d:01:18:ef:2b:9d:ec:de:d8:8a:ad:d2:65:e0:
        b3:af:29:5f:27:df:de:1a:c2:9a:9b:00:13:d7:b6:3c:56:10:
        8a:6b:e3:0c:45:da:db:9d:2f:96:12:f9:f5:24:7f:78:0a:68:
 16 total 32
        98:c8:9f:5e:5c:a0:52:b4:eb:0b:db:9f:c2:38:45:1f:26:29:
        32:1e:ca:38:95:11:6b:e9:79:ab:e4:d5:75:05:01:4a:1c:1e:
        f8:7d:8b:a0:6d:3b:71:c9:9d:95:46:aa:91:ab:bd:bd:24:5a:
        2d:56:c0:98:2b:08:6f:08:3f:6e:65:34:43:ff:da:7f:28:8a:
        34:be:15:4e:2f:54:e1:23:06:43:f7:57:02:2a:fd:99:05:59:
        78:fd:77:22:b6:6b:8f:88:e3:97:ca:95:c5:de:2f:02:9e:70:
        5e:4c:96:df:82:0a:5a:27:74:cf:26:cd:82:1f:70:37:55:3c:
        c9:96:3d:41:da:52:33:dd:e2:5e:db:75:0a:7a:9d:08:c0:6c:
        59:d6:cc:14:ba:85:92:35:3b:44:37:32:41:4a:13:5e:71:75:
        0a:cb:4f:8a:d9:76:d1:0c:7f:c0:b9:f9:2d:0c:a0:39:06:bb:
        d6:c6:ae:6a:15:0c:45:c1:e3:ed:66:59:d5:f3:bb:df:d8:ae:
        66:a5:05:0f
-----BEGIN CERTIFICATE-----
MIIDdDCCAlwCCQDAS8GimsC7jDANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJK
UDEOMAwGA1UECBMFVG9reW8xEjAQBgNVBAoTCWhlamRhLm9yZzEUMBIGA1UECxML
RGV2ZWxvcG1lbnQxFDASBgNVBAMUCyouaGVqZGEub3JnMR0wGwYJKoZIhvcNAQkB
Fg5pbmZvQGhlamRhLm9yZzAeFw0xNjA5MjAxNjIyMjdaFw0yNjA5MTgxNjIyMjda
MHwxCzAJBgNVBAYTAkpQMQ4wDAYDVQQIEwVUb2t5bzESMBAGA1UEChMJaGVqZGEu
b3JnMRQwEgYDVQQLEwtEZXZlbG9wbWVudDEUMBIGA1UEAxQLKi5oZWpkYS5vcmcx
HTAbBgkqhkiG9w0BCQEWDmluZm9AaGVqZGEub3JnMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAsdsAUmRjedVB7KM6+aQ/F4Ovh+Woeu8syeIqJnKHeGVD
NArJJOwIYowFJ4YZzUzqsiIYFym9KOg0zdUJE/rRVHSJiBQUD0mSMSnIWJLG5MKt
JwKXCZSVRamblTqgNc2PpeMglnElWXWQX650O3ZFij7PTHOwYxF8mtQMDx/UAG26
JK573Y3lXYIWASLeuZwV3nJLU/QkJ8Si8ipp6B/z+LjbYqFvRZ1WhlYCp2d2XZX1
roV3CskOH6gdQ39mN6VHah7kVoX3Yd8LmhOLI2HP4BnhuVXRxlI4JTN0la4nK+vU
ELGkF3ahc4BYCNa0RYfjNMM7hzxkjQb+jj5oRYLY4QIDAQABMA0GCSqGSIb3DQEB
CwUAA4IBAQCAPNgEHQEY7yud7N7Yiq3SZeCzrylfJ9/eGsKamwAT17Y8VhCKa+MM
RdrbnS+WEvn1JH94CmiYyJ9eXKBStOsL25/COEUfJikyHso4lRFr6Xmr5NV1BQFK
HB74fYugbTtxyZ2VRqqRq729JFotVsCYKwhvCD9uZTRD/9p/KIo0vhVOL1ThIwZD
91cCKv2ZBVl4/XcitmuPiOOXypXF3i8CnnBeTJbfggpaJ3TPJs2CH3A3VTzJlj1B
2lIz3eJe23UKep0IwGxZ1swUuoWSNTtENzJBShNecXUKy0+K2XbRDH/AufktDKA5
BrvWxq5qFQxFwePtZlnV87vf2K5mpQUP
-----END CERTIFICATE-----






```
