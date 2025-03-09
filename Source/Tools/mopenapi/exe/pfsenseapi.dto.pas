unit pfsenseapi.dto;

{$I mormot.defines.inc}

interface

{
  ------------------------------------------------------------------
  PFSENSE REST API DOCUMENTATION DTOs

  Generated 8 Mar 2025 by igor via mopenapi - DO NOT MODIFY BY HAND!
  ------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.rtti,
  mormot.core.json;

type

{ ************ Enumerations and Sets }

  // The LDAP search scope. Use `one` to limit the scope to a single level, or `subtree`
  // to allow the entire subtree to be searched.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
  TEnumPfsenseapi1 = (
    epNone, epOne, epSubtree);
  // The encryption mode to use when connecting to this authentication server. Use
  // `Standard TCP` for unencrypted LDAP connections, use `STARTTLS Encrypt` to
  // start an encrypted connection via STARTTLS if it's available, or `SSL/TLS Encrypted`
  // to only use LDAPS encrypted connections.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
  TEnumPfsenseapi2 = (
    ep2None, ep2SSLTLSEncrypted, ep2STARTTLSEncrypt, ep2StandardTCP);
  // The RADIUS protocol to use when authenticating.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'radius'`<br>
  TEnumPfsenseapi3 = (
    ep3None, ep3CHAPMD5, ep3MSCHAPv1, ep3MSCHAPv2, ep3PAP);
  // The type of this authentication server.<br>
  TEnumPfsenseapi4 = (
    ep4None, ep4Ldap, ep4Radius);
  // Enable DNSSEC validation when BIND is acting as a recursive resolver.<br>
  TEnumPfsenseapi5 = (
    ep5None, ep5Auto, ep5Off, ep5On);
  // The IP version to use for the BIND service. Leave empty to use both IPv4 and
  // IPv6.<br>
  TEnumPfsenseapi6 = (
    ep6None, ep61, ep64, ep66);
  TEnumPfsenseapi7 = (
    ep7None, ep7Client, ep7Config, ep7Database, ep7Default, ep7Dispatch, ep7Dnssec,
    ep7General, ep7LameServers, ep7Network, ep7Notify, ep7Queries, ep7Resolver,
    ep7Security, ep7Unmatched, ep7Update, ep7XferIn, ep7XferOut);
  TEnumPfsenseapi7Set = set of TEnumPfsenseapi7;
  // The minimum severity of events to log.<br>
  TEnumPfsenseapi8 = (
    ep8None, ep8Critical, ep8Debug1, ep8Debug3, ep8Debug5, ep8Dynamic, ep8Error,
    ep8Info, ep8Notice, ep8Warning);
  // The protocol to use for syncing.<br>
  TEnumPfsenseapi9 = (
    ep9None, ep9Http, ep9Https);
  // The sync mode to use.<br>
  TEnumPfsenseapi10 = (
    ep10None, ep10Auto, ep10Disabled, ep10Manual);
  // The type of this BIND zone.<br>
  TEnumPfsenseapi11 = (
    ep11None, ep11Forward, ep11Master, ep11Redirect, ep11Slave);
  // The type of record.<br>
  TEnumPfsenseapi12 = (
    ep12None, ep12A, ep12AAAA, ep12CNAME, ep12LOC, ep12MX, ep12NS, ep12PTR,
    ep12SPF, ep12SRV, ep12TXT);
  // The certificate type. Use `server` when this certificate is to be used by one
  // or more services on this system. Use `user` when this certificate is intended
  // to be assigned to a user for authentication purposes.<br>
  TEnumPfsenseapi13 = (
    ep13None, ep13Server, ep13User);
  // The type of key pair to generate.<br>
  TEnumPfsenseapi14 = (
    ep14None, ep14ECDSA, ep14RSA);
  // The level of encryption to use when exporting the PKCS#12 archive.<br>
  TEnumPfsenseapi15 = (
    ep15None, ep15High, ep15Legacy, ep15Low);
  // The method used to generate this CRL.<br>
  TEnumPfsenseapi16 = (
    ep16None, ep16Existing, ep16Internal);
  // The authentication mechanism to use for the SMTP connection.<br>
  TEnumPfsenseapi17 = (
    ep17None, ep17LOGIN, ep17PLAIN);
  // Sets the type of alias this object will be. This directly impacts what values
  // can be
  // specified in the `address` field.<br>
  TEnumPfsenseapi18 = (
    ep18None, ep18Host, ep18Network, ep18Port);
  // The direction of traffic this firewall rule applies to. This field only applies
  // to floating firewall rules.<br><br>This field is only available when the following
  // conditions are met:<br>- `floating` must be equal to `true`<br>
  TEnumPfsenseapi19 = (
    ep19None, ep19Any, ep19In, ep19Out);
  TEnumPfsenseapi20 = (
    ep20None, ep20Althost, ep20Any, ep20Dataconv, ep20Echorep, ep20Echoreq,
    ep20Inforep, ep20Inforeq, ep20Ipv6Here, ep20Ipv6Where, ep20Maskrep,
    ep20Maskreq, ep20Mobredir, ep20Mobregrep, ep20Mobregreq, ep20Paramprob,
    ep20Photuris, ep20Redir, ep20Routeradv, ep20Routersol, ep20Skip, ep20Squench,
    ep20Timerep, ep20Timereq, ep20Timex, ep20Trace, ep20Unreach);
  TEnumPfsenseapi20Set = set of TEnumPfsenseapi20;
  // The IP version(s) this rule applies to.<br>
  TEnumPfsenseapi21 = (
    ep21None, ep21Inet, ep21Inet46, ep21Inet6);
  // The IP/transport protocol this rule should match.<br>
  TEnumPfsenseapi22 = (
    ep22None, ep22Ah, ep22Carp, ep22Esp, ep22Gre, ep22Icmp, ep22Igmp, ep22Ipv6,
    ep22Ospf, ep22Pfsync, ep22Pim, ep22Tcp, ep22TcpUdp, ep22Udp);
  // The state mechanism to use for this firewall rule.<br>
  TEnumPfsenseapi23 = (
    ep23None, ep23KeepState, ep23None2, ep23SloppyState, ep23SynproxyState);
  TEnumPfsenseapi24 = (
    ep24None, ep24Ack, ep24Cwr, ep24Ece, ep24Fin, ep24Psh, ep24Rst, ep24Syn,
    ep24Urg);
  TEnumPfsenseapi24Set = set of TEnumPfsenseapi24;
  // The action to take against traffic that matches this rule.<br>
  TEnumPfsenseapi25 = (
    ep25None, ep25Block, ep25Pass, ep25Reject);
  // The LACP timeout mode to use.<br><br>This field is only available when the
  // following conditions are met:<br>- `proto` must be equal to `'lacp'`<br>
  TEnumPfsenseapi26 = (
    ep26None, ep26Fast, ep26Slow);
  // The LAGG hash algorithm to use.<br><br>This field is only available when the
  // following conditions are met:<br>- `proto` must be one of [ lacp, loadbalance
  // ]<br>
  TEnumPfsenseapi27 = (
    ep27None, ep27L2, ep27L2L3, ep27L2L3L4, ep27L2L4, ep27L3, ep27L3L4, ep27L4);
  // The LAGG protocol to use.<br>
  TEnumPfsenseapi28 = (
    ep28None, ep28Failover, ep28Lacp, ep28Loadbalance, ep28None4, ep28Roundrobin);
  // The format of the log entries.<br>
  TEnumPfsenseapi29 = (
    ep29None, ep29Rfc3164, ep29Rfc5424);
  // The IP protocol to use for remote logging.<br><br>This field is only available
  // when the following conditions are met:<br>- `enableremotelogging` must be equal
  // to `true`<br>
  TEnumPfsenseapi30 = (
    ep30None, ep30Ipv4, ep30Ipv6);
  // The type of compression to use for log files.<br>
  TEnumPfsenseapi31 = (
    ep31None, ep31Bzip2, ep31Gzip, ep31None3, ep31Xz, ep31Zstd);
  // The IP protocol peers are forced to use for DNS resolution.<br>
  TEnumPfsenseapi32 = (
    ep32None, ep32Auto, ep32Inet, ep32Inet6);
  // The maximum poll interval for NTP messages. Use empty string to assume system
  // default, and `omit` to not set this value. This value must be greater than
  // the `ntpminpoll`.<br>
  TEnumPfsenseapi33 = (
    ep33None, ep331, ep3310, ep3311, ep3312, ep3313, ep3314, ep3315, ep3316,
    ep3317, ep333, ep334, ep335, ep336, ep337, ep338, ep339, ep33Omit);
  // The digest algorithm for the server authentication key.<br>
  TEnumPfsenseapi34 = (
    ep34None, ep34Md5, ep34Sha1, ep34Sha256);
  // The type of this timeserver. Use `server` is `timeserver` is a standalone NTP
  // server, use `pool` if `timeserver` represents an NTP pool, or `peer` if `timeserver`
  // is an NTP peer. Note: If the `timeserver` value ends with the `pool.ntp.org`
  // suffix, this field will be forced to use `pool`.<br>
  TEnumPfsenseapi35 = (
    ep35None, ep35Peer, ep35Pool, ep35Server);
  // Selects the advanced DHCP timing preset.<br><br>This field is only available
  // when the following conditions are met:<br>- `typev4` must be equal to `'dhcp'`<br>-
  // `adv_dhcp_config_advanced` must be equal to `true`<br>
  TEnumPfsenseapi36 = (
    ep36None, ep36SavedCfg);
  // Selects the IPv4 address type to assign this interface.<br>
  TEnumPfsenseapi37 = (
    ep37None, ep37Dhcp, ep37None2, ep37Static);
  // Selects the IPv6 address type to assign this interface.<br>
  TEnumPfsenseapi38 = (
    ep38None, ep386rd, ep386to4, ep38Dhcp6, ep38None4, ep38Slaac, ep38Staticv6,
    ep38Track6);
  // The IP version this mapping applies to.<br>
  TEnumPfsenseapi39 = (
    ep39None, ep39Inet, ep39Inet6);
  // Enables or disables NAT reflection for traffic matching this mapping. Set to
  // `null` to use the system default.<br>
  TEnumPfsenseapi40 = (
    ep40None, ep40Disable, ep40Enable);
  // The compression mode allowed by this OpenVPN client. Compression can potentially
  // increase throughput but may allow an attacker to extract secrets if they can
  // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
  TEnumPfsenseapi41 = (
    ep41None, ep41Asym, ep41No, ep41Yes);
  // The gateway type(s) that will be created when a virtual interface is assigned
  // to this OpenVPN server<br>
  TEnumPfsenseapi42 = (
    ep42None, ep42Both, ep42V4only, ep42V6only);
  // The carrier mode for this OpenVPN client. `tun` mode carries IPv4 and IPv6
  // (layer 3) and is the most common and compatible mode across all platforms.
  // `tap` mode is capable of carrying 802.3 (layer 2).<br>
  TEnumPfsenseapi43 = (
    ep43None, ep43Tap, ep43Tun);
  // The number of times this client will attempt to send an exit notifications.<br>
  TEnumPfsenseapi44 = (
    ep44None, ep441, ep442, ep443, ep444, ep445, ep44None6);
  // The OpenVPN client mode.<br>
  TEnumPfsenseapi45 = (
    ep45None, ep45P2pTls);
  // The action to take after a ping to the remote peer times-out.<br><br>This field
  // is only available when the following conditions are met:<br>- `ping_method`
  // must be equal to `'ping'`<br>
  TEnumPfsenseapi46 = (
    ep46None, ep46PingExit, ep46PingRestart);
  // The method used to define ping configuration.<br>
  TEnumPfsenseapi47 = (
    ep47None, ep47Keepalive, ep47Ping);
  // The protocol used by this OpenVPN client.<br>
  TEnumPfsenseapi48 = (
    ep48None, ep48TCP, ep48TCP4, ep48TCP6, ep48UDP, ep48UDP4, ep48UDP6);
  // The type of authentication used by the proxy server.<br>
  TEnumPfsenseapi49 = (
    ep49None, ep49Basic, ep49None2, ep49Ntlm);
  // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
  // for the control channel, protecting the peers from unauthorized connections.
  // The `crypt` mode encrypts the control channel communication in addition to
  // providing authentication, providing more privacy and traffic control channel
  // obfuscation.<br><br>This field is only available when the following conditions
  // are met:<br>- `tls` must not be equal to `NULL`<br>
  TEnumPfsenseapi50 = (
    ep50None, ep50Auth, ep50Crypt);
  // The TLS key direction. This must be set to complementary values on the client
  // and client. For example, if the client is set to 0, the client must be set
  // to 1. Both may be set to omit the direction, in which case the TLS Key will
  // be used bidirectionally.<br><br>This field is only available when the following
  // conditions are met:<br>- `tls` must not be equal to `NULL`<br>
  TEnumPfsenseapi51 = (
    ep51None, ep510, ep511, ep512, ep51Default);
  // The method used to supply a virtual adapter IP address to clients when using
  // TUN mode on IPv4.<br><br>This field is only available when the following conditions
  // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
  TEnumPfsenseapi52 = (
    ep52None, ep52Net30, ep52Subnet);
  // The OpenVPN server mode.<br>
  TEnumPfsenseapi53 = (
    ep53None, ep53P2pTls, ep53ServerTls, ep53ServerTlsUser, ep53ServerUser);
  // The pool option used to load balance external IP mapping when `target` is set
  // to a subnet or alias of many addresses. Set to `null` to revert to the system
  // default.<br><br>This field is only available when the following conditions
  // are met:<br>- `nonat` must be equal to `false`<br>
  TEnumPfsenseapi54 = (
    ep54None, ep54Bitmask, ep54Random, ep54RandomStickyAddress, ep54RoundRobin,
    ep54RoundRobinStickyAddress, ep54SourceHash);
  // The protocol this rule should match. Use `null` for any protocol.<br>
  TEnumPfsenseapi55 = (
    ep55None, ep55Ah, ep55Esp, ep55Gre, ep55Icmp, ep55Igmp, ep55Ipv6, ep55Ospf,
    ep55Pim, ep55Tcp, ep55TcpUdp, ep55Udp);
  // The outbound NAT mode to assign this system. Set to `automatic` to have this
  // system automatically generate NAT rules this firewall, `hybrid` to automatically
  // generate NAT rules AND allow manual outbound NAT mappings to be assigned, `manual`
  // to prevent the system from automatically generating NAT rules and only allow
  // manual outbound NAT mappings, or `disabled` to disable outbound NAT on this
  // system entirely.<br>
  TEnumPfsenseapi56 = (
    ep56None, ep56Advanced, ep56Automatic, ep56Disabled, ep56Hybrid);
  // The NAT reflection mode to use for traffic matching this port forward rule.
  // Set to `null` to use the system default.<br>
  TEnumPfsenseapi57 = (
    ep57None, ep57Disable, ep57Enable, ep57Purenat);
  // The type of access this entry provides. "allow" entries permit access to the
  // REST API from the specified networks. "deny" entries block access to the REST
  // API from the specified networks.<br>
  TEnumPfsenseapi58 = (
    ep58None, ep58Allow, ep58Deny);
  // The hash algorithm used for this API key. It is recommended to increase the
  // strength of the algorithm for keys assigned to privileged users.<br>
  TEnumPfsenseapi59 = (
    ep59None, ep59Sha256, ep59Sha384, ep59Sha512);
  // Specifies how the API should represent interface names. Use `descr` to represent
  // interface objects by their description name, use `id` to represent interface
  // objects by their
  // internal pfSense ID (e.g. wan, lan, opt1), or use `if` to represent interface
  // objects by their
  // real interface name (e.g. em0, igb1, bxe3).<br>
  TEnumPfsenseapi60 = (
    ep60None, ep60Descr, ep60Id, ep60If);
  // Controls the state killing behavior when this specific gateway goes down. Killing
  // states for specific down gateways only affects states created by policy routing
  // rules and reply-to. Has no effect if gateway monitoring or its action are disabled
  // or if the gateway is forced down. May not have any effect on dynamic gateways
  // during a link loss event.<br>
  TEnumPfsenseapi61 = (
    ep61None, ep611, ep61Down, ep61None3);
  // The trigger that will cause a gateway to be excluded from the group.<br>
  TEnumPfsenseapi62 = (
    ep62None, ep62Down, ep62Downlatency, ep62Downloss, ep62Downlosslatency);
  // The SSH authentication mode to use. Use `enabled` to require public key authentication,
  // use both to require both a public key AND a password, or use `null` to allow
  // a password OR a public key.<br>
  TEnumPfsenseapi63 = (
    ep63None, ep63Both, ep63Enabled);
  // The action to perform against this service.<br>
  TEnumPfsenseapi64 = (
    ep64None, ep64Restart, ep64Start, ep64Stop);
  // Use local DNS server (DNS Resover or DNS Forwarder) as the primary DNS, or
  // use only remote DNS servers specified in `dnsserver`. Set to `null` to use
  // local DNS server as the primary and remote DNS servers as backup.<br>
  TEnumPfsenseapi65 = (
    ep65None, ep65Local, ep65Remote);
  // The scale type of the `bandwidth` field's value.<br>
  TEnumPfsenseapi66 = (
    ep66None, ep661, ep66Gb, ep66Kb, ep66Mb, ep66B);
  // The scheduler type to use for this traffic shaper. Changing this value will
  // automatically update any child queues assigned to this traffic shaper.<br>
  TEnumPfsenseapi67 = (
    ep67None, ep67CBQ, ep67CODELQ, ep67FAIRQ, ep67HFSC, ep67PRIQ);
  // The Active Queue Management (AQM) algorithm to use for this limiter. AQM is
  // the intelligent drop of network packets inside the limiter, when it becomes
  // full or gets close to becoming full, with the goal of reducing network congestion.<br>
  TEnumPfsenseapi68 = (
    ep68None, ep68Codel, ep68Droptail, ep68Gred, ep68Pie, ep68Red);
  // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
  // delay, packet loss and queue size given above will be created for each source/destination
  // IP address encountered, respectively. This makes it possible to easily specify
  // bandwidth limits per host or subnet.<br>
  TEnumPfsenseapi69 = (
    ep69None, ep69Dstaddress, ep69None2, ep69Srcaddress);
  // The scheduler to use for this limiter. The scheduler manages the sequence of
  // network packets in the limiter's queue.<br>
  TEnumPfsenseapi70 = (
    ep70None, ep70Fifo, ep70FqCodel, ep70FqPie, ep70Prio, ep70Qfq, ep70Rr,
    ep70Wf2q);
  // The scale factor of the `bw` fields value.<br>
  TEnumPfsenseapi71 = (
    ep71None, ep71Kb, ep71Mb, ep71B);
  // The CARP mode to use for this virtual IP. Please note this field is exclusive
  // to pfSense Plus and has no effect on CE.<br><br>This field is only available
  // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
  TEnumPfsenseapi72 = (
    ep72None, ep72Mcast, ep72Ucast);
  // The virtual IP mode to use for this virtual IP.<br>
  TEnumPfsenseapi73 = (
    ep73None, ep73Carp, ep73Ipalias, ep73Other, ep73Proxyarp);
  // The virtual IP scope type. The `network` option is only applicable to the `proxyarp`
  // and `other` virtual IP modes.<br>
  TEnumPfsenseapi74 = (
    ep74None, ep74Network, ep74Single);
  TEnumPfsenseapi75 = (
    ep75None, ep75SORTASC, ep75SORTDESC);
  TEnumPfsenseapi76 = (
    ep76None, ep76SORTFLAGCASE, ep76SORTLOCALESTRING, ep76SORTNATURAL, ep76SORTNUMERIC,
    ep76SORTREGULAR, ep76SORTSTRING);


{ ************ Data Transfert Objects }

  TARPTable = packed record
    // The full DNS name associated with this ARP entry.<br>
    Dnsresolve: RawUtf8;
    // The expiration time for this ARP entry.<br>
    Expires: RawUtf8;
    // The hostname associated with the ARP entry.<br>
    Hostname: RawUtf8;
    // The interface where the ARP entry was registered.<br>
    _Interface: RawUtf8;
    // The IP address associated with the ARP entry.<br>
    IpAddress: RawUtf8;
    // The MAC address associated with the ARP entry.<br>
    MacAddress: RawUtf8;
    // Indicates whether the ARP entry is permanent in the ARP table.<br>
    Permanent: boolean;
    // The type of connection this host utilizes.<br>
    _Type: RawUtf8;
  end;
  PARPTable = ^TARPTable;

  TAuthServer = packed record
    // The remote IP address or hostname of the authentication server.<br>
    Host: RawUtf8;
    // Enables or disables unauthenticated binding. Unauthenticated binds are bind
    // with an existing login but with an empty password. Some LDAP servers (Microsoft
    // AD) allow this type of bind without any possibility to disable it.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>
    LdapAllowUnauthenticated: boolean;
    // The LDAP group attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrGroup: RawUtf8;
    // The group object class for groups in RFC2307 mode.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be equal
    // to `'ldap'`<br>- `ldap_rfc2307` must be equal to `true`<br>
    LdapAttrGroupobj: RawUtf8;
    // The LDAP member attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrMember: RawUtf8;
    // The LDAP user attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrUser: RawUtf8;
    // The LDAP authentication container.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAuthcn: RawUtf8;
    // The root for LDAP searches on this authentication server.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapBasedn: RawUtf8;
    // The DN to use when binding to this authentication server. Set to `null` to
    // bind anonymously.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapBinddn: RawUtf8;
    // The password to use when binding to this authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>- `ldap_binddn` must not be equal to `NULL`<br>
    LdapBindpw: RawUtf8;
    // The certificate authority used to validate the LDAP server certificate.<br><br>This
    // field is only available when the following conditions are met:<br>- `ldap_urltype`
    // must be one of [ starttls, encrypted ]<br>
    LdapCaref: RawUtf8;
    // Enable LDAP extended queries.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapExtendedEnabled: boolean;
    // The extended LDAP query to make during LDAP searches.<br><br>This field is
    // only available when the following conditions are met:<br>- `type` must be equal
    // to `'ldap'`<br>- `ldap_extended_enabled` must be equal to `true`<br>
    LdapExtendedQuery: RawUtf8;
    // Do not strip away parts of the username after the @ symbol.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapNostripAt: boolean;
    // The group DN to use for shell authentication. Users must be a member of this
    // group and have valid posixAccount attributes to sign in.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapPamGroupdn: RawUtf8;
    // The LDAP port to connect to on this LDAP authentication server. Valid options
    // are: a TCP/UDP port number<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapPort: RawUtf8;
    // The LDAP protocol version to use for connections to this LDAP authentication
    // server.<br><br>This field is only available when the following conditions are
    // met:<br>- `type` must be equal to `'ldap'`<br>
    LdapProtver: integer;
    // Enables or disable RFC2307 LDAP options.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapRfc2307: boolean;
    // Enables or disable the use of DNs for username searches.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>- `ldap_rfc2307` must be equal to `true`<br>
    LdapRfc2307Userdn: boolean;
    // The LDAP search scope. Use `one` to limit the scope to a single level, or `subtree`
    // to allow the entire subtree to be searched.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapScope: TEnumPfsenseapi1;
    // The timeout (in seconds) for connections to the LDAP authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>
    LdapTimeout: integer;
    // The encryption mode to use when connecting to this authentication server. Use
    // `Standard TCP` for unencrypted LDAP connections, use `STARTTLS Encrypt` to
    // start an encrypted connection via STARTTLS if it's available, or `SSL/TLS Encrypted`
    // to only use LDAPS encrypted connections.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapUrltype: TEnumPfsenseapi2;
    // Enables or disables UTF-8 encoding LDAP parameters before sending them to this
    // authentication server<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapUtf8: boolean;
    // The descriptive name for this authentication server.<br>
    Name: RawUtf8;
    // The port used by RADIUS for accounting. Set to `null` to disable use of accounting
    // services. Valid options are: a TCP/UDP port number<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be equal
    // to `'radius'`<br>
    RadiusAcctPort: RawUtf8;
    // The port used by RADIUS for authentication. Set to `null` to disable use of
    // authentication services. Valid options are: a TCP/UDP port number<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusAuthPort: RawUtf8;
    // The interface whose IP will be used as the 'NAS-IP-Address' attribute during
    // RADIUS Access-Requests. This choice will not change the interface used for
    // contacting the RADIUS server.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be equal to `'radius'`<br>
    RadiusNasipAttribute: RawUtf8;
    // The RADIUS protocol to use when authenticating.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'radius'`<br>
    RadiusProtocol: TEnumPfsenseapi3;
    // The shared secret to use when authenticating to this RADIUS server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusSecret: RawUtf8;
    // The timeout (in seconds) for connections to this RADIUS authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusTimeout: integer;
    // The unique reference ID for this authentication server. This value is only
    // used internally and cannot be manually set or changed.<br>
    Refid: RawUtf8;
    // The type of this authentication server.<br>
    _Type: TEnumPfsenseapi4;
  end;
  PAuthServer = ^TAuthServer;

  TAuthenticationError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PAuthenticationError = ^TAuthenticationError;

  TAvailableInterface = packed record
    // The description of the interface.<br>
    Dmesg: RawUtf8;
    // The name of the interface.<br>
    _If: RawUtf8;
    // The pfSense interface ID that is using this interface.<br>
    InUseBy: RawUtf8;
    // The MAC address of the interface.<br>
    Mac: RawUtf8;
  end;
  PAvailableInterface = ^TAvailableInterface;

  TAvailablePackage = packed record
    // Dependencies for this package that are also installed when this package is
    // installed.<br>
    Deps: TRawUtf8DynArray;
    // The package's description.<br>
    Descr: RawUtf8;
    // Indicates whether the package is currently installed or not.<br>
    Installed: boolean;
    // The name of the pfSense package.<br>
    Name: RawUtf8;
    // The package's shortname.<br>
    Shortname: RawUtf8;
    // The latest version available for this package.<br>
    Version: RawUtf8;
  end;
  PAvailablePackage = ^TAvailablePackage;

  TBINDAccessList = packed record
    // A description for the access list.<br>
    Description: RawUtf8;
    // The network entries for this access list.<br>
    Entries: variant;
    // The name of the access list.<br>
    Name: RawUtf8;
  end;
  PBINDAccessList = ^TBINDAccessList;

  TBINDAccessListEntry = packed record
    // A description of the access list entry.<br>
    Description: RawUtf8;
    // The network CIDR to allow.<br>
    Value: RawUtf8;
  end;
  PBINDAccessListEntry = ^TBINDAccessListEntry;

  TBINDSettings = packed record
    // Custom BIND options to include in the configuration file.<br>
    BindCustomOptions: RawUtf8;
    // Enable DNSSEC validation when BIND is acting as a recursive resolver.<br>
    BindDnssecValidation: TEnumPfsenseapi5;
    // Enable forwarding queries to other DNS servers listed below rather than this
    // server performing its own recursion.<br>
    BindForwarder: boolean;
    // The IP addresses of the DNS servers to forward queries to.<br><br>This field
    // is only available when the following conditions are met:<br>- `bind_forwarder`
    // must be equal to `true`<br>
    BindForwarderIps: TRawUtf8DynArray;
    // Global BIND settings to include in the configuration file.<br>
    BindGlobalSettings: RawUtf8;
    // Hide the BIND version in responses.<br>
    BindHideVersion: boolean;
    // The IP version to use for the BIND service. Leave empty to use both IPv4 and
    // IPv6.<br>
    BindIpVersion: TEnumPfsenseapi6;
    // Enable logging for the BIND service.<br>
    BindLogging: boolean;
    // Notify slave server after any update on master.<br>
    BindNotify: boolean;
    // The maximum amount of RAM to use for the BIND service.<br>
    BindRamLimit: RawUtf8;
    // The TCP port to listen on for control requests (localhost only). Valid options
    // are: a TCP/UDP port number<br>
    Controlport: RawUtf8;
    // Enables the BIND service.<br>
    EnableBind: boolean;
    // The interfaces to listen on for DNS requests.<br>
    Listenon: TRawUtf8DynArray;
    // The TCP and UDP port to listen on for DNS requests. Valid options are: a TCP/UDP
    // port number<br>
    Listenport: RawUtf8;
    // When rate limiting, only log that the query limit has been exceeded. If disabled,
    // the query will be dropped instead.<br>
    LogOnly: boolean;
    // The categories to log.<br>
    LogOptions: TEnumPfsenseapi7Set;
    // The minimum severity of events to log.<br>
    LogSeverity: TEnumPfsenseapi8;
    // Enable rate limiting for the BIND service.<br>
    RateEnabled: boolean;
    // The maximum number of queries per second to allow.<br><br>This field is only
    // available when the following conditions are met:<br>- `rate_enabled` must be
    // equal to `true`<br>
    RateLimit: integer;
  end;
  PBINDSettings = ^TBINDSettings;

  TBINDSyncRemoteHost = packed record
    // The IP address/hostname of the remote host.<br>
    Ipaddress: RawUtf8;
    // The password to use to authenticate when syncing.<br>
    Password: RawUtf8;
    // Enable this remote host for syncing.<br>
    Syncdestinenable: boolean;
    // The remote host port to use for syncing. Valid options are: a TCP/UDP port
    // number<br>
    Syncport: RawUtf8;
    // The protocol to use for syncing.<br>
    Syncprotocol: TEnumPfsenseapi9;
    // The username to use to authenticate when syncing.<br>
    Username: RawUtf8;
  end;
  PBINDSyncRemoteHost = ^TBINDSyncRemoteHost;

  TBINDSyncSettings = packed record
    // The IP address of the master BIND server.<br>
    Masterip: RawUtf8;
    // The sync mode to use.<br>
    Synconchanges: TEnumPfsenseapi10;
    // The timeout for the sync process.<br>
    Synctimeout: integer;
  end;
  PBINDSyncSettings = ^TBINDSyncSettings;

  TBINDView = packed record
    // The access lists to allow recursion for.<br>
    AllowRecursion: TRawUtf8DynArray;
    // Custom BIND options for the view.<br>
    BindCustomOptions: RawUtf8;
    // A description for the view.<br>
    Descr: RawUtf8;
    // The access lists to match clients against.<br>
    MatchClients: TRawUtf8DynArray;
    // The name of the view.<br>
    Name: RawUtf8;
    // Enables or disables recursion for the view.<br>
    Recursion: boolean;
  end;
  PBINDView = ^TBINDView;

  TBINDZone = packed record
    // The access lists that are allowed to query this BIND zone.<br>
    Allowquery: TRawUtf8DynArray;
    // The access lists that are allowed to transfer this BIND zone.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'master'`<br>
    Allowtransfer: TRawUtf8DynArray;
    // The access lists that are allowed to submit dynamic updates for 'master' zones
    // (e.g. dynamic DNS).<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'master'`<br>- `enable_updatepolicy`
    // must be equal to `false`<br>
    Allowupdate: TRawUtf8DynArray;
    // Enable backing up DNSSEC keys in the XML configuration for this BIND zone.<br><br>This
    // field is only available when the following conditions are met:<br>- `dnssec`
    // must be equal to `true`<br>
    Backupkeys: boolean;
    // The IP address of the base domain for this zone. This sets an A record for
    // the base domain.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'master'`<br>
    Baseip: RawUtf8;
    // Custom BIND options for this BIND zone.<br>
    Custom: RawUtf8;
    // Custom records for this BIND zone.<br>
    Customzonerecords: RawUtf8;
    // A description for this BIND zone.<br>
    Description: RawUtf8;
    // Disable this BIND zone.<br>
    Disabled: boolean;
    // Enable DNSSEC for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, slave
    // ]<br>
    Dnssec: boolean;
    // Enable a specific dynamic update policy for this BIND zone.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'master'`<br>
    EnableUpdatepolicy: boolean;
    // The SOA expiry interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Expire: integer;
    // The forwarders for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'forward'`<br>
    Forwarders: TRawUtf8DynArray;
    // The SOA email address (RNAME) for this zone. This must be in an FQDN format.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be one of [ master, redirect ]<br>
    Mail: RawUtf8;
    // The SOA minimum TTL interval (in seconds) for this zone. This is also referred
    // to as the negative TTL.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be one of [ master, redirect ]<br>
    Minimum: integer;
    // The name of this BIND zone.<br>
    Name: RawUtf8;
    // The SOA nameserver for this zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, redirect
    // ]<br>
    Nameserver: RawUtf8;
    // The records for this BIND zone.<br>
    Records: variant;
    // The SOA refresh interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Refresh: integer;
    // Register DHCP static mappings as records in this BIND zone.<br>
    Regdhcpstatic: boolean;
    // The SOA retry interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Retry: integer;
    // Enable reverse DNS for this BIND zone.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be one of [ master,
    // slave ]<br>
    Reversev4: boolean;
    // Enable reverse IPv6 DNS for this BIND zone.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be one of [ master,
    // slave ]<br>
    Reversev6: boolean;
    // Enable this zone as part of a response policy.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be one of [ master,
    // slave ]<br>
    Rpz: boolean;
    // The SOA serial number for this zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, redirect
    // ]<br>
    Serial: integer;
    // The IP address of the slave server for this BIND zone.<br><br>This field is
    // only available when the following conditions are met:<br>- `type` must be equal
    // to `'slave'`<br>
    Slaveip: RawUtf8;
    // The default TTL interval (in seconds) for records within this BIND zone without
    // a specific TTL.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'master'`<br>
    Ttl: integer;
    // The type of this BIND zone.<br>
    _Type: TEnumPfsenseapi11;
    // The update policy for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'master'`<br>-
    // `enable_updatepolicy` must be equal to `true`<br>
    Updatepolicy: RawUtf8;
    // The views this BIND zone belongs to.<br>
    View: TRawUtf8DynArray;
  end;
  PBINDZone = ^TBINDZone;

  TBINDZoneRecord = packed record
    // The domain name for this record.<br>
    Name: RawUtf8;
    // The priority for this record.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be one of [ MX, SRV ]<br>
    Priority: integer;
    // The data for this record. This can be an IP address, domain name, or other
    // data depending on the record type.<br>
    Rdata: RawUtf8;
    // The type of record.<br>
    _Type: TEnumPfsenseapi12;
  end;
  PBINDZoneRecord = ^TBINDZoneRecord;

  TCARP = packed record
    // Enables or disables CARP on this system.<br>
    Enable: boolean;
    // Enables or disables CARP maintenance mode on this system.<br>
    MaintenanceMode: boolean;
  end;
  PCARP = ^TCARP;

  TCertificate = packed record
    // The unique ID of the existing pfSense Certificate Authority that signed this
    // certificate.This value is assigned by this system and cannot be changed.<br>
    Caref: RawUtf8;
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The X509 certificate signing request string if this certificate is pending
    // an external signature.<br>
    Csr: RawUtf8;
    // The descriptive name for this certificate.<br>
    Descr: RawUtf8;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The certificate type. Use `server` when this certificate is to be used by one
    // or more services on this system. Use `user` when this certificate is intended
    // to be assigned to a user for authentication purposes.<br>
    _Type: TEnumPfsenseapi13;
  end;
  PCertificate = ^TCertificate;

  TCertificateAuthority = packed record
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The descriptive name for this certificate authority.<br>
    Descr: RawUtf8;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // Enables or disables the randomization of serial numbers for certificates signed
    // by this CA.<br>
    Randomserial: boolean;
    // The unique ID assigned to this certificate authority for internal system use.
    // This value is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The decimal number to be used as a sequential serial number for the next certificate
    // to be signed by this CA. This value is ignored when Randomize Serial is checked.<br>
    Serial: integer;
    // Adds or removes this certificate authority from the operating system's trust
    // stored.<br>
    Trust: boolean;
  end;
  PCertificateAuthority = ^TCertificateAuthority;

  TCertificateAuthorityGenerate = packed record
    // The certificate authority to use as the parent for this intermediate certificate
    // authority.<br><br>This field is only available when the following conditions
    // are met:<br>- `is_intermediate` must be equal to `true`<br>
    Caref: RawUtf8;
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The descriptive name for this certificate authority.<br>
    Descr: RawUtf8;
    // The digest algorithm to use when signing certificates.<br>
    DigestAlg: RawUtf8;
    // The city for the certificate authority.<br>
    DnCity: RawUtf8;
    // The common name for the certificate authority.<br>
    DnCommonname: RawUtf8;
    // The country for the certificate authority.<br>
    DnCountry: RawUtf8;
    // The organization for the certificate authority.<br>
    DnOrganization: RawUtf8;
    // The organizational unit for the certificate authority.<br>
    DnOrganizationalunit: RawUtf8;
    // The state for the certificate authority.<br>
    DnState: RawUtf8;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: RawUtf8;
    // Indicates if this certificate authority is an intermediate certificate authority.<br>
    IsIntermediate: boolean;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfsenseapi14;
    // The number of days the certificate authority is valid for.<br>
    Lifetime: integer;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // Enables or disables the randomization of serial numbers for certificates signed
    // by this CA.<br>
    Randomserial: boolean;
    // The unique ID assigned to this certificate authority for internal system use.
    // This value is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The decimal number to be used as a sequential serial number for the next certificate
    // to be signed by this CA. This value is ignored when Randomize Serial is checked.<br>
    Serial: integer;
    // Adds or removes this certificate authority from the operating system's trust
    // stored.<br>
    Trust: boolean;
  end;
  PCertificateAuthorityGenerate = ^TCertificateAuthorityGenerate;

  TCertificateAuthorityRenew = packed record
    // The Certificate Authority to renew.<br>
    Caref: RawUtf8;
    // The new serial number of the Certificate Authority after the renewal.<br>
    Newserial: RawUtf8;
    // The old serial number of the Certificate Authority before the renewal.<br>
    Oldserial: RawUtf8;
    // Reuses the existing private key when renewing the certificate authority.<br>
    Reusekey: boolean;
    // Reuses the existing serial number when renewing the certificate authority.<br>
    Reuseserial: boolean;
    // Enforces strict security measures when renewing the certificate authority.<br>
    Strictsecurity: boolean;
  end;
  PCertificateAuthorityRenew = ^TCertificateAuthorityRenew;

  TCertificateGenerate = packed record
    // The certificate authority to use as the parent for this certificate.<br>
    Caref: RawUtf8;
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The descriptive name for this certificate.<br>
    Descr: RawUtf8;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: RawUtf8;
    // The city of the certificate.<br>
    DnCity: RawUtf8;
    // The common name of the certificate.<br>
    DnCommonname: RawUtf8;
    // The country of the certificate.<br>
    DnCountry: RawUtf8;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TRawUtf8DynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TRawUtf8DynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TRawUtf8DynArray;
    // The organization of the certificate.<br>
    DnOrganization: RawUtf8;
    // The organizational unit of the certificate.<br>
    DnOrganizationalunit: RawUtf8;
    // The state/province of the certificate.<br>
    DnState: RawUtf8;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TRawUtf8DynArray;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: RawUtf8;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfsenseapi14;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The type of certificate to generate.<br>
    _Type: TEnumPfsenseapi13;
  end;
  PCertificateGenerate = ^TCertificateGenerate;

  TCertificatePKCS12Export = packed record
    // The PKCS#12 archive binary data. This value cannot be changed.<br>
    BinaryData: RawUtf8;
    // The Certificate to export as a PKCS12 file.<br>
    Certref: RawUtf8;
    // The level of encryption to use when exporting the PKCS#12 archive.<br>
    Encryption: TEnumPfsenseapi15;
    // The filename used when exporting the PKCS#12 archive. This value cannot be
    // changed and will always be certificate refid with the .p12 extension.<br>
    Filename: RawUtf8;
    // The passphrase to use when exporting the PKCS#12 archive. Leave empty for no
    // passphrase.<br>
    Passphrase: RawUtf8;
  end;
  PCertificatePKCS12Export = ^TCertificatePKCS12Export;

  TCertificateRenew = packed record
    // The `refid` of the Certificate to renew.<br>
    Certref: RawUtf8;
    // The new serial number of the Certificate after the renewal.<br>
    Newserial: RawUtf8;
    // The old serial number of the Certificate before the renewal.<br>
    Oldserial: RawUtf8;
    // Reuses the existing private key when renewing the certificate.<br>
    Reusekey: boolean;
    // Reuses the existing serial number when renewing the certificate.<br>
    Reuseserial: boolean;
    // Enforces strict security measures when renewing the certificate.<br>
    Strictsecurity: boolean;
  end;
  PCertificateRenew = ^TCertificateRenew;

  TCertificateRevocationList = packed record
    // The unique ID of the CA that this CRL is associated with.<br>
    Caref: RawUtf8;
    // The list of revoked certificates in this CRL.<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Cert: variant;
    // The unique name/description for this CRL.<br>
    Descr: RawUtf8;
    // The lifetime of this CRL in days.<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Lifetime: integer;
    // The method used to generate this CRL.<br>
    Method: TEnumPfsenseapi16;
    // The unique ID for this CRL. This is automatically generated by the system and
    // cannot be changed.<br>
    Refid: RawUtf8;
    // The serial number of the CRL.<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Serial: integer;
    // The raw x509 CRL data.<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'existing'`<br>
    Text: RawUtf8;
  end;
  PCertificateRevocationList = ^TCertificateRevocationList;

  TCertificateRevocationListRevokedCertificate = packed record
    // The unique ID of the CA that signed the revoked certificate.<br>
    Caref: RawUtf8;
    // The reference ID of the certificate to be revoked<br><br>This field is only
    // available when the following conditions are met:<br>- `serial` must be equal
    // to `NULL`<br>
    Certref: RawUtf8;
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The unique name/description for this CRL.<br>
    Descr: RawUtf8;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // The CRL reason for revocation code.<br>
    Reason: integer;
    // The unix timestamp of when the certificate was revoked.<br>
    RevokeTime: integer;
    // The serial number of the certificate to be revoked.<br>
    Serial: RawUtf8;
    // The type of the certificate to be revoked.<br>
    _Type: RawUtf8;
  end;
  PCertificateRevocationListRevokedCertificate = ^TCertificateRevocationListRevokedCertificate;

  TCertificateSigningRequest = packed record
    // The X509 certificate signing request string. You will need to provide this
    // to a certificate authority to sign the certificate.<br>
    Csr: RawUtf8;
    // The descriptive name for this certificate.<br>
    Descr: RawUtf8;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: RawUtf8;
    // The city of the certificate.<br>
    DnCity: RawUtf8;
    // The common name of the certificate.<br>
    DnCommonname: RawUtf8;
    // The country of the certificate.<br>
    DnCountry: RawUtf8;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TRawUtf8DynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TRawUtf8DynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TRawUtf8DynArray;
    // The organization of the certificate.<br>
    DnOrganization: RawUtf8;
    // The organizational unit of the certificate.<br>
    DnOrganizationalunit: RawUtf8;
    // The state/province of the certificate.<br>
    DnState: RawUtf8;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TRawUtf8DynArray;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: RawUtf8;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfsenseapi14;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The type of certificate to generate.<br>
    _Type: TEnumPfsenseapi13;
  end;
  PCertificateSigningRequest = ^TCertificateSigningRequest;

  TCertificateSigningRequestSign = packed record
    // The certificate authority to sign the certificate with.<br>
    Caref: RawUtf8;
    // The X509 certificate string.<br>
    Crt: RawUtf8;
    // The X509 certificate signing request to sign.<br>
    Csr: RawUtf8;
    // The descriptive name for this certificate.<br>
    Descr: RawUtf8;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: RawUtf8;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TRawUtf8DynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TRawUtf8DynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TRawUtf8DynArray;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TRawUtf8DynArray;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The X509 private key string.<br>
    Prv: RawUtf8;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: RawUtf8;
    // The type of certificate to generate.<br>
    _Type: TEnumPfsenseapi13;
  end;
  PCertificateSigningRequestSign = ^TCertificateSigningRequestSign;

  TCommandPrompt = packed record
    // The command to be executed.<br>
    Command: RawUtf8;
    // The output of the executed command.<br>
    Output: RawUtf8;
    // The result code of the executed command.<br>
    ResultCode: integer;
  end;
  PCommandPrompt = ^TCommandPrompt;

  TConfigHistoryRevision = packed record
    // The description of the configuration change.<br>
    Description: RawUtf8;
    // The file size (in bytes) of the configuration file associated with this change.<br>
    Filesize: integer;
    // The time the configuration change was made.<br>
    Time: integer;
    // The configuration version associated with this change.<br>
    Version: RawUtf8;
  end;
  PConfigHistoryRevision = ^TConfigHistoryRevision;

  TConflictError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PConflictError = ^TConflictError;

  TCronJob = packed record
    // The command to run. Use full file paths for this command and include an command
    // parameters.<br>
    Command: RawUtf8;
    // The hour(s) at which the command will be executed. (0-23, ranges, or divided,
    // *=all)<br><br>This field is only available when the following conditions are
    // met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually, @monthly,
    // @weekly, @daily, @midnight, @hourly, @every_minute, @every_second ]<br>
    Hour: RawUtf8;
    // The day(s) of the month on which the command will be executed. (1-31, ranges,
    // or divided, *=all).<br><br>This field is only available when the following
    // conditions are met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually,
    // @monthly, @weekly, @daily, @midnight, @hourly, @every_minute, @every_second
    // ]<br>
    Mday: RawUtf8;
    // The minute(s) at which the command will be executed or a special @ event string.
    // (0-59, ranges, divided, @ event or delay, *=all). When using a special @ event,
    // such as @reboot, the other time fields must be empty.<br>
    Minute: RawUtf8;
    // The month(s) of the year in which the command will be executed. (1-31, ranges,
    // or divided, *=all).<br><br>This field is only available when the following
    // conditions are met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually,
    // @monthly, @weekly, @daily, @midnight, @hourly, @every_minute, @every_second
    // ]<br>
    Month: RawUtf8;
    // The day(s) of the week on which the command will be executed. (0-7, 7=Sun or
    // use names, ranges, or divided, *=all).<br><br>This field is only available
    // when the following conditions are met:<br>- `minute` must not be one of [ @reboot,
    // @yearly, @annually, @monthly, @weekly, @daily, @midnight, @hourly, @every_minute,
    // @every_second ]<br>
    Wday: RawUtf8;
    // The OS user to use when cron runs the command.<br>
    Who: RawUtf8;
  end;
  PCronJob = ^TCronJob;

  TDefaultGateway = packed record
    // The gateway to assigns as the default IPv4 gateway for this system. Leave blank
    // to automatically determine the default gateway, or set to `-` to assign no
    // gateway.<br>
    Defaultgw4: RawUtf8;
    // The gateway to assigns as the default IPv6 gateway for this system. Leave blank
    // to automatically determine the default gateway, or set to `-` to assign no
    // gateway.<br>
    Defaultgw6: RawUtf8;
  end;
  PDefaultGateway = ^TDefaultGateway;

  TEmailNotificationSettings = packed record
    // The authentication mechanism to use for the SMTP connection.<br>
    AuthenticationMechanism: TEnumPfsenseapi17;
    // Disables SMTP notifications.<br>
    Disable: boolean;
    // The email address to use as the "From" address in notifications.<br>
    Fromaddress: RawUtf8;
    // The IP address or hostname of the SMTP server.<br>
    Ipaddress: RawUtf8;
    // The email address to send notifications to.<br>
    Notifyemailaddress: RawUtf8;
    // The password to use for SMTP authentication.<br><br>This field is only available
    // when the following conditions are met:<br>- `authentication_mechanism` must
    // be equal to `'LOGIN'`<br>
    Password: RawUtf8;
    // The port number of the SMTP server. Valid options are: a TCP/UDP port number<br>
    Port: RawUtf8;
    // Enables or disables SSL/TLS for the SMTP connection.<br>
    Ssl: boolean;
    // Enables or disables SSL/TLS certificate validation for the SMTP connection.<br>
    Sslvalidate: boolean;
    // The timeout (in seconds) for the SMTP connection.<br>
    Timeout: integer;
    // The username to use for SMTP authentication.<br><br>This field is only available
    // when the following conditions are met:<br>- `authentication_mechanism` must
    // be equal to `'LOGIN'`<br>
    Username: RawUtf8;
  end;
  PEmailNotificationSettings = ^TEmailNotificationSettings;

  TFailedDependencyError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PFailedDependencyError = ^TFailedDependencyError;

  TFirewallAdvancedSettings = packed record
    // The interval (in seconds) at which to resolve hostnames in aliases.<br>
    Aliasesresolveinterval: integer;
    // Check the certificate of URLs used in aliases.<br>
    Checkaliasesurlcert: boolean;
  end;
  PFirewallAdvancedSettings = ^TFirewallAdvancedSettings;

  TFirewallAlias = packed record
    // Sets the host, network or port entries for the alias. When `type` is set to
    // `host`, each
    // entry must be a valid IP address or FQDN. When `type` is set to `network`,
    // each entry must be a valid
    // network CIDR or FQDN. When `type` is set to `port`, each entry must be a valid
    // port or port range. You
    // may also specify an existing alias's `name` as an entry to created nested aliases.<br>
    Address: TRawUtf8DynArray;
    // Sets a description to help specify the purpose or contents of the alias.<br>
    Descr: RawUtf8;
    // Sets descriptions for each alias `address`. Values must match the order of
    // the `address`
    // value it relates to. For example, the first value specified here is the description
    // for the first
    // value specified in the `address` field. This value cannot contain <br>
    Detail: TRawUtf8DynArray;
    // Sets the name for the alias. This name must be unique from all other aliases.<br>
    Name: RawUtf8;
    // Sets the type of alias this object will be. This directly impacts what values
    // can be
    // specified in the `address` field.<br>
    _Type: TEnumPfsenseapi18;
  end;
  PFirewallAlias = ^TFirewallAlias;

  TFirewallApply = packed record
    // Displays `true` when all firewall changes are applied and there are no pending
    // changes left.Displays `false` when there are pending firewall changes that
    // have not been applied.<br>
    Applied: boolean;
    // Displays the specific firewall subsystems that have pending changes.<br>
    PendingSubsystems: TRawUtf8DynArray;
  end;
  PFirewallApply = ^TFirewallApply;

  TFirewallLog = packed record
    // The raw text of the firewall log entry.<br>
    Text: RawUtf8;
  end;
  PFirewallLog = ^TFirewallLog;

  TFirewallRule = packed record
    // The name of the traffic shaper queue to assume as the ACK queue for ACK traffic
    // matching this rule.<br>
    Ackqueue: RawUtf8;
    // The internal rule ID for the NAT rule associated with this rule.<br>
    AssociatedRuleId: RawUtf8;
    // The username and IP of the user who originally created this firewall rule.<br>
    CreatedBy: RawUtf8;
    // The unix timestamp of when this firewall rule was original created.<br>
    CreatedTime: integer;
    // The name of the traffic shaper queue to assume as the default queue for traffic
    // matching this rule.<br>
    Defaultqueue: RawUtf8;
    // A description detailing the purpose or justification of this firewall rule.<br>
    Descr: RawUtf8;
    // The destination address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Destination: RawUtf8;
    // The destination port this rule applies to. Set to `null` to allow any destination
    // port. Valid options are: a TCP/UDP port number, a TCP/UDP port range separated
    // by `:`, an existing port type firewall alias<br><br>This field is only available
    // when the following conditions are met:<br>- `protocol` must be one of [ tcp,
    // udp, tcp/udp ]<br>
    DestinationPort: RawUtf8;
    // The direction of traffic this firewall rule applies to. This field only applies
    // to floating firewall rules.<br><br>This field is only available when the following
    // conditions are met:<br>- `floating` must be equal to `true`<br>
    Direction: TEnumPfsenseapi19;
    // Enable or disable this firewall rule.<br>
    Disabled: boolean;
    // The name of the traffic shaper limiter pipe or queue to use for incoming traffic.<br>
    Dnpipe: RawUtf8;
    // Mark this rule as a floating firewall rule.<br>
    Floating: boolean;
    // The gateway traffic matching this rule will be routed to. Set to `null` to
    // use default.<br>
    Gateway: RawUtf8;
    // Th ICMP subtypes this rule applies to. This field is only applicable when `ipprotocol`
    // is `inet` and `protocol` is `icmp`.<br><br>This field is only available when
    // the following conditions are met:<br>- `protocol` must be equal to `'icmp'`<br>
    Icmptype: TEnumPfsenseapi20Set;
    // The interface where packets must originate to match this rule.<br>
    _Interface: TRawUtf8DynArray;
    // The IP version(s) this rule applies to.<br>
    Ipprotocol: TEnumPfsenseapi21;
    // Enable or disable logging of traffic that matches this rule.<br>
    Log: boolean;
    // The name of the traffic shaper limiter pipe or queue to use for outgoing traffic.<br>
    Pdnpipe: RawUtf8;
    // The IP/transport protocol this rule should match.<br>
    Protocol: TEnumPfsenseapi22;
    // Apply this action to traffic that matches this rule immediately. This field
    // only applies to floating firewall rules.<br><br>This field is only available
    // when the following conditions are met:<br>- `floating` must be equal to `true`<br>
    Quick: boolean;
    // The name of an existing firewall schedule to assign to this firewall rule.<br>
    Sched: RawUtf8;
    // The source address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Source: RawUtf8;
    // The source port this rule applies to. Set to `null` to allow any source port.
    // Valid options are: a TCP/UDP port number, a TCP/UDP port range separated by
    // `:`, an existing port type firewall alias<br><br>This field is only available
    // when the following conditions are met:<br>- `protocol` must be one of [ tcp,
    // udp, tcp/udp ]<br>
    SourcePort: RawUtf8;
    // The state mechanism to use for this firewall rule.<br>
    Statetype: TEnumPfsenseapi23;
    // A packet matching this rule can be marked and this mark used to match on other
    // NAT/filter rules. It is called <br>
    Tag: RawUtf8;
    // Allow any TCP flags.<br>
    TcpFlagsAny: boolean;
    // The TCP flags that can be set for this rule to match.<br><br>This field is
    // only available when the following conditions are met:<br>- `tcp_flags_any`
    // must be equal to `false`<br>
    TcpFlagsOutOf: TEnumPfsenseapi24Set;
    // The TCP flags that must be set for this rule to match.<br><br>This field is
    // only available when the following conditions are met:<br>- `tcp_flags_any`
    // must be equal to `false`<br>
    TcpFlagsSet: TEnumPfsenseapi24Set;
    // The internal tracking ID for this firewall rule.<br>
    Tracker: integer;
    // The action to take against traffic that matches this rule.<br>
    _Type: TEnumPfsenseapi25;
    // The username and IP of the user who last updated this firewall rule.<br>
    UpdatedBy: RawUtf8;
    // The unix timestamp of when this firewall rule was original created.<br>
    UpdatedTime: integer;
  end;
  PFirewallRule = ^TFirewallRule;

  TFirewallSchedule = packed record
    // Displays whether the schedule is currently active or not.<br>
    Active: boolean;
    // A description of this schedules purpose.<br>
    Descr: RawUtf8;
    // The unique name to assign this schedule.<br>
    Name: RawUtf8;
    // A unique ID for this schedule used internally by the system.<br>
    Schedlabel: RawUtf8;
    // The date/times this firewall schedule will be active.<br>
    Timerange: variant;
  end;
  PFirewallSchedule = ^TFirewallSchedule;

  TFirewallScheduleTimeRange = packed record
    // The day for each specified `month` value. Each value specified must correspond
    // with a `month` field value and must match the order exactly. For example, a
    // `month` value of `[3, 6]` and a `day` value of `[2, 17]` would evaluate to
    // March 2nd and June 17th respectively.<br><br>This field is only available when
    // the following conditions are met:<br>- `position` must be equal to `NULL`<br>
    Day: TIntegerDynArray;
    // The start time and end time for this time range in 24-hour format (i.e. HH:MM-HH:MM).<br>
    Hour: RawUtf8;
    // The month for each specified `day` value. Each value specified must correspond
    // with a `day` field value and must match the order exactly. For example, a `month`
    // value of `[3, 6]` and a `day` value of `[2, 17]` would evaluate to March 2nd
    // and June 17th respectively.<br><br>This field is only available when the following
    // conditions are met:<br>- `position` must be equal to `NULL`<br>
    Month: TIntegerDynArray;
    // The day of the week this schedule should be active for. Use `1` for every Monday,
    // `2` for every Tuesday, `3` for every Wednesday, `4` for every Thursday, `5`
    // for every Friday, `6` for every Saturday, or `7` for every Sunday. If this
    // field has a value specified, the `month` and `day` fields will be unavailable.<br>
    Position: TIntegerDynArray;
    // A description detailing this firewall schedule time range's purpose.<br>
    Rangedescr: RawUtf8;
  end;
  PFirewallScheduleTimeRange = ^TFirewallScheduleTimeRange;

  TFirewallState = packed record
    // The age of the firewall state in HH:MM:SS format.<br>
    Age: RawUtf8;
    // The total number of inbound traffic (in bytes) observed by the state.<br>
    BytesIn: integer;
    // The total number of outbound traffic (in bytes) observed by the state.<br>
    BytesOut: integer;
    // The total number of traffic (in bytes) observed by the state.<br>
    BytesTotal: integer;
    // The destination address listed in the state. Note: Depending on the `protocol`,
    // this value may contain the destination port as well.<br>
    Destination: RawUtf8;
    // The direction of traffic listed in the state.<br>
    Direction: RawUtf8;
    // The amount of time remaining until the state expires in HH:MM:SS format.<br>
    ExpiresIn: RawUtf8;
    // The interface that initially received the traffic which registered the state.<br>
    _Interface: RawUtf8;
    // The total number of inbound packets observed by the state.<br>
    PacketsIn: integer;
    // The total number of outbound packets observed by the state.<br>
    PacketsOut: integer;
    // The total number of packets observed by the state.<br>
    PacketsTotal: integer;
    // The protocol listed in the state.<br>
    Protocol: RawUtf8;
    // The source address listed in the state. Note: Depending on the `protocol`,
    // this value may contain the source port as well.<br>
    Source: RawUtf8;
    // The current status of the firewall state.<br>
    State: RawUtf8;
  end;
  PFirewallState = ^TFirewallState;

  TFirewallStatesSize = packed record
    // The number of firewall state entries currently registered in the states table.<br>
    Currentstates: integer;
    // The default number of firewall state entries allowed by this firewall.<br>
    Defaultmaximumstates: integer;
    // The maximum number of firewall state entries allowed by this firewall.<br>
    Maximumstates: integer;
  end;
  PFirewallStatesSize = ^TFirewallStatesSize;

  TInterfaceApply = packed record
    // Displays `true` when all interfaces are applied and there are no pending changes
    // left.Displays `false` when there are pending interface changes that have not
    // been applied.<br>
    Applied: boolean;
    // Displays a list of interfaces that have pending changes waiting to be applied.<br>
    PendingInterfaces: TRawUtf8DynArray;
  end;
  PInterfaceApply = ^TInterfaceApply;

  TInterfaceBridge = packed record
    // The real interface name for this bridge interface.<br>
    Bridgeif: RawUtf8;
    // A description for this interface bridge.<br>
    Descr: RawUtf8;
    // The member interfaces to include in this bridge.<br>
    Members: TRawUtf8DynArray;
  end;
  PInterfaceBridge = ^TInterfaceBridge;

  TInterfaceGRE = packed record
    // Whether to add an explicit static route for the remote inner tunnel address/subnet
    // via the local tunnel address.<br>
    AddStaticRoute: boolean;
    // A description for this GRE interface.<br>
    Descr: RawUtf8;
    // The real interface name for this GRE interface.<br>
    Greif: RawUtf8;
    // The pfSense interface interface serving as the local address to be used for
    // the GRE tunnel.<br>
    _If: RawUtf8;
    // The remote address to use for the GRE tunnel.<br>
    RemoteAddr: RawUtf8;
    // The local IPv4 address to use for the GRE tunnel.<br>
    TunnelLocalAddr: RawUtf8;
    // The local IPv6 address to use for the GRE tunnel.<br>
    TunnelLocalAddr6: RawUtf8;
    // The remote IPv4 address to use for the GRE tunnel.<br><br>This field is only
    // available when the following conditions are met:<br>- `tunnel_local_addr` must
    // not be equal to `NULL`<br>
    TunnelRemoteAddr: RawUtf8;
    // The remote IPv6 address to use for the GRE tunnel.<br><br>This field is only
    // available when the following conditions are met:<br>- `tunnel_local_addr6`
    // must not be equal to `NULL`<br>
    TunnelRemoteAddr6: RawUtf8;
    // The remote IPv4 subnet bitmask to use for the GRE tunnel.<br><br>This field
    // is only available when the following conditions are met:<br>- `tunnel_local_addr`
    // must not be equal to `NULL`<br>
    TunnelRemoteNet: integer;
    // The remote IPv6 subnet bitmask to use for the GRE tunnel.<br><br>This field
    // is only available when the following conditions are met:<br>- `tunnel_local_addr6`
    // must not be equal to `NULL`<br>
    TunnelRemoteNet6: integer;
  end;
  PInterfaceGRE = ^TInterfaceGRE;

  TInterfaceGroup = packed record
    // The description for this interface group.<br>
    Descr: RawUtf8;
    // The name of this interface group.<br>
    Ifname: RawUtf8;
    // The member interfaces to assign to this interface group.<br>
    Members: TRawUtf8DynArray;
  end;
  PInterfaceGroup = ^TInterfaceGroup;

  TInterfaceLAGG = packed record
    // A description to help document the purpose of this LAGG interface.<br>
    Descr: RawUtf8;
    // The failover master interface to use.<br><br>This field is only available when
    // the following conditions are met:<br>- `proto` must be equal to `'failover'`<br>
    Failovermaster: RawUtf8;
    // The LACP timeout mode to use.<br><br>This field is only available when the
    // following conditions are met:<br>- `proto` must be equal to `'lacp'`<br>
    Lacptimeout: TEnumPfsenseapi26;
    // The LAGG hash algorithm to use.<br><br>This field is only available when the
    // following conditions are met:<br>- `proto` must be one of [ lacp, loadbalance
    // ]<br>
    Lagghash: TEnumPfsenseapi27;
    // The real name of the LAGG interface.<br>
    Laggif: RawUtf8;
    // A list of member interfaces to include in the LAGG.<br>
    Members: TRawUtf8DynArray;
    // The LAGG protocol to use.<br>
    Proto: TEnumPfsenseapi28;
  end;
  PInterfaceLAGG = ^TInterfaceLAGG;

  TInterfaceStats = packed record
    // The number of collisions on the interface.<br>
    Collisions: integer;
    // The description of the interface.<br>
    Descr: RawUtf8;
    // The DHCP link status of the interface.<br>
    Dhcplink: RawUtf8;
    // Whether the interface is enabled.<br>
    Enable: boolean;
    // The IPv4 gateway of the interface.<br>
    Gateway: RawUtf8;
    // The IPv6 gateway of the interface.<br>
    Gatewayv6: RawUtf8;
    // The hardware interface name of the interface.<br>
    Hwif: RawUtf8;
    // The number of inbound bytes on the interface.<br>
    Inbytes: integer;
    // The number of inbound bytes passed on the interface.<br>
    Inbytespass: integer;
    // The number of inbound errors on the interface.<br>
    Inerrs: integer;
    // The number of inbound packets on the interface.<br>
    Inpkts: integer;
    // The number of inbound packets passed on the interface.<br>
    Inpktspass: integer;
    // The IPv4 address of the interface.<br>
    Ipaddr: RawUtf8;
    // The IPv6 address of the interface.<br>
    Ipaddrv6: RawUtf8;
    // The IPv6 link-local address of the interface.<br>
    Linklocal: RawUtf8;
    // The MAC address of the interface.<br>
    Macaddr: RawUtf8;
    // The speed/duplex of the interface.<br>
    Media: RawUtf8;
    // The MTU of the interface.<br>
    Mtu: RawUtf8;
    // The name of the interface.<br>
    Name: RawUtf8;
    // The number of outbound bytes on the interface.<br>
    Outbytes: integer;
    // The number of outbound bytes passed on the interface.<br>
    Outbytespass: integer;
    // The number of outbound errors on the interface.<br>
    Outerrs: integer;
    // The number of outbound packets on the interface.<br>
    Outpkts: integer;
    // The number of outbound packets passed on the interface.<br>
    Outpktspass: integer;
    // The status of the interface.<br>
    Status: RawUtf8;
    // The IPv4 subnet of the interface.<br>
    Subnet: RawUtf8;
    // The IPv6 subnet of the interface.<br>
    Subnetv6: RawUtf8;
  end;
  PInterfaceStats = ^TInterfaceStats;

  TInterfaceVLAN = packed record
    // A description to help document the purpose of this VLAN.<br>
    Descr: RawUtf8;
    // The real parent interface this VLAN will be applied to.<br>
    _If: RawUtf8;
    // The 802.1p VLAN priority code point (PCP) to assign to this VLAN.<br>
    Pcp: integer;
    // The VLAN ID tag to use. This must be unique from all other VLANs on the parent
    // interface.<br>
    Tag: integer;
    // Displays the full interface VLAN. This value is automatically populated and
    // cannot be set.<br>
    Vlanif: RawUtf8;
  end;
  PInterfaceVLAN = ^TInterfaceVLAN;

  TLogSettings = packed record
    // Log authentication events to the remote syslog server(s).<br><br>This field
    // is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Auth: boolean;
    // Log DHCP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Dhcp: boolean;
    // Disable writing log entries to the local disk. WARNING: This will also disable
    // Login Protection!<br>
    Disablelocallogging: boolean;
    // Log gateway monitoring events to the remote syslog server(s).<br><br>This field
    // is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Dpinger: boolean;
    // Enable remote logging.<br>
    Enableremotelogging: boolean;
    // Log filter events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Filter: boolean;
    // Display filter descriptions in the log entries Use `0` to not load descriptions,
    // `1` to display descriptions in their own column, or `2` to display the description
    // in a second row.<br>
    Filterdescriptions: integer;
    // The format of the log entries.<br>
    Format: TEnumPfsenseapi29;
    // Log wireless authentication events to the remote syslog server(s).<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Hostapd: boolean;
    // The IP protocol to use for remote logging.<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>
    Ipprotocol: TEnumPfsenseapi30;
    // Log everything to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>
    Logall: boolean;
    // The type of compression to use for log files.<br>
    Logcompressiontype: TEnumPfsenseapi31;
    // Log changes made to the pfSense configuration.<br>
    Logconfigchanges: boolean;
    // The maximum size of the log file in kilobytes.<br>
    Logfilesize: integer;
    // The number of log entries to display in the UI.<br>
    Nentries: integer;
    // Log packets blocked by Block Bogon Networks rules.<br>
    Nologbogons: boolean;
    // Do not log packets that are blocked by the implicit default block rule.<br>
    Nologdefaultblock: boolean;
    // Do not log packets that are allowed by the implicit default pass rule.<br>
    Nologdefaultpass: boolean;
    // Do not Log errors from the web server process.<br>
    Nolognginx: boolean;
    // Log packets blocked by Block Private Networks rules.<br>
    Nologprivatenets: boolean;
    // Log NTP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Ntpd: boolean;
    // Log captive portal authentication events to the remote syslog server(s).<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Portalauth: boolean;
    // Log PPP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Ppp: boolean;
    // Display logs in the UI as they are generated by the packet filter, without
    // any formatting.<br>
    Rawfilter: boolean;
    // The first remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>
    Remoteserver: RawUtf8;
    // The second remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `remoteserver` must not be equal to `NULL`<br>
    Remoteserver2: RawUtf8;
    // The third remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `remoteserver` must not be equal to `NULL`<br>-
    // `remoteserver2` must not be equal to `NULL`<br>
    Remoteserver3: RawUtf8;
    // Log DNS resolver events to the remote syslog server(s).<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Resolver: boolean;
    // Reverse the order of log entries.<br>
    Reverseorder: boolean;
    // The number of log file rotations to keep.<br>
    Rotatecount: integer;
    // Log routing events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Routing: boolean;
    // The interface to use as the source IP address for remote logging.<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>
    Sourceip: RawUtf8;
    // Log system events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    System: boolean;
    // Log VPN events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Vpn: boolean;
  end;
  PLogSettings = ^TLogSettings;

  TMediaTypeError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PMediaTypeError = ^TMediaTypeError;

  TMethodNotAllowedError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PMethodNotAllowedError = ^TMethodNotAllowedError;

  TNTPSettings = packed record
    // Enable or disable logging reference clock statistics.<br>
    Clockstats: boolean;
    // The IP protocol peers are forced to use for DNS resolution.<br>
    Dnsresolv: TEnumPfsenseapi32;
    // Enables or disabled the NTP server.<br>
    Enable: boolean;
    // The interfaces the NTP server will listen on.<br>
    _Interface: TRawUtf8DynArray;
    // The Leap second configuration as text.<br>
    Leapsec: RawUtf8;
    // Enable or disable logging peer messages.<br>
    Logpeer: boolean;
    // Enable or disable logging system messages.<br>
    Logsys: boolean;
    // Enable or disable logging clock discipline statistics.<br>
    Loopstats: boolean;
    // The maximum number of candidate peers in the NTP pool.<br>
    Ntpmaxpeers: integer;
    // The maximum poll interval for NTP messages. Use empty string to assume system
    // default, and `omit` to not set this value. This value must be greater than
    // the `ntpminpoll`.<br>
    Ntpmaxpoll: TEnumPfsenseapi33;
    // The minimum poll interval for NTP messages. Use empty string to assume system
    // default, and `omit` to not set this value.<br>
    Ntpminpoll: TEnumPfsenseapi33;
    // The orphan mode stratum to set. Orphan mode allows the system clock to be used
    // when no other clocks are available. The number here specifies the stratum reported
    // during orphan mode and should normally be set to a number high enough to ensure
    // that any other servers available to clients are preferred over this server<br>
    Orphan: integer;
    // Enable or disable logging peer statistics.<br>
    Peerstats: boolean;
    // Enable or disable NTPv3 server authentication. (RFC 1305)<br>
    Serverauth: boolean;
    // The digest algorithm for the server authentication key.<br>
    Serverauthalgo: TEnumPfsenseapi34;
    // The NTP server authentication key.<br><br>This field is only available when
    // the following conditions are met:<br>- `serverauth` must be equal to `true`<br>
    Serverauthkey: RawUtf8;
    // Enable or disable RRD graphs for NTP statistics.<br>
    Statsgraph: boolean;
  end;
  PNTPSettings = ^TNTPSettings;

  TNTPTimeServer = packed record
    // Prevent NTP from using this timeserver, but continue collecting stats.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must not be equal to `'pool'`<br>
    Noselect: boolean;
    // Enable NTP favoring the use of this server more than all others.<br>
    Prefer: boolean;
    // The IP or hostname of the remote NTP time server, pool or peer.<br>
    Timeserver: RawUtf8;
    // The type of this timeserver. Use `server` is `timeserver` is a standalone NTP
    // server, use `pool` if `timeserver` represents an NTP pool, or `peer` if `timeserver`
    // is an NTP peer. Note: If the `timeserver` value ends with the `pool.ntp.org`
    // suffix, this field will be forced to use `pool`.<br>
    _Type: TEnumPfsenseapi35;
  end;
  PNTPTimeServer = ^TNTPTimeServer;

  TNetworkInterface = packed record
    // Enables or disables the advanced DHCP settings on this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    AdvDhcpConfigAdvanced: boolean;
    // Enables or disables overriding the entire DHCP configuration file for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    AdvDhcpConfigFileOverride: boolean;
    // Sets the local file path of the custom DHCP configuration file.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_file_override` must be equal
    // to `true`<br>
    AdvDhcpConfigFileOverridePath: RawUtf8;
    // Sets DHCP option modifiers applied to the obtained DHCP lease.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced` must be equal to
    // `true`<br>
    AdvDhcpOptionModifiers: RawUtf8;
    // Manually sets the backoff cutoff timing value used when requested DHCP leases
    // on this interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtBackoffCutoff: integer;
    // Manually sets the initial interval timing value used when requested DHCP leases
    // on this interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtInitialInterval: integer;
    // Manually sets the reboot timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtReboot: integer;
    // Manually sets the retry timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtRetry: integer;
    // Manually sets the select timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtSelectTimeout: integer;
    // Manually sets the timeout timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtTimeout: integer;
    // Selects the advanced DHCP timing preset.<br><br>This field is only available
    // when the following conditions are met:<br>- `typev4` must be equal to `'dhcp'`<br>-
    // `adv_dhcp_config_advanced` must be equal to `true`<br>
    AdvDhcpPtValues: TEnumPfsenseapi36;
    // Sets DHCP option 55 values to be sent when requesting a DHCP lease for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpRequestOptions: RawUtf8;
    // Sets DHCP options required by the client when requesting a DHCP lease for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpRequiredOptions: RawUtf8;
    // Sets DHCP options to be sent when requesting a DHCP lease for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced` must be equal to
    // `true`<br>
    AdvDhcpSendOptions: RawUtf8;
    // Sets the value used as a fixed alias IPv4 address by the DHCP client.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    AliasAddress: RawUtf8;
    // Sets the value used as the fixed alias IPv4 address's subnet bit count by the
    // DHCP client.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    AliasSubnet: integer;
    // Enable or disable automatically blocking bogon networks on this interface.<br>
    Blockbogons: boolean;
    // Enable or disable automatically blocking RFC 1918 private networks on this
    // interface.<br>
    Blockpriv: boolean;
    // The descriptive name for this interface.<br>
    Descr: RawUtf8;
    // Sets the DHCP hostname this interface will advertise via DHCP.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    Dhcphostname: RawUtf8;
    // Sets a list of IPv4 DHCP server addresses to reject DHCP offers for on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    Dhcprejectfrom: TRawUtf8DynArray;
    // Enable or disable this interface.<br>
    Enable: boolean;
    // Sets the upstream gateway this interface will use. This is only applicable
    // for WAN-type interfaces.<br><br>This field is only available when the following
    // conditions are met:<br>- `typev4` must be equal to `'static'`<br>
    Gateway: RawUtf8;
    // Sets the 6RD IPv4 gateway address assigned by the ISP for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'6rd'`<br>
    Gateway6rd: RawUtf8;
    // Sets the upstream IPv6 gateway this interface will use. This is only applicable
    // for WAN-type interfaces.<br><br>This field is only available when the following
    // conditions are met:<br>- `typev6` must be equal to `'staticv6'`<br>
    Gatewayv6: RawUtf8;
    // The real interface this configuration will be applied to.<br>
    _If: RawUtf8;
    // Sets the IPv4 address to assign to this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev4` must be one
    // of [ static, dhcp ]<br>
    Ipaddr: RawUtf8;
    // Sets the IPv6 address to assign to this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev6` must be one
    // of [ staticv6, dhcp6, slaac, 6rd, track6, 6to4 ]<br>
    Ipaddrv6: RawUtf8;
    // Enable or disable IPv6 using the IPv4 connectivity link (PPPoE).<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'staticv6'`<br>
    Ipv6usev4iface: boolean;
    // Sets the link speed for this interface. In most situations this can be left
    // as the default.<br>
    Media: RawUtf8;
    // Sets the link duplex for this interface. In most situations this can be left
    // as the default.<br>
    Mediaopt: RawUtf8;
    // Sets the MSS for this interface. Assumes default MSS if value is `null`.<br>
    Mss: integer;
    // Sets the MTU for this interface. Assumes default MTU if value is `null`.<br>
    Mtu: integer;
    // Sets the 6RD IPv6 prefix assigned by the ISP for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'6rd'`<br>
    Prefix6rd: RawUtf8;
    // Sets the 6RD IPv4 prefix length. Normally specified by the ISP. A value of
    // 0 means embed theentire IPv4 address in the 6RD prefix.<br><br>This field is
    // only available when the following conditions are met:<br>- `typev6` must be
    // equal to `'6rd'`<br>
    Prefix6rdV4plen: integer;
    // Enable or disable IPv6 using the IPv4 connectivity link (PPPoE).<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'slaac'`<br>
    Slaacusev4iface: boolean;
    // Assigns (spoofs) the MAC address for this interface instead of using the interface's
    // real MAC.<br>
    Spoofmac: RawUtf8;
    // Sets the subnet bit count to assign this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev4` must be equal
    // to `'static'`<br>
    Subnet: integer;
    // Sets the subnet bit count to assign this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev6` must be equal
    // to `'staticv6'`<br>
    Subnetv6: integer;
    // Sets the dynamic IPv6 WAN interface to track for configuration.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'track6'`<br>
    Track6Interface: RawUtf8;
    // Sets the hexadecimal IPv6 prefix ID. This determines the configurable network
    // ID based on the dynamic IPv6 connection.<br><br>This field is only available
    // when the following conditions are met:<br>- `typev6` must be equal to `'track6'`<br>
    Track6PrefixIdHex: RawUtf8;
    // Selects the IPv4 address type to assign this interface.<br>
    Typev4: TEnumPfsenseapi37;
    // Selects the IPv6 address type to assign this interface.<br>
    Typev6: TEnumPfsenseapi38;
  end;
  PNetworkInterface = ^TNetworkInterface;

  TNotAcceptableError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PNotAcceptableError = ^TNotAcceptableError;

  TNotFoundError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PNotFoundError = ^TNotFoundError;

  TOneToOneNATMapping = packed record
    // A description for this 1:1 NAT mapping<br>
    Descr: RawUtf8;
    // The destination IP address or subnet that traffic must match to apply this
    // mapping. Valid value options are: an existing interface, an IP address, a subnet
    // CIDR, an existing alias, `any`, `l2tp`, `pppoe`. The context of this address
    // can be inverted by prefixing the value with `!`. For interface values, the
    // `:ip`  modifier can be appended to the value to use the interface's IP address
    // instead of its entire subnet.<br>
    Destination: RawUtf8;
    // Disables this 1:1 NAT mapping.<br>
    Disabled: boolean;
    // The external IP address or interface for the 1:1 mapping. Valid value options
    // are: an IP address. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    _External: RawUtf8;
    // The interface this 1:1 NAT mapping applies to.<br>
    _Interface: RawUtf8;
    // The IP version this mapping applies to.<br>
    Ipprotocol: TEnumPfsenseapi39;
    // Enables or disables NAT reflection for traffic matching this mapping. Set to
    // `null` to use the system default.<br>
    Natreflection: TEnumPfsenseapi40;
    // Exclude traffic matching this mapping from a later, more general, mapping.<br>
    Nobinat: boolean;
    // The source IP address or subnet that traffic must match to apply this mapping.
    // Valid value options are: an existing interface, an IP address, a subnet CIDR,
    // `any`, `l2tp`, `pppoe`. The context of this address can be inverted by prefixing
    // the value with `!`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    Source: RawUtf8;
  end;
  POneToOneNATMapping = ^TOneToOneNATMapping;

  TOpenVPNClient = packed record
    // The compression mode allowed by this OpenVPN client. Compression can potentially
    // increase throughput but may allow an attacker to extract secrets if they can
    // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
    AllowCompression: TEnumPfsenseapi41;
    // The password used to authenticate with the OpenVPN server.<br><br>This field
    // is only available when the following conditions are met:<br>- `auth_user` must
    // not be equal to `NULL`<br>
    AuthPass: RawUtf8;
    // Disables retrying authentication if an authentication failed error is received
    // from the server<br>
    AuthRetryNone: boolean;
    // The username used to authenticate with the OpenVPN server.<br>
    AuthUser: RawUtf8;
    // The `refid` of the CA object to assume as the peer CA.<br>
    Caref: RawUtf8;
    // The `refid` of the certificate object to assume as the OpenVPN client certificate.<br>
    Certref: RawUtf8;
    // The gateway type(s) that will be created when a virtual interface is assigned
    // to this OpenVPN server<br>
    CreateGw: TEnumPfsenseapi42;
    // Additional options to add to the OpenVPN client configuration.<br>
    CustomOptions: TRawUtf8DynArray;
    // The encryption algorithms/ciphers allowed by this OpenVPN client.<br>
    DataCiphers: TRawUtf8DynArray;
    // The fallback encryption algorithm/cipher used for data channel packets when
    // communicating with clients that do not support data encryption algorithm negotiation
    // (e.g. Shared Key).<br>
    DataCiphersFallback: RawUtf8;
    // The description for this OpenVPN client.<br>
    Description: RawUtf8;
    // The carrier mode for this OpenVPN client. `tun` mode carries IPv4 and IPv6
    // (layer 3) and is the most common and compatible mode across all platforms.
    // `tap` mode is capable of carrying 802.3 (layer 2).<br>
    DevMode: TEnumPfsenseapi43;
    // The algorithm used to authenticate data channel packets, and control channel
    // packets if a TLS Key is present.<br>
    Digest: RawUtf8;
    // Disables this OpenVPN client.<br>
    Disable: boolean;
    // Enables or disables using the DNS server(s) provided by the OpenVPN server.<br>
    DnsAdd: boolean;
    // The number of times this client will attempt to send an exit notifications.<br>
    ExitNotify: TEnumPfsenseapi44;
    // The amount of time (in seconds) until a client connection is closed for inactivity.<br>
    InactiveSeconds: integer;
    // The interface used by the firewall to originate this OpenVPN client connection.<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must not be one of [ UDP, TCP ]<br>
    _Interface: RawUtf8;
    // The keepalive interval parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveInterval: integer;
    // The keepalive timeout parameter.<br><br>This field is only available when the
    // following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveTimeout: integer;
    // The port binding used by OpenVPN for client connections. Valid options are:
    // a TCP/UDP port number<br>
    LocalPort: RawUtf8;
    // The OpenVPN client mode.<br>
    Mode: TEnumPfsenseapi45;
    // Enables or disables setting the TOS IP header value of tunnel packets to match
    // the encapsulated packet value.<br>
    Passtos: boolean;
    // The action to take after a ping to the remote peer times-out.<br><br>This field
    // is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingAction: TEnumPfsenseapi46;
    // The number of seconds that must elapse before the ping is considered a timeout
    // and the configured `ping_action` is performed.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingActionSeconds: integer;
    // The method used to define ping configuration.<br>
    PingMethod: TEnumPfsenseapi47;
    // The number of seconds to accept no packets before sending a ping to the remote
    // peer over the TCP/UDP control channel.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingSeconds: integer;
    // The protocol used by this OpenVPN client.<br>
    Protocol: TEnumPfsenseapi48;
    // The address for an HTTP Proxy this client can use to connect to a remote server.<br>
    ProxyAddr: RawUtf8;
    // The type of authentication used by the proxy server.<br>
    ProxyAuthtype: TEnumPfsenseapi49;
    // The username to use for authentication to the remote proxy.<br><br>This field
    // is only available when the following conditions are met:<br>- `proxy_authtype`
    // must not be equal to `'none'`<br>
    ProxyPasswd: RawUtf8;
    // The port used by the HTTP Proxy. Valid options are: a TCP/UDP port number<br>
    ProxyPort: RawUtf8;
    // The username to use for authentication to the remote proxy.<br><br>This field
    // is only available when the following conditions are met:<br>- `proxy_authtype`
    // must not be equal to `'none'`<br>
    ProxyUser: RawUtf8;
    // Enables or disables requiring hosts to have a client certificate to connect.<br>
    RemoteCertTls: boolean;
    // IPv4 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetwork: TRawUtf8DynArray;
    // IPv6 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetworkv6: TRawUtf8DynArray;
    // Enables or disables adding/removing routes automatically.<br>
    RouteNoExec: boolean;
    // Enables or disables the servers ability to add routes to the client's routing
    // table.<br>
    RouteNoPull: boolean;
    // The IP address or hostname of the OpenVPN server this client will connect to.<br>
    ServerAddr: RawUtf8;
    // The port used by the server to receive client connections. Valid options are:
    // a TCP/UDP port number<br>
    ServerPort: RawUtf8;
    // The send and receive buffer size for OpenVPN. Set to null to use the system
    // default.<br>
    Sndrcvbuf: integer;
    // The TLS key this OpenVPN client will use to sign control channel packets with
    // an HMAC signature for authentication when establishing the tunnel.<br>
    Tls: RawUtf8;
    // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
    // for the control channel, protecting the peers from unauthorized connections.
    // The `crypt` mode encrypts the control channel communication in addition to
    // providing authentication, providing more privacy and traffic control channel
    // obfuscation.<br><br>This field is only available when the following conditions
    // are met:<br>- `tls` must not be equal to `NULL`<br>
    TlsType: TEnumPfsenseapi50;
    // The TLS key direction. This must be set to complementary values on the client
    // and client. For example, if the client is set to 0, the client must be set
    // to 1. Both may be set to omit the direction, in which case the TLS Key will
    // be used bidirectionally.<br><br>This field is only available when the following
    // conditions are met:<br>- `tls` must not be equal to `NULL`<br>
    TlsauthKeydir: TEnumPfsenseapi51;
    // The method used to supply a virtual adapter IP address to clients when using
    // TUN mode on IPv4.<br><br>This field is only available when the following conditions
    // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
    Topology: TEnumPfsenseapi52;
    // The IPv4 virtual network used for private communications between this client
    // and client hosts.<br>
    TunnelNetwork: RawUtf8;
    // The IPv6 virtual network used for private communications between this client
    // and client hosts.<br>
    TunnelNetworkv6: RawUtf8;
    // Enables or disables fast I/O operations with UDP writes to tun/tap (Experimental).<br>
    UdpFastIo: boolean;
    // Maximum outgoing bandwidth (in bytes per second) for this tunnel. Use `null`
    // no limit.<br>
    UseShaper: integer;
    // The OpenVPN logging verbosity level.<br>
    VerbosityLevel: integer;
    // The unique ID for this OpenVPN client. This value is assigned by the system
    // and cannot be changed.<br>
    Vpnid: integer;
    // The VPN interface name for this OpenVPN client. This value is assigned by the
    // system and cannot be changed.<br>
    Vpnif: RawUtf8;
  end;
  POpenVPNClient = ^TOpenVPNClient;

  TOpenVPNClientSpecificOverride = packed record
    // Enables or disables the client from connecting to this server. Do not use this
    // option to permanently disable a client due to a compromised key or password.
    // Use a CRL instead.<br>
    Block: boolean;
    // The X.509 common name for the client certificate, or the username for VPNs
    // utilizing password authentication.<br>
    CommonName: RawUtf8;
    // Additional OpenVPN options to add for this client.<br>
    CustomOptions: TRawUtf8DynArray;
    // The description for this client specific override.<br>
    Description: RawUtf8;
    // Disables this client specific override.<br>
    Disable: boolean;
    // The default domain to provide to the client.<br>
    DnsDomain: RawUtf8;
    // The primary DNS server to provide to the client.<br>
    DnsServer1: RawUtf8;
    // The secondary DNS server to provide to the client.<br>
    DnsServer2: RawUtf8;
    // The tertiary DNS server to provide to the client.<br>
    DnsServer3: RawUtf8;
    // The quaternary DNS server to provide to the client.<br>
    DnsServer4: RawUtf8;
    // Enable forcing all client-generated traffic through the tunnel.<br>
    Gwredir: boolean;
    // The IPv4 server-side networks that will be accessible from this particular
    // client.<br>
    LocalNetwork: TRawUtf8DynArray;
    // the IPv6 server-side networks that will be accessible from this particular
    // client.<br>
    LocalNetworkv6: TRawUtf8DynArray;
    // Enables or disables NetBIOS over TCP/IP.<br>
    NetbiosEnable: boolean;
    // The NetBIOS node type.<br><br>This field is only available when the following
    // conditions are met:<br>- `netbios_enable` must be equal to `true`<br>
    NetbiosNtype: integer;
    // The NetBIOS Scope ID. This provides an extended naming service for NetBIOS
    // over TCP/IP. The NetBIOS scope ID isolates NetBIOS traffic on a single network
    // to only those nodes with the same NetBIOS scope ID.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    NetbiosScope: RawUtf8;
    // The primary NTP server to provide to the client.<br>
    NtpServer1: RawUtf8;
    // The secondary NTP server to provide to the client.<br>
    NtpServer2: RawUtf8;
    // Enables or disables preventing this client from receiving any server-defined
    // client settings.<br>
    PushReset: boolean;
    // The IPv4 client-side networks that will be routed to this client specifically
    // using iroute, so that a site-to-site VPN can be established.<br>
    RemoteNetwork: TRawUtf8DynArray;
    // The IPv6 client-side networks that will be routed to this client specifically
    // using iroute, so that a site-to-site VPN can be established.<br>
    RemoteNetworkv6: TRawUtf8DynArray;
    // Enables or disables preventing this client from receiving any server-defined
    // routes without removing any other options.<br>
    RemoveRoute: boolean;
    // The OpenVPN servers that will utilize this override. When no servers are specified,
    // the override will apply to all servers.<br>
    ServerList: TRawUtf8DynArray;
    // The IPv4 virtual network used for private communications between the server
    // and client hosts.<br>
    TunnelNetwork: RawUtf8;
    // The IPv6 virtual network used for private communications between the server
    // and client hosts.<br>
    TunnelNetworkv6: RawUtf8;
    // The primary WINS server to provide to the client.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    WinsServer1: RawUtf8;
    // The secondary WINS server to provide to the client.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    WinsServer2: RawUtf8;
  end;
  POpenVPNClientSpecificOverride = ^TOpenVPNClientSpecificOverride;

  TOpenVPNClientStatus = packed record
    // The connection time of the OpenVPN client.<br>
    ConnectTime: RawUtf8;
    // The local host of the OpenVPN client.<br>
    LocalHost: RawUtf8;
    // The local port of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    LocalPort: RawUtf8;
    // The management interface of the OpenVPN client.<br>
    Mgmt: RawUtf8;
    // The name of the OpenVPN client.<br>
    Name: RawUtf8;
    // The port number of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    Port: RawUtf8;
    // The remote host of the OpenVPN client.<br>
    RemoteHost: RawUtf8;
    // The remote port of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    RemotePort: RawUtf8;
    // The current state of the OpenVPN client.<br>
    State: RawUtf8;
    // The details for the current state of the OpenVPN client.<br>
    StateDetail: RawUtf8;
    // The current status of the OpenVPN client.<br>
    Status: RawUtf8;
    // The virtual address of the OpenVPN client.<br>
    VirtualAddr: RawUtf8;
    // The virtual address 6 of the OpenVPN client.<br>
    VirtualAddr6: RawUtf8;
    // The VPN ID of the OpenVPN client this status corresponds to.<br>
    Vpnid: integer;
  end;
  POpenVPNClientStatus = ^TOpenVPNClientStatus;

  TOpenVPNServer = packed record
    // The compression mode allowed by this OpenVPN server. Compression can potentially
    // increase throughput but may allow an attacker to extract secrets if they can
    // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
    AllowCompression: TEnumPfsenseapi41;
    // The name of the authentication server to use as the authentication backend
    // for this OpenVPN server<br><br>This field is only available when the following
    // conditions are met:<br>- `mode` must be one of [ server_user, server_tls_user
    // ]<br>
    Authmode: TRawUtf8DynArray;
    // The `refid` of the CA object to assume as the peer CA.<br>
    Caref: RawUtf8;
    // The depth of the certificate chain to check when a certificate based client
    // signs in. Certificates below this depth are not accepted. This is useful for
    // denying certificates made with intermediate CAs generated from the same CA
    // as the server. Set to null to use system default.<br>
    CertDepth: integer;
    // The `refid` of the certificate object to assume as the OpenVPN server certificate.<br>
    Certref: RawUtf8;
    // Enables or disables allowing communication between clients connected to this
    // server.<br>
    Client2client: boolean;
    // The number of concurrent connections a single user can have.<br><br>This field
    // is only available when the following conditions are met:<br>- `duplicate_cn`
    // must be equal to `true`<br>
    Connlimit: integer;
    // The gateway type(s) that will be created when a virtual interface is assigned
    // to this OpenVPN server<br>
    CreateGw: TEnumPfsenseapi42;
    // Additional options to add to the OpenVPN server configuration.<br>
    CustomOptions: TRawUtf8DynArray;
    // The encryption algorithms/ciphers allowed by this OpenVPN server.<br>
    DataCiphers: TRawUtf8DynArray;
    // The fallback encryption algorithm/cipher used for data channel packets when
    // communicating with clients that do not support data encryption algorithm negotiation
    // (e.g. Shared Key).<br>
    DataCiphersFallback: RawUtf8;
    // The description for this OpenVPN server.<br>
    Description: RawUtf8;
    // The carrier mode for this OpenVPN server. `tun` mode carries IPv4 and IPv6
    // (layer 3) and is the most common and compatible mode across all platforms.
    // `tap` mode is capable of carrying 802.3 (layer 2).<br>
    DevMode: TEnumPfsenseapi43;
    // The Diffie-Hellman (DH) parameter set used for key exchange.<br>
    DhLength: RawUtf8;
    // The algorithm used to authenticate data channel packets, and control channel
    // packets if a TLS Key is present.<br>
    Digest: RawUtf8;
    // Disables this OpenVPN server.<br>
    Disable: boolean;
    // The default domain to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsDomain: RawUtf8;
    // The primary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer1: RawUtf8;
    // The secondary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer2: RawUtf8;
    // The tertiary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer3: RawUtf8;
    // The quaternary DNS server to provide to clients.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be one of
    // [ server_user, server_tls_user ]<br>
    DnsServer4: RawUtf8;
    // Enables or disable allowing the same user to connect multiple times.<br>
    DuplicateCn: boolean;
    // Enables or disables allowing connected clients to retain their connections
    // if their IP address changes.<br>
    DynamicIp: boolean;
    // The Elliptic Curve to use for key exchange. The curve from the server certificate
    // is used by default when the server uses an ECDSA certificate. Otherwise, secp384r1
    // is used as a fallback.<br>
    EcdhCurve: RawUtf8;
    // Enable forcing all client-generated IPv4 traffic through the tunnel.<br>
    Gwredir: boolean;
    // Enable forcing all client-generated IPv6 traffic through the tunnel.<br>
    Gwredir6: boolean;
    // The amount of time (in seconds) until a client connection is closed for inactivity.<br>
    InactiveSeconds: integer;
    // The interface or Virtual IP address where OpenVPN will receive client connections.<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must not be one of [ UDP, TCP ]<br>
    _Interface: RawUtf8;
    // The keepalive interval parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveInterval: integer;
    // The keepalive timeout parameter.<br><br>This field is only available when the
    // following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveTimeout: integer;
    // The IPv4 networks that will be accessible from the remote endpoint. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. This may
    // be left blank if not adding a route to the local network through this tunnel
    // on the remote machine. This is generally set to the LAN network.<br><br>This
    // field is only available when the following conditions are met:<br>- `gwredir`
    // must be equal to `false`<br>
    LocalNetwork: TRawUtf8DynArray;
    // The IPv6 networks that will be accessible from the remote endpoint. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. This may
    // be left blank if not adding a route to the local network through this tunnel
    // on the remote machine. This is generally set to the LAN network.<br><br>This
    // field is only available when the following conditions are met:<br>- `gwredir6`
    // must be equal to `false`<br>
    LocalNetworkv6: TRawUtf8DynArray;
    // The port used by OpenVPN to receive client connections. Valid options are:
    // a TCP/UDP port number<br>
    LocalPort: RawUtf8;
    // The maximum number of clients allowed to concurrently connect to this server.<br>
    Maxclients: integer;
    // The OpenVPN server mode.<br>
    Mode: TEnumPfsenseapi53;
    // Enables or disables NetBIOS over TCP/IP.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    NetbiosEnable: boolean;
    // The NetBIOS node type.<br><br>This field is only available when the following
    // conditions are met:<br>- `netbios_enable` must be equal to `true`<br>
    NetbiosNtype: integer;
    // The NetBIOS Scope ID. This provides an extended naming service for NetBIOS
    // over TCP/IP. The NetBIOS scope ID isolates NetBIOS traffic on a single network
    // to only those nodes with the same NetBIOS scope ID.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    NetbiosScope: RawUtf8;
    // The primary NTP server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    NtpServer1: RawUtf8;
    // The secondary NTP server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    NtpServer2: RawUtf8;
    // Enables or disables setting the TOS IP header value of tunnel packets to match
    // the encapsulated packet value.<br>
    Passtos: boolean;
    // The action to take after a ping to the remote peer times-out.<br><br>This field
    // is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingAction: TEnumPfsenseapi46;
    // Enables or disables pushing the ping action to the VPN client.<br><br>This
    // field is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingActionPush: boolean;
    // The number of seconds that must elapse before the ping is considered a timeout
    // and the configured `ping_action` is performed.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingActionSeconds: integer;
    // The method used to define ping configuration.<br>
    PingMethod: TEnumPfsenseapi47;
    // Enables or disables push ping to the VPN client.<br><br>This field is only
    // available when the following conditions are met:<br>- `ping_method` must be
    // equal to `'ping'`<br>
    PingPush: boolean;
    // The number of seconds to accept no packets before sending a ping to the remote
    // peer over the TCP/UDP control channel.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingSeconds: integer;
    // The protocol used by this OpenVPN server.<br>
    Protocol: TEnumPfsenseapi48;
    // Enables or disables blocking Windows 10 clients' access to DNS servers except
    // across OpenVPN while connected, forcing clients to use only VPN DNS servers.<br><br>This
    // field is only available when the following conditions are met:<br>- `mode`
    // must be one of [ server_user, server_tls_user ]<br>
    PushBlockoutsidedns: boolean;
    // Enables or disables running `net stop dnscache`, `net start dnscache`, `ipconfig
    // /flushdns` and `ipconfig /registerdns` on connection initiation for Windows
    // clients.<br><br>This field is only available when the following conditions
    // are met:<br>- `mode` must be one of [ server_user, server_tls_user ]<br>
    PushRegisterDns: boolean;
    // Enables or disables requiring hosts to have a client certificate to connect.<br>
    RemoteCertTls: boolean;
    // IPv4 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetwork: TRawUtf8DynArray;
    // IPv6 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetworkv6: TRawUtf8DynArray;
    // Enables or disables clients on the bridge to obtain DHCP.<br><br>This field
    // is only available when the following conditions are met:<br>- `dev_mode` must
    // be equal to `'tap'`<br>
    ServerbridgeDhcp: boolean;
    // The bridge DHCP range's end address.<br><br>This field is only available when
    // the following conditions are met:<br>- `serverbridge_dhcp` must be equal to
    // `true`<br>
    ServerbridgeDhcpEnd: RawUtf8;
    // The bridge DHCP range's start address.<br><br>This field is only available
    // when the following conditions are met:<br>- `serverbridge_dhcp` must be equal
    // to `true`<br>
    ServerbridgeDhcpStart: RawUtf8;
    // The interface to which this TAP instance will be bridged. This is not done
    // automatically. This interface must be assigned and the bridge created separately.
    // This setting controls which existing IP address and subnet mask are used by
    // OpenVPN for the bridge.<br><br>This field is only available when the following
    // conditions are met:<br>- `serverbridge_dhcp` must be equal to `true`<br>
    ServerbridgeInterface: RawUtf8;
    // Enables or disables pushing the bridge interface's IPv4 address to connecting
    // clients as a route gateway.<br><br>This field is only available when the following
    // conditions are met:<br>- `serverbridge_dhcp` must be equal to `true`<br>
    ServerbridgeRoutegateway: boolean;
    // The send and receive buffer size for OpenVPN. Set to null to use the system
    // default.<br>
    Sndrcvbuf: integer;
    // Enables or disables enforcing a match between the common name of the client
    // certificate and the username given at login.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    Strictusercn: boolean;
    // The TLS key this OpenVPN server will use to sign control channel packets with
    // an HMAC signature for authentication when establishing the tunnel.<br><br>This
    // field is only available when the following conditions are met:<br>- `use_tls`
    // must be equal to `true`<br>
    Tls: RawUtf8;
    // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
    // for the control channel, protecting the peers from unauthorized connections.
    // The `crypt` mode encrypts the control channel communication in addition to
    // providing authentication, providing more privacy and traffic control channel
    // obfuscation.<br><br>This field is only available when the following conditions
    // are met:<br>- `use_tls` must be equal to `true`<br>
    TlsType: TEnumPfsenseapi50;
    // The TLS key direction. This must be set to complementary values on the client
    // and server. For example, if the server is set to 0, the client must be set
    // to 1. Both may be set to omit the direction, in which case the TLS Key will
    // be used bidirectionally.<br><br>This field is only available when the following
    // conditions are met:<br>- `use_tls` must be equal to `true`<br>
    TlsauthKeydir: TEnumPfsenseapi51;
    // The method used to supply a virtual adapter IP address to clients when using
    // TUN mode on IPv4.<br><br>This field is only available when the following conditions
    // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
    Topology: TEnumPfsenseapi52;
    // The IPv4 virtual network used for private communications between this server
    // and client hosts.<br>
    TunnelNetwork: RawUtf8;
    // The IPv6 virtual network used for private communications between this server
    // and client hosts.<br>
    TunnelNetworkv6: RawUtf8;
    // Enables or disables the use of a TLS key for this OpenVPN server.<br>
    UseTls: boolean;
    // Enables or disable the username of the client being used in place of the certificate
    // common name for purposes such as determining Client Specific Overrides.<br><br>This
    // field is only available when the following conditions are met:<br>- `mode`
    // must be one of [ server_user, server_tls_user ]<br>
    UsernameAsCommonName: boolean;
    // The OpenVPN logging verbosity level.<br>
    VerbosityLevel: integer;
    // The unique ID for this OpenVPN server. This value is assigned by the system
    // and cannot be changed.<br>
    Vpnid: integer;
    // The VPN interface name for this OpenVPN server. This value is assigned by the
    // system and cannot be changed.<br>
    Vpnif: RawUtf8;
    // The primary WINS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    WinsServer1: RawUtf8;
    // The secondary WINS server to provide to clients.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be one of
    // [ server_user, server_tls_user ]<br>
    WinsServer2: RawUtf8;
  end;
  POpenVPNServer = ^TOpenVPNServer;

  TOpenVPNServerConnectionStatus = packed record
    // The number of bytes received by the OpenVPN server connection.<br>
    BytesRecv: integer;
    // The number of bytes sent by the OpenVPN server connection.<br>
    BytesSent: integer;
    // The cipher of the OpenVPN server connection.<br>
    Cipher: RawUtf8;
    // The client ID of the OpenVPN server connection.<br>
    ClientId: integer;
    // The common name of the OpenVPN server connection.<br>
    CommonName: RawUtf8;
    // The connection time of the OpenVPN server connection.<br>
    ConnectTime: RawUtf8;
    // The connection time of the OpenVPN server connection in Unix time.<br>
    ConnectTimeUnix: integer;
    // The peer ID of the OpenVPN server connection.<br>
    PeerId: integer;
    // The remote host of the OpenVPN server connection.<br>
    RemoteHost: RawUtf8;
    // The user name of the OpenVPN server connection.<br>
    UserName: RawUtf8;
    // The virtual address of the OpenVPN server connection.<br>
    VirtualAddr: RawUtf8;
    // The virtual IPv6 address of the OpenVPN server connection.<br>
    VirtualAddr6: RawUtf8;
  end;
  POpenVPNServerConnectionStatus = ^TOpenVPNServerConnectionStatus;

  TOpenVPNServerRouteStatus = packed record
    // The common name of the OpenVPN server connection.<br>
    CommonName: RawUtf8;
    // The last time of the route was used.<br>
    LastTime: RawUtf8;
    // The remote host of the OpenVPN server connection.<br>
    RemoteHost: RawUtf8;
    // The virtual address of the OpenVPN server connection.<br>
    VirtualAddr: RawUtf8;
  end;
  POpenVPNServerRouteStatus = ^TOpenVPNServerRouteStatus;

  TOpenVPNServerStatus = packed record
    // The current connections to the OpenVPN server.<br>
    Conns: variant;
    // The management interface of the OpenVPN server.<br>
    Mgmt: RawUtf8;
    // The mode of the OpenVPN server.<br>
    Mode: RawUtf8;
    // The name of the OpenVPN server.<br>
    Name: RawUtf8;
    // The port number of the OpenVPN server. Valid options are: a TCP/UDP port number<br>
    Port: RawUtf8;
    // The current routes of the OpenVPN server.<br>
    Routes: variant;
    // The VPN ID of the OpenVPN server this status corresponds to.<br>
    Vpnid: integer;
  end;
  POpenVPNServerStatus = ^TOpenVPNServerStatus;

  TOutboundNATMapping = packed record
    // A description for the outbound NAT mapping.<br>
    Descr: RawUtf8;
    // The destination network this rule should match. Valid value options are: an
    // existing interface, a subnet CIDR, an existing alias, `any`, `pppoe`. The context
    // of this address can be inverted by prefixing the value with `!`. For interface
    // values, the `:ip`  modifier can be appended to the value to use the interface's
    // IP address instead of its entire subnet.<br>
    Destination: RawUtf8;
    // The destination port this rule should match. Valid options are: a TCP/UDP port
    // number, a TCP/UDP port range separated by `:`, an existing port type firewall
    // alias<br>
    DestinationPort: RawUtf8;
    // Disable this outbound NAT rule.<br>
    Disabled: boolean;
    // The interface on which traffic is matched as it exits the firewall. In most
    // cases this is a WAN-type or another externally-connected interface.<br>
    _Interface: RawUtf8;
    // The external source port or port range used for rewriting the original source
    // port on connections matching the rule. Valid options are: a TCP/UDP port number,
    // a TCP/UDP port range separated by `:`<br><br>This field is only available when
    // the following conditions are met:<br>- `static_nat_port` must be equal to `false`<br>-
    // `nonat` must be equal to `false`<br>
    NatPort: RawUtf8;
    // Do not NAT traffic matching this rule.<br>
    Nonat: boolean;
    // Do not sync this rule to HA peers.<br>
    Nosync: boolean;
    // The pool option used to load balance external IP mapping when `target` is set
    // to a subnet or alias of many addresses. Set to `null` to revert to the system
    // default.<br><br>This field is only available when the following conditions
    // are met:<br>- `nonat` must be equal to `false`<br>
    Poolopts: TEnumPfsenseapi54;
    // The protocol this rule should match. Use `null` for any protocol.<br>
    Protocol: TEnumPfsenseapi55;
    // The source network this rule should match. Valid value options are: an existing
    // interface, a subnet CIDR, an existing alias, `any`, `(self)`, `pppoe`. The
    // context of this address can be inverted by prefixing the value with `!`. For
    // interface values, the `:ip`  modifier can be appended to the value to use the
    // interface's IP address instead of its entire subnet.<br>
    Source: RawUtf8;
    // The key that is fed to the hashing algorithm in hex format. This must be a
    // 16 byte (32 character) hex string prefixed with `0x`. If a value is not provided,
    // one will automatically be generated<br><br>This field is only available when
    // the following conditions are met:<br>- `poolopts` must be equal to `'source-hash'`<br>-
    // `nonat` must be equal to `false`<br>
    SourceHashKey: RawUtf8;
    // The source port this rule should match. Valid options are: a TCP/UDP port number,
    // a TCP/UDP port range separated by `:`, an existing port type firewall alias<br>
    SourcePort: RawUtf8;
    // Do not rewrite source port for traffic matching this rule.<br><br>This field
    // is only available when the following conditions are met:<br>- `nonat` must
    // be equal to `false`<br>
    StaticNatPort: boolean;
    // The target network traffic matching this rule should be translated to. Valid
    // value options are: an IP address, an existing alias. For interface values,
    // the `:ip`  modifier can be appended to the value to use the interface's IP
    // address instead of its entire subnet.<br><br>This field is only available when
    // the following conditions are met:<br>- `nonat` must be equal to `false`<br>
    Target: RawUtf8;
    // The subnet bits for the assigned `target`. This field is only applicable if
    // `target` is set to an IP address. This has no affect for alias or interface
    // `targets`.<br><br>This field is only available when the following conditions
    // are met:<br>- `nonat` must be equal to `false`<br>
    TargetSubnet: integer;
  end;
  POutboundNATMapping = ^TOutboundNATMapping;

  TOutboundNATMode = packed record
    // The outbound NAT mode to assign this system. Set to `automatic` to have this
    // system automatically generate NAT rules this firewall, `hybrid` to automatically
    // generate NAT rules AND allow manual outbound NAT mappings to be assigned, `manual`
    // to prevent the system from automatically generating NAT rules and only allow
    // manual outbound NAT mappings, or `disabled` to disable outbound NAT on this
    // system entirely.<br>
    Mode: TEnumPfsenseapi56;
  end;
  POutboundNATMode = ^TOutboundNATMode;

  TPackage = packed record
    // The package's description.<br>
    Descr: RawUtf8;
    // The version of the package currently installed.<br>
    InstalledVersion: RawUtf8;
    // The latest version available for this package.<br>
    LatestVersion: RawUtf8;
    // The name of the pfSense package.<br>
    Name: RawUtf8;
    // The package's shortname.<br>
    Shortname: RawUtf8;
    // Indicates whether the installed package has an update available.<br>
    UpdateAvailable: boolean;
  end;
  PPackage = ^TPackage;

  TPortForward = packed record
    // The associated firewall rule mode. Use an empty string to require a separate
    // firewall rule to be created to pass traffic matching this port forward rule.
    // Use `new` to create a new associated firewall rule to pass traffic matching
    // this port forward rule. Use `pass` to automatically pass traffic matching this
    // port forward rule without the need for a firewall rule.   Otherwise, you can
    // specify the `associated_rule_id` of an existing firewall rule to associate
    // with this port forward rule.<br>
    AssociatedRuleId: RawUtf8;
    // The username and IP of the user who originally created this port forward rule.<br>
    CreatedBy: RawUtf8;
    // The unix timestamp of when this port forward rule was original created.<br>
    CreatedTime: integer;
    // A description for this port forward rule.<br>
    Descr: RawUtf8;
    // The destination address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Destination: RawUtf8;
    // The destination port this port forward rule applies to. Set to `null` to allow
    // any destination port. Valid options are: a TCP/UDP port number, a TCP/UDP port
    // range separated by `:`, an existing port type firewall alias<br><br>This field
    // is only available when the following conditions are met:<br>- `protocol` must
    // be one of [ tcp, udp, tcp/udp ]<br>
    DestinationPort: RawUtf8;
    // Disables this port forward rule.<br>
    Disabled: boolean;
    // The interface this port forward rule applies to.<br>
    _Interface: RawUtf8;
    // The IP protocol this port forward rule should match.<br>
    Ipprotocol: TEnumPfsenseapi21;
    // The port on the internal host to forward matching traffic to. In most cases,
    // this must match the `destination_port` value. In the event that the `desintation_port`
    // is a range, this value should be the first value in that range. Valid options
    // are: a TCP/UDP port number, an existing port type firewall alias<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must be one of [ tcp, udp, tcp/udp ]<br>
    LocalPort: RawUtf8;
    // The NAT reflection mode to use for traffic matching this port forward rule.
    // Set to `null` to use the system default.<br>
    Natreflection: TEnumPfsenseapi57;
    // Disables redirection for traffic matching this rule.<br>
    Nordr: boolean;
    // Prevents this port forward rule from being synced to non-primary CARP members.<br>
    Nosync: boolean;
    // The IP/transport protocol this port forward rule should match.<br>
    Protocol: TEnumPfsenseapi55;
    // The source address this port forward rule applies to. Valid value options are:
    // an existing interface, an IP address, a subnet CIDR, an existing alias, `any`,
    // `(self)`, `l2tp`, `pppoe`. The context of this address can be inverted by prefixing
    // the value with `!`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    Source: RawUtf8;
    // The source port this port forward rule applies to. Set to `null` to allow any
    // source port. Valid options are: a TCP/UDP port number, a TCP/UDP port range
    // separated by `:`, an existing port type firewall alias<br><br>This field is
    // only available when the following conditions are met:<br>- `protocol` must
    // be one of [ tcp, udp, tcp/udp ]<br>
    SourcePort: RawUtf8;
    // The IP address or alias of the internal host to forward matching traffic to.<br>
    Target: RawUtf8;
    // The username and IP of the user who last updated this port forward rule.<br>
    UpdatedBy: RawUtf8;
    // The unix timestamp of when this port forward rule was original created.<br>
    UpdatedTime: integer;
  end;
  PPortForward = ^TPortForward;

  TRESTAPIAccessListEntry = packed record
    // A description of this access list entry. This field is optional.<br>
    Descr: RawUtf8;
    // The network (in CIDR notation) that this entry applies to. Clients interacting
    // with the REST API from this network will be affected by this entry.<br>
    Network: RawUtf8;
    // The firewall schedule that this entry will use. This entry will only be active
    // during the
    // times specified in the schedule. Leave empty to apply this entry at all times.<br>
    Sched: RawUtf8;
    // The type of access this entry provides. "allow" entries permit access to the
    // REST API from the specified networks. "deny" entries block access to the REST
    // API from the specified networks.<br>
    _Type: TEnumPfsenseapi58;
    // The users that this entry applies to. Only users in this list will be affected
    // by this entry.<br>
    Users: TRawUtf8DynArray;
    // The weight of this entry. Entries with lower weights are evaluated first. If
    // multiple entries match a request, the entry with the lowest weight will be
    // applied.<br>
    Weight: integer;
  end;
  PRESTAPIAccessListEntry = ^TRESTAPIAccessListEntry;

  TRESTAPIJWT = packed record
    // The generated JWT that can be used for JWT authentication.<br>
    Token: RawUtf8;
  end;
  PRESTAPIJWT = ^TRESTAPIJWT;

  TRESTAPIKey = packed record
    // Sets a description for this API key. This is used to identify the key's purpose
    // and cannot be changed once created.<br>
    Descr: RawUtf8;
    // The hash of the generated API key<br>
    Hash: RawUtf8;
    // The hash algorithm used for this API key. It is recommended to increase the
    // strength of the algorithm for keys assigned to privileged users.<br>
    HashAlgo: TEnumPfsenseapi59;
    // The real API key. This value is not stored internally and cannot be recovered
    // if lost.<br>
    Key: RawUtf8;
    // The length of the API key (in bytes). Greater key lengths provide greater security,
    // but also increase the number of characters used in the key string.<br>
    LengthBytes: integer;
    // The username this API key is issued to.<br>
    Username: RawUtf8;
  end;
  PRESTAPIKey = ^TRESTAPIKey;

  TRESTAPISettings = packed record
    // Enables or disables displaying pre-releases in available API updates. Pre-releases
    // contain fixes
    // and features that are currently under development and may not be fully stable.
    // Use of pre-release versions
    // is at your own risk.<br>
    AllowPreReleases: boolean;
    // Sets the interfaces allowed to accept incoming API calls.<br>
    AllowedInterfaces: TRawUtf8DynArray;
    // Sets the API authentication methods allowed to authenticate API calls.<br>
    AuthMethods: TRawUtf8DynArray;
    // Enables or disables the API. If set to `false`, the API will no longer respond
    // to API requests
    // and can only be re-enabled via webConfigurator.<br>
    Enabled: boolean;
    // Enables or disables exposing sensitive fields in API responses. When enabled,
    // sensitive fields such as passwords, private keys, and other sensitive data
    // will be included in API responses.<br>
    ExposeSensitiveFields: boolean;
    // Enables or disables syncing API settings to HA peers. When enabled, API settings
    // from this
    // host will automatically be synced to any hosts defined in `ha_sync_hosts`.<br>
    HaSync: boolean;
    // Set a list of IP addresses or hostnames to sync API settings to.<br>
    HaSyncHosts: TRawUtf8DynArray;
    // Sets the password to use when authenticating for HA sync processes. This must
    // be the password
    // for the user defined in `ha_sync_username` and must be the same on all hosts
    // defined in `ha_sync_hosts`.<br>
    HaSyncPassword: RawUtf8;
    // Sets the username to use when authenticating for HA sync processes. This user
    // must be the present
    // on all hosts defined in `ha_sync_hosts`.<br>
    HaSyncUsername: RawUtf8;
    // Enables or disables certificate validation when syncing API configurations
    // to HA sync peers. If
    // enabled, all hosts defined in `ha_sync_hosts` must have their webConfigurator
    // configured with a certificate
    // trusted by this system. It is strongly recommended this be enabled at all times
    // to help mitigate
    // Man-in-the-Middle attacks.<br>
    HaSyncValidateCerts: boolean;
    // Enables or disables HATEOAS. Enabling HATEOAS will allow the API to include
    // links to related resources in API responses. This is primarily useful for frontend
    // web applications and self-navigating client scripts that integrate with HAL
    // standards. Enabling HATEOAS may increase API response times, especially on
    // systems with large configurations.<br>
    Hateoas: boolean;
    // Sets the amount of time (in seconds) JWTs are valid for.<br>
    JwtExp: integer;
    // Enables or disables keeping a persistent backup of the API configuration that
    // can be used
    // to restore the API configuration after package and systems updates.<br>
    KeepBackup: boolean;
    // Enables or disables logging of API authentication attempts that are successful.
    // By default, only
    // failed API authentication attempts are logged to prevent flooding the authentication
    // logs. This field is
    // only applicable when the API `login_protection` setting is enabled.<br>
    LogSuccessfulAuth: boolean;
    // Enables or disables Login Protection for API authentication. When enabled,
    // Login Protection will
    // monitor API attempts and temporarily block clients who fail API authentication
    // too many times within a
    // period of time. When disabled, Login Protection will not monitor API authentication
    // but will continue to
    // monitor webConfigurator and SSH logins (if configured). Login Protection can
    // be configured globally in
    // System > Advanced.<br>
    LoginProtection: boolean;
    // Specifies a list of fields (formatted as ModelName:FieldName) that should have
    // their sensitive attribute overridden. Fields selected here will not be considered
    // sensitive and will be included in API responses regardless of the `expose_sensitive_fields`
    // setting.<br><br>This field is only available when the following conditions
    // are met:<br>- `expose_sensitive_fields` must be equal to `false`<br>
    OverrideSensitiveFields: TRawUtf8DynArray;
    // Enables or disables read-only API access. If enabled, the API will only respond
    // to GET requests
    // and can only be disabled via webConfigurator.<br>
    ReadOnly: boolean;
    // Specifies how the API should represent interface names. Use `descr` to represent
    // interface objects by their description name, use `id` to represent interface
    // objects by their
    // internal pfSense ID (e.g. wan, lan, opt1), or use `if` to represent interface
    // objects by their
    // real interface name (e.g. em0, igb1, bxe3).<br>
    RepresentInterfacesAs: TEnumPfsenseapi60;
  end;
  PRESTAPISettings = ^TRESTAPISettings;

  TRESTAPISettingsSync = packed record
    // The serialized REST API settings data to be synced.<br>
    SyncData: RawUtf8;
  end;
  PRESTAPISettingsSync = ^TRESTAPISettingsSync;

  TRESTAPIVersion = packed record
    // All available versions of the REST API package for this system.<br>
    AvailableVersions: TRawUtf8DynArray;
    // The current API version installed on this system.<br>
    CurrentVersion: RawUtf8;
    // Set the API version to update or rollback to.<br>
    InstallVersion: RawUtf8;
    // The latest API version available to this system.<br>
    LatestVersion: RawUtf8;
    // The latest API version's release date.<br>
    LatestVersionReleaseDate: RawUtf8;
    // Indicates if an API update is available for this system.<br>
    UpdateAvailable: boolean;
  end;
  PRESTAPIVersion = ^TRESTAPIVersion;

  TRoutingApply = packed record
    // Displays `true` when all routing changes are applied and there are no pending
    // changes left.Displays `false` when there are pending routing changes that have
    // not been applied.<br>
    Applied: boolean;
  end;
  PRoutingApply = ^TRoutingApply;

  TRoutingGateway = packed record
    // Disable actions from taking place when gateway events occur. The gateway will
    // always be
    // considered up.<br>
    ActionDisable: boolean;
    // Sets the time interval in milliseconds between checking for an alert conditions.<br>
    AlertInterval: integer;
    // Sets the data payload to send in ICMP packets to gateway monitor IP.<br>
    DataPayload: integer;
    // Sets a descriptions for the gateway.<br>
    Descr: RawUtf8;
    // Disable this gateway.<br>
    Disabled: boolean;
    // Prevents gateway monitoring from adding a static route for this gateway's monitor
    // IP.<br>
    DpingerDontAddStaticRoute: boolean;
    // Always consider this gateway to be up.<br>
    ForceDown: boolean;
    // Sets the IP address of the remote gateway.<br>
    Gateway: RawUtf8;
    // Controls the state killing behavior when this specific gateway goes down. Killing
    // states for specific down gateways only affects states created by policy routing
    // rules and reply-to. Has no effect if gateway monitoring or its action are disabled
    // or if the gateway is forced down. May not have any effect on dynamic gateways
    // during a link loss event.<br>
    GwDownKillStates: TEnumPfsenseapi61;
    // Sets the interface this gateway will apply to.<br>
    _Interface: RawUtf8;
    // Sets how often ICMP probes will be sent in milliseconds.<br>
    Interval: integer;
    // Sets the Internet Protocol version this gateway uses.<br>
    Ipprotocol: TEnumPfsenseapi39;
    // Sets the threshold to consider latency as high. This value must be greater
    // than `latencylow`.<br>
    Latencyhigh: integer;
    // Sets the threshold to consider latency as low.<br>
    Latencylow: integer;
    // Sets the time interval in milliseconds before packets are treated as lost.<br>
    LossInterval: integer;
    // Sets the threshold to consider packet loss as high. This value must be greater
    // than `losslow`.<br>
    Losshigh: integer;
    // Sets the threshold to consider packet loss as low.<br>
    Losslow: integer;
    // Sets a different IP address to use when monitoring this gateway. This is typically
    // only
    // necessary if the gateway IP does not accept ICMP probes.<br><br>This field
    // is only available when the following conditions are met:<br>- `monitor_disable`
    // must be equal to `false`<br>
    Monitor: RawUtf8;
    // Disable gateway monitoring for this gateway.<br>
    MonitorDisable: boolean;
    // Sets a name for the gateway.<br>
    Name: RawUtf8;
    // Allows or disallows gateway IPs that are not a part of the parent interface's
    // subnet(s).<br>
    Nonlocalgateway: boolean;
    // Sets the time period in milliseconds over which results are averaged.<br>
    TimePeriod: integer;
    // Sets the weight for this gateway when used in a Gateway Group.<br>
    Weight: integer;
  end;
  PRoutingGateway = ^TRoutingGateway;

  TRoutingGatewayGroup = packed record
    // A description of the gateway group.<br>
    Descr: RawUtf8;
    // The assumed IP protocol of the gateways in this group.<br>
    Ipprotocol: RawUtf8;
    // The name of the gateway group.<br>
    Name: RawUtf8;
    // The priorities of the gateways in this group.<br>
    Priorities: variant;
    // The trigger that will cause a gateway to be excluded from the group.<br>
    Trigger: TEnumPfsenseapi62;
  end;
  PRoutingGatewayGroup = ^TRoutingGatewayGroup;

  TRoutingGatewayGroupPriority = packed record
    // The name of the gateway to prioritize in this gateway group.<br>
    Gateway: RawUtf8;
    // The priority of this gateway in the group. Lower numbered tiers are higher
    // priority.<br>
    Tier: integer;
    // The virtual IP to use for this gateway group. Use `address` to use the interface's
    // current IP.<br>
    VirtualIp: RawUtf8;
  end;
  PRoutingGatewayGroupPriority = ^TRoutingGatewayGroupPriority;

  TRoutingGatewayStatus = packed record
    // The current latency (in milliseconds) for this gateway.<br>
    Delay: single;
    // The current amount of packet loss (in percentage) for this gateway. This uses
    // a whole percentage (0.0-100.0).<br>
    Loss: single;
    // The current IP being monitored for this gateway.<br>
    Monitorip: RawUtf8;
    // The name of the gateway this status corresponds to.<br>
    Name: RawUtf8;
    // The current source IP being used to send monitoring probes to this gateway.<br>
    Srcip: RawUtf8;
    // The current status of this gateway. Typically, this will indicate if the gateway
    // is consider online or offline.<br>
    Status: RawUtf8;
    // The standard deviation in latency (in milliseconds) for this gateway.<br>
    Stddev: single;
    // The current sub-status of this gateway. Typically, this provide details into
    // problems this gateway is seeing such as latency or packet loss.<br>
    Substatus: RawUtf8;
  end;
  PRoutingGatewayStatus = ^TRoutingGatewayStatus;

  TSSH = packed record
    // Enable the SSH server on this system.<br>
    Enable: boolean;
    // The TCP port the SSH server will listen on. Valid options are: a TCP/UDP port
    // number<br>
    Port: RawUtf8;
    // Enable support for ssh-agent forwarding.<br>
    Sshdagentforwarding: boolean;
    // The SSH authentication mode to use. Use `enabled` to require public key authentication,
    // use both to require both a public key AND a password, or use `null` to allow
    // a password OR a public key.<br>
    Sshdkeyonly: TEnumPfsenseapi63;
  end;
  PSSH = ^TSSH;

  TServerError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PServerError = ^TServerError;

  TService = packed record
    // The action to perform against this service.<br>
    Action: TEnumPfsenseapi64;
    // The full descriptive name of the service.<br>
    Description: RawUtf8;
    // Indicates if the service is enabled.<br>
    Enabled: boolean;
    // The internal name of the service.<br>
    Name: RawUtf8;
    // Indicates if the service is actively running.<br>
    Status: boolean;
  end;
  PService = ^TService;

  TServiceUnavailableError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PServiceUnavailableError = ^TServiceUnavailableError;

  TServiceWatchdog = packed record
    // The description for the service being watched.<br>
    Description: RawUtf8;
    // Indicates if this Service Watchdog is enabled or disabled. This value is unused.<br>
    Enabled: boolean;
    // The name of the service to be watched.<br>
    Name: RawUtf8;
    // Enable or disable notifications being sent when Service Watchdogs finds this
    // service stopped.<br>
    Notify: boolean;
  end;
  PServiceWatchdog = ^TServiceWatchdog;

  TStaticRoute = packed record
    // Sets a description for administrative reference.<br>
    Descr: RawUtf8;
    // Disable this static route.<br>
    Disabled: boolean;
    // Sets which gateway this route applies to.<br>
    Gateway: RawUtf8;
    // Sets the destination network for this static route in CIDR notation.<br>
    Network: RawUtf8;
  end;
  PStaticRoute = ^TStaticRoute;

  TSuccess = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PSuccess = ^TSuccess;

  TSystemConsole = packed record
    // Enables or disables password protecting the console.<br>
    PasswdProtectConsole: boolean;
  end;
  PSystemConsole = ^TSystemConsole;

  TSystemDNS = packed record
    // Allow DNS servers to be overwritten by DHCP on WAN interfaces.<br>
    Dnsallowoverride: boolean;
    // Use local DNS server (DNS Resover or DNS Forwarder) as the primary DNS, or
    // use only remote DNS servers specified in `dnsserver`. Set to `null` to use
    // local DNS server as the primary and remote DNS servers as backup.<br>
    Dnslocalhost: TEnumPfsenseapi65;
    // The remote DNS server IPv4 or IPv6 addresses.<br>
    Dnsserver: TRawUtf8DynArray;
  end;
  PSystemDNS = ^TSystemDNS;

  TSystemHalt = packed record
    // Run through the call but don't actually initiate a shutdown.<br>
    DryRun: boolean;
  end;
  PSystemHalt = ^TSystemHalt;

  TSystemHostname = packed record
    // The domain portion of the FQDN to assign to this system.<br>
    Domain: RawUtf8;
    // The hostname portion of the FQDN to assign to this system.<br>
    Hostname: RawUtf8;
  end;
  PSystemHostname = ^TSystemHostname;

  TSystemLog = packed record
    // The raw text of the system log entry.<br>
    Text: RawUtf8;
  end;
  PSystemLog = ^TSystemLog;

  TSystemReboot = packed record
    // Run through the call but don't actually initiate a reboot.<br>
    DryRun: boolean;
  end;
  PSystemReboot = ^TSystemReboot;

  TSystemStatus = packed record
    // The build date of the BIOS version.<br>
    BiosDate: RawUtf8;
    // The name of the BIOS vendor.<br>
    BiosVendor: RawUtf8;
    // The BIOS version installed on this system.<br>
    BiosVersion: RawUtf8;
    // The total number of CPUs cores available on this system.<br>
    CpuCount: integer;
    // The CPU load averages. The first value represents the load average for the
    // last minute, the second value represents the load average for the last 5 minutes,
    // and the third value represents the load average for the last 15 minutes.<br>
    CpuLoadAvg: TSingleDynArray;
    // The model of CPU installed in this system and other CPU info.<br>
    CpuModel: RawUtf8;
    // The current CPU usage as a whole percentage. Note: This is an approximate usage
    // based on the last minute load average and total number of CPU cores. This may
    // not represent exact CPU usage.<br>
    CpuUsage: single;
    // The current disk usage as a whole percentage.<br>
    DiskUsage: single;
    // Indicates whether kernel PTI is enabled or not.<br>
    KernelPti: boolean;
    // The current MBUF usage as a whole percentage.<br>
    MbufUsage: single;
    // Indicates whether MDS mitigation is enabled or not.<br>
    MdsMitigation: RawUtf8;
    // The current memory usage as a whole percentage.<br>
    MemUsage: single;
    // The unique ID issued for this pfSense instance by Netgate.<br>
    NetgateId: RawUtf8;
    // The verbose name of this system's platform.<br>
    Platform: RawUtf8;
    // The system's unique serial number/ID.<br>
    Serial: RawUtf8;
    // The current swap usage as a whole percentage.<br>
    SwapUsage: single;
    // The current system temperature in celsius.<br>
    TempC: single;
    // The current system temperature in fahrenheit.<br>
    TempF: single;
    // The amount of time this system has been up since the last reboot.<br>
    Uptime: RawUtf8;
  end;
  PSystemStatus = ^TSystemStatus;

  TSystemTunable = packed record
    // A description for this tunable.<br>
    Descr: RawUtf8;
    // The name of the tunable to set.<br>
    Tunable: RawUtf8;
    // The value to assign this tunable.<br>
    Value: RawUtf8;
  end;
  PSystemTunable = ^TSystemTunable;

  TSystemVersion = packed record
    // The base pfSense version. For pfSense CE, this will be the major and minor
    // version but not the patch. For pfSense Plus, this will be the version year
    // and month but not the patch.<br>
    Base: RawUtf8;
    // The datetime string of when the pfSense version was initially built.<br>
    Buildtime: RawUtf8;
    // The pfSense build's patch version.<br>
    Patch: RawUtf8;
    // The official pfSense version release name. (e.g. X.X.X-RELEASE)<br>
    Version: RawUtf8;
  end;
  PSystemVersion = ^TSystemVersion;

  TTrafficShaper = packed record
    // The total bandwidth amount allowed by this traffic shaper.<br>
    Bandwidth: integer;
    // The scale type of the `bandwidth` field's value.<br>
    Bandwidthtype: TEnumPfsenseapi66;
    // Enables or disables this traffic shaper.<br>
    Enabled: boolean;
    // The interface this traffic shaper will be applied to.<br>
    _Interface: RawUtf8;
    // The name of this traffic shaper. This value is automatically set by the system
    // and cannot be changed.<br>
    Name: RawUtf8;
    // The number of packets that can be held in a queue waiting to be transmitted
    // by the shaper.<br><br>This field is only available when the following conditions
    // are met:<br>- `scheduler` must not be one of [ CODELQ ]<br>
    Qlimit: integer;
    // The child queues assigned to this traffic shaper.<br>
    Queue: variant;
    // The scheduler type to use for this traffic shaper. Changing this value will
    // automatically update any child queues assigned to this traffic shaper.<br>
    Scheduler: TEnumPfsenseapi67;
    // The size, in bytes, of the token bucket regulator. If `null`, heuristics based
    // on the interface bandwidth are used to determine the size.<br>
    Tbrconfig: integer;
  end;
  PTrafficShaper = ^TTrafficShaper;

  TTrafficShaperLimiter = packed record
    // The Active Queue Management (AQM) algorithm to use for this limiter. AQM is
    // the intelligent drop of network packets inside the limiter, when it becomes
    // full or gets close to becoming full, with the goal of reducing network congestion.<br>
    Aqm: TEnumPfsenseapi68;
    // The bandwidth profiles for this limiter.<br>
    Bandwidth: variant;
    // The limiter's bucket size (slots).<br>
    Buckets: integer;
    // The amount of delay (in milliseconds) added to traffic passing through this
    // limiter.<br>
    Delay: integer;
    // The verbose description for this limiter.<br>
    Description: RawUtf8;
    // Enable or disable ECN. ECN sets a reserved TCP flag when the queue is nearing
    // or exceeding capacity. Not all AQMs or schedulers support this.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be one of [ codel, pie, red, gred ]<br>- `sched` must be one of [ fq_codel,
    // fq_pie ]<br>
    Ecn: boolean;
    // Enables or disables this limiter and its child queues.<br>
    Enabled: boolean;
    // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
    // delay, packet loss and queue size given above will be created for each source/destination
    // IP address encountered, respectively. This makes it possible to easily specify
    // bandwidth limits per host or subnet.<br>
    Mask: TEnumPfsenseapi69;
    // The IPv4 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbits: integer;
    // The IPv6 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbitsv6: integer;
    // The unique name for this limiter.<br>
    Name: RawUtf8;
    // A unique number auto-assigned to this limiter. This is only used internally
    // by the system and cannot be manually set or changed.<br>
    Number: integer;
    // The value for the CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelInterval: integer;
    // The value for the CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelTarget: integer;
    // The value for the FQ CoDel flows parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelFlows: integer;
    // The value for the FQ CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelInterval: integer;
    // The value for the FQ CoDel limit parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelLimit: integer;
    // The value for the FQ CoDel quantum parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelQuantum: integer;
    // The value for the FQ CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelTarget: integer;
    // The value for the FQ PIE alpha parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieAlpha: integer;
    // The value for the FQ PIE beta parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieBeta: integer;
    // The value for the FQ PIE flows parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieFlows: integer;
    // The value for the FQ PIE limit parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieLimit: integer;
    // The value for the FQ PIE max_burst parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieMaxBurst: integer;
    // The value for the FQ PIE ecnth parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieMaxEcnth: integer;
    // The value for the FQ PIE quantum parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieQuantum: integer;
    // The value for the FQ PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieTarget: integer;
    // The value for the FQ PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieTupdate: integer;
    // The value for the GRED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxP: integer;
    // The value for the GRED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxTh: integer;
    // The value for the GRED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMinTh: integer;
    // The value for the GRED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredWQ: integer;
    // The value for the PIE alpha parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieAlpha: integer;
    // The value for the PIE beta parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieBeta: integer;
    // The value for the PIE max_burst parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieMaxBurst: integer;
    // The value for the PIE ecnth parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieMaxEcnth: integer;
    // The value for the PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTarget: integer;
    // The value for the PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTupdate: integer;
    // The value for the RED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxP: integer;
    // The value for the RED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxTh: integer;
    // The value for the RED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMinTh: integer;
    // The value for the RED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedWQ: integer;
    // Enable or disable cap drop adjustment.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    PieCapdrop: boolean;
    // Enable or disable turning PIE on and off depending on queue load.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieOnoff: boolean;
    // Enable or disable drop probability de-randomisation.<br><br>This field is only
    // available when the following conditions are met:<br>- `aqm` must be equal to
    // `'pie'`<br>
    PiePderand: boolean;
    // Set queue delay type to timestamps (true) or departure rate estimation (false).<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieQdelay: boolean;
    // The amount of packet loss (in percentage) added to traffic passing through
    // the limiter.<br>
    Plr: single;
    // The length of the limiter's queue which the scheduler and AQM are responsible
    // for. Set to `null` to assume default.<br>
    Qlimit: integer;
    // The child queues for this limiter.<br>
    Queue: variant;
    // The scheduler to use for this limiter. The scheduler manages the sequence of
    // network packets in the limiter's queue.<br>
    Sched: TEnumPfsenseapi70;
  end;
  PTrafficShaperLimiter = ^TTrafficShaperLimiter;

  TTrafficShaperLimiterBandwidth = packed record
    // The amount of bandwidth this profile allows.<br>
    Bw: integer;
    // The scale factor of the `bw` fields value.<br>
    Bwscale: TEnumPfsenseapi71;
    // The schedule to assign this bandwidth profile. When this firewall schedule
    // is active, this bandwidth profile will be used.<br>
    Bwsched: RawUtf8;
  end;
  PTrafficShaperLimiterBandwidth = ^TTrafficShaperLimiterBandwidth;

  TTrafficShaperLimiterQueue = packed record
    // The Active Queue Management (AQM) algorithm to use for this queue. AQM is the
    // intelligent drop of network packets inside the queue, when it becomes full
    // or gets close to becoming full, with the goal of reducing network congestion.<br>
    Aqm: TEnumPfsenseapi68;
    // The limiter queue's bucket size (slots).<br>
    Buckets: integer;
    // The verbose description for this limiter queue.<br>
    Description: RawUtf8;
    // Enable or disable ECN. ECN sets a reserved TCP flag when the queue is nearing
    // or exceeding capacity. Not all AQMs or schedulers support this.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be one of [ codel, pie, red, gred ]<br>- `sched` must be one of [ fq_codel,
    // fq_pie ]<br>
    Ecn: boolean;
    // Enables or disables this limiter queue.<br>
    Enabled: boolean;
    // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
    // delay, packet loss and queue size given above will be created for each source/destination
    // IP address encountered, respectively. This makes it possible to easily specify
    // bandwidth limits per host or subnet.<br>
    Mask: TEnumPfsenseapi69;
    // The IPv4 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbits: integer;
    // The IPv6 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbitsv6: integer;
    // The unique name for this limiter queue.<br>
    Name: RawUtf8;
    // A unique number auto-assigned to this limiter. This is only used internally
    // by the system and cannot be manually set or changed.<br>
    Number: integer;
    // The value for the CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelInterval: integer;
    // The value for the CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelTarget: integer;
    // The value for the GRED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxP: integer;
    // The value for the GRED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxTh: integer;
    // The value for the GRED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMinTh: integer;
    // The value for the GRED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredWQ: integer;
    // The value for the PIE alpha parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieAlpha: integer;
    // The value for the PIE beta parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieBeta: integer;
    // The value for the PIE max_burst parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieMaxBurst: integer;
    // The value for the PIE ecnth parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieMaxEcnth: integer;
    // The value for the PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTarget: integer;
    // The value for the PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTupdate: integer;
    // The value for the RED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxP: integer;
    // The value for the RED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxTh: integer;
    // The value for the RED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMinTh: integer;
    // The value for the RED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedWQ: integer;
    // Enable or disable cap drop adjustment.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    PieCapdrop: boolean;
    // Enable or disable turning PIE on and off depending on queue load.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieOnoff: boolean;
    // Enable or disable drop probability de-randomisation.<br><br>This field is only
    // available when the following conditions are met:<br>- `aqm` must be equal to
    // `'pie'`<br>
    PiePderand: boolean;
    // Set queue delay type to timestamps (true) or departure rate estimation (false).<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieQdelay: boolean;
    // The amount of packet loss (in percentage) added to traffic passing through
    // this limiter queue.<br>
    Plr: single;
    // The length of the limiter's queue which the scheduler and AQM are responsible
    // for. Set to `null` to assume default.<br>
    Qlimit: integer;
    // The share of the parent limiter this queue gets.<br>
    Weight: integer;
  end;
  PTrafficShaperLimiterQueue = ^TTrafficShaperLimiterQueue;

  TTrafficShaperQueue = packed record
    // The total bandwidth amount allowed by this traffic shaper.<br><br>This field
    // is only available when the following conditions are met:<br>- Parent field
    // `scheduler` must be one of [ FAIRQ, CBQ, HFSC ]<br>
    Bandwidth: integer;
    // The scale type of the `bandwidth` field's value.<br><br>This field is only
    // available when the following conditions are met:<br>- Parent field `scheduler`
    // must be one of [ FAIRQ, CBQ, HFSC ]<br>
    Bandwidthtype: TEnumPfsenseapi66;
    // Allow this queue to borrow from other queues when available.<br><br>This field
    // is only available when the following conditions are met:<br>- Parent field
    // `scheduler` must be equal to `'CBQ'`<br>
    Borrow: boolean;
    // <br><br>This field is only available when the following conditions are met:<br>-
    // Parent field `scheduler` must be equal to `'FAIRQ'`<br>
    Buckets: integer;
    // Use the 'Codel Active Queue' scheduler option for this traffic shaper queue.<br>
    Codel: boolean;
    // Mark this traffic shaper queue as the default queue.<br>
    Default: boolean;
    // A description for this traffic shaper queue.<br>
    Description: RawUtf8;
    // Use the 'Explicit Congestion Notification' scheduler option for this traffic
    // shaper queue.<br>
    Ecn: boolean;
    // Enables or disables the traffic shaper queue.<br>
    Enabled: boolean;
    // The bandwidth limit per host.<br><br>This field is only available when the
    // following conditions are met:<br>- Parent field `scheduler` must be equal to
    // `'FAIRQ'`<br>
    Hogs: integer;
    // The parent interface this traffic shaper queue a child of. This value is automatically
    // determined by the queue's parent and cannot be manually set or changed.<br>
    _Interface: RawUtf8;
    // Allow sharing bandwidth from this queue for other queues as long as the real
    // time values have been satisfied.<br><br>This field is only available when the
    // following conditions are met:<br>- Parent field `scheduler` must be equal to
    // `'HFSC'`<br>
    Linkshare: boolean;
    // The duration (in milliseconds) that the initial bandwidth limit (`linkshare_m1`)
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `linkshare` must be equal to `true`<br>
    LinkshareD: integer;
    // The initial bandwidth limit for this traffic shaper queue when link sharing.<br><br>This
    // field is only available when the following conditions are met:<br>- `linkshare`
    // must be equal to `true`<br>
    LinkshareM1: RawUtf8;
    // The maximum bandwidth this traffic shaper queue is allowed to use. Note: This
    // behaves exactly the same as the `bandwidth` field. If this field is set, it
    // will override whatever value is current assigned to the `bandwidth` field.<br><br>This
    // field is only available when the following conditions are met:<br>- `linkshare`
    // must be equal to `true`<br>
    LinkshareM2: RawUtf8;
    // The name to assign this traffic shaper queue.<br>
    Name: RawUtf8;
    // The priority level for this traffic shaper queue.<br><br>This field is only
    // available when the following conditions are met:<br>- Parent field `scheduler`
    // must be one of [ FAIRQ, CBQ, PRIQ ]<br>
    Priority: integer;
    // The number of packets that can be held in a queue waiting to be transmitted
    // by the shaper.<br>
    Qlimit: integer;
    // Allow setting the guaranteed bandwidth minimum allotted to the queue.<br><br>This
    // field is only available when the following conditions are met:<br>- Parent
    // field `scheduler` must be equal to `'HFSC'`<br>
    Realtime: boolean;
    // The duration (in milliseconds) that the guaranteed bandwidth limit (`realtime_m1`)
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `realtime` must be equal to `true`<br>
    RealtimeD: integer;
    // The guaranteed minimum bandwidth limit for this traffic shaper queue during
    // real time.<br><br>This field is only available when the following conditions
    // are met:<br>- `realtime` must be equal to `true`<br>
    RealtimeM1: RawUtf8;
    // The maximum bandwidth this traffic shaper queue is allowed to use. Note: This
    // value should not exceed 30% of parent queue's maximum bandwidth.<br><br>This
    // field is only available when the following conditions are met:<br>- `realtime`
    // must be equal to `true`<br>
    RealtimeM2: RawUtf8;
    // Use the 'Random Early Detection' scheduler option for this traffic shaper queue.<br>
    Red: boolean;
    // Use the 'Random Early Detection In and Out' scheduler option for this traffic
    // shaper queue.<br>
    Rio: boolean;
    // Allow setting the maximum bandwidth allowed for the queue. Will force hard
    // bandwidth limiting.<br><br>This field is only available when the following
    // conditions are met:<br>- Parent field `scheduler` must be equal to `'HFSC'`<br>
    Upperlimit: boolean;
    // The duration (in milliseconds) that the burst-able bandwidth limit (`upperlimit_m1`
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `upperlimit` must be equal to `true`<br>
    UpperlimitD: integer;
    // The burst-able bandwidth limit for this traffic shaper queue.<br><br>This field
    // is only available when the following conditions are met:<br>- `upperlimit`
    // must be equal to `true`<br>
    UpperlimitM1: RawUtf8;
    // The normal bandwidth limit for this traffic shaper queue. If `upperlimit_m1`
    // is not defined, this limit will always be in effect. If `upperlimit_m1` is
    // defined, this limit will take effect after the `upperlimit_d` duration has
    // expired.<br><br>This field is only available when the following conditions
    // are met:<br>- `upperlimit` must be equal to `true`<br>
    UpperlimitM2: RawUtf8;
  end;
  PTrafficShaperQueue = ^TTrafficShaperQueue;

  TUnprocessableContentError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PUnprocessableContentError = ^TUnprocessableContentError;

  TUser = packed record
    // The SSH authorized keys to assign this user.<br>
    Authorizedkeys: RawUtf8;
    // The user certificates to assign this user. Items must be existing certificate
    // `refid`s.<br>
    Cert: TRawUtf8DynArray;
    // The full descriptive name for this local user.<br>
    Descr: RawUtf8;
    // Disable this local user.<br>
    Disabled: boolean;
    // The expiration date for this user in mm/dd/YYYY format. Use empty string for
    // no expiration<br>
    Expires: RawUtf8;
    // The IPsec pre-shared key to assign this user.<br>
    Ipsecpsk: RawUtf8;
    // The username of this local user.<br>
    Name: RawUtf8;
    // The password of this local user.<br>
    Password: RawUtf8;
    // The privileges assigned to this local user.<br>
    Priv: TRawUtf8DynArray;
    // The scope of this local user. This value is automatically assigned and cannot
    // be changed.<br>
    Scope: RawUtf8;
    // The UID of this local user. This value is automatically assigned and cannot
    // be changed.<br>
    Uid: integer;
  end;
  PUser = ^TUser;

  TUserGroup = packed record
    // The description to assign to this user group.<br>
    Description: RawUtf8;
    // The GID of this user group. This value is automatically assigned and cannot
    // be changed.<br>
    Gid: integer;
    // The local user names to assign to this user group.<br>
    Member: TRawUtf8DynArray;
    // The name for this user group.<br>
    Name: RawUtf8;
    // The privileges to assign to this user group.<br>
    Priv: TRawUtf8DynArray;
    // The scope of this user group. Use `local` for user groups that only apply to
    // this system. use `remote` for groups that also apply to remote authentication
    // servers.<br>
    Scope: TEnumPfsenseapi65;
  end;
  PUserGroup = ^TUserGroup;

  TValidationError = packed record
    // An array of links to resources that are related to this API response.
    Links: variant;
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // The descriptive message detailing the results of the API call.
    Message: RawUtf8;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: RawUtf8;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: RawUtf8;
  end;
  PValidationError = ^TValidationError;

  TVirtualIP = packed record
    // The base frequency that this machine will advertise.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Advbase: integer;
    // The frequency skew that this machine will advertise.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Advskew: integer;
    // The CARP mode to use for this virtual IP. Please note this field is exclusive
    // to pfSense Plus and has no effect on CE.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    CarpMode: TEnumPfsenseapi72;
    // The IP address of the CARP peer. Please note this field is exclusive to pfSense
    // Plus and has no effect on CE.<br><br>This field is only available when the
    // following conditions are met:<br>- `carp_mode` must be equal to `'ucast'`<br>
    CarpPeer: RawUtf8;
    // The current CARP status of this virtual IP. This will display show whether
    // this CARP node is the primary or backup peer.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    CarpStatus: RawUtf8;
    // A description for administrative reference<br>
    Descr: RawUtf8;
    // The interface this virtual IP will apply to.<br>
    _Interface: RawUtf8;
    // The virtual IP mode to use for this virtual IP.<br>
    Mode: TEnumPfsenseapi73;
    // Disable expansion of this entry into IPs on NAT lists (e.g. 192.168.1.0/24
    // expands to 256 entries.)<br><br>This field is only available when the following
    // conditions are met:<br>- `mode` must be one of [ proxyarp, other ]<br>
    Noexpand: boolean;
    // The VHID group password shared by all CARP members.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Password: RawUtf8;
    // The address for this virtual IP.<br>
    Subnet: RawUtf8;
    // The subnet bits for this virtual IP. For `proxyarp` and `other` virtual IPs,
    // this value specifies a block of many IP address. For all other virtual IP modes,
    // this specifies the subnet mask<br>
    SubnetBits: integer;
    // The virtual IP scope type. The `network` option is only applicable to the `proxyarp`
    // and `other` virtual IP modes.<br>
    _Type: TEnumPfsenseapi74;
    // The unique ID for this virtual IP.<br>
    Uniqid: RawUtf8;
    // The VHID group that the machines will share.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    Vhid: integer;
  end;
  PVirtualIP = ^TVirtualIP;

  TVirtualIPApply = packed record
    // Displays `true` when all virtual IP changes are applied and there are no pending
    // changes left.Displays `false` when there are pending virtual IP changes that
    // have not been applied.<br>
    Applied: boolean;
  end;
  PVirtualIPApply = ^TVirtualIPApply;

  TWakeOnLANSend = packed record
    // The interface the host to be woken up is connected to.<br>
    _Interface: RawUtf8;
    // The MAC address of the host to be awoken.<br>
    MacAddr: RawUtf8;
  end;
  PWakeOnLANSend = ^TWakeOnLANSend;

  TWebGUISettings = packed record
    // The port on which the web GUI listens. Valid options are: a TCP/UDP port number<br>
    Port: RawUtf8;
    // The protocol to use for the web GUI.<br>
    Protocol: TEnumPfsenseapi9;
    // The SSL/TLS certificate to use for the web GUI.<br>
    Sslcertref: RawUtf8;
  end;
  PWebGUISettings = ^TWebGUISettings;



const
  // define how enums/sets are actually transmitted as JSON array of string
  ENUMPFSENSEAPI1_TXT: array[TEnumPfsenseapi1] of RawUtf8 = (
    '', 'one', 'subtree');
  ENUMPFSENSEAPI2_TXT: array[TEnumPfsenseapi2] of RawUtf8 = (
    '', 'SSL/TLS Encrypted', 'STARTTLS Encrypt', 'Standard TCP');
  ENUMPFSENSEAPI3_TXT: array[TEnumPfsenseapi3] of RawUtf8 = (
    '', 'CHAP_MD5', 'MSCHAPv1', 'MSCHAPv2', 'PAP');
  ENUMPFSENSEAPI4_TXT: array[TEnumPfsenseapi4] of RawUtf8 = (
    '', 'ldap', 'radius');
  ENUMPFSENSEAPI5_TXT: array[TEnumPfsenseapi5] of RawUtf8 = (
    '', 'auto', 'off', 'on');
  ENUMPFSENSEAPI6_TXT: array[TEnumPfsenseapi6] of RawUtf8 = (
    '', '', '-4', '-6');
  ENUMPFSENSEAPI7_TXT: array[TEnumPfsenseapi7] of RawUtf8 = (
    '', 'client', 'config', 'database', 'default', 'dispatch', 'dnssec',
    'general', 'lame-servers', 'network', 'notify', 'queries', 'resolver',
    'security', 'unmatched', 'update', 'xfer-in', 'xfer-out');
  ENUMPFSENSEAPI8_TXT: array[TEnumPfsenseapi8] of RawUtf8 = (
    '', 'critical', 'debug 1', 'debug 3', 'debug 5', 'dynamic', 'error',
    'info', 'notice', 'warning');
  ENUMPFSENSEAPI9_TXT: array[TEnumPfsenseapi9] of RawUtf8 = (
    '', 'http', 'https');
  ENUMPFSENSEAPI10_TXT: array[TEnumPfsenseapi10] of RawUtf8 = (
    '', 'auto', 'disabled', 'manual');
  ENUMPFSENSEAPI11_TXT: array[TEnumPfsenseapi11] of RawUtf8 = (
    '', 'forward', 'master', 'redirect', 'slave');
  ENUMPFSENSEAPI12_TXT: array[TEnumPfsenseapi12] of RawUtf8 = (
    '', 'A', 'AAAA', 'CNAME', 'LOC', 'MX', 'NS', 'PTR', 'SPF', 'SRV', 'TXT');
  ENUMPFSENSEAPI13_TXT: array[TEnumPfsenseapi13] of RawUtf8 = (
    '', 'server', 'user');
  ENUMPFSENSEAPI14_TXT: array[TEnumPfsenseapi14] of RawUtf8 = (
    '', 'ECDSA', 'RSA');
  ENUMPFSENSEAPI15_TXT: array[TEnumPfsenseapi15] of RawUtf8 = (
    '', 'high', 'legacy', 'low');
  ENUMPFSENSEAPI16_TXT: array[TEnumPfsenseapi16] of RawUtf8 = (
    '', 'existing', 'internal');
  ENUMPFSENSEAPI17_TXT: array[TEnumPfsenseapi17] of RawUtf8 = (
    '', 'LOGIN', 'PLAIN');
  ENUMPFSENSEAPI18_TXT: array[TEnumPfsenseapi18] of RawUtf8 = (
    '', 'host', 'network', 'port');
  ENUMPFSENSEAPI19_TXT: array[TEnumPfsenseapi19] of RawUtf8 = (
    '', 'any', 'in', 'out');
  ENUMPFSENSEAPI20_TXT: array[TEnumPfsenseapi20] of RawUtf8 = (
    '', 'althost', 'any', 'dataconv', 'echorep', 'echoreq', 'inforep',
    'inforeq', 'ipv6-here', 'ipv6-where', 'maskrep', 'maskreq', 'mobredir',
    'mobregrep', 'mobregreq', 'paramprob', 'photuris', 'redir', 'routeradv',
    'routersol', 'skip', 'squench', 'timerep', 'timereq', 'timex', 'trace',
    'unreach');
  ENUMPFSENSEAPI21_TXT: array[TEnumPfsenseapi21] of RawUtf8 = (
    '', 'inet', 'inet46', 'inet6');
  ENUMPFSENSEAPI22_TXT: array[TEnumPfsenseapi22] of RawUtf8 = (
    '', 'ah', 'carp', 'esp', 'gre', 'icmp', 'igmp', 'ipv6', 'ospf', 'pfsync',
    'pim', 'tcp', 'tcp/udp', 'udp');
  ENUMPFSENSEAPI23_TXT: array[TEnumPfsenseapi23] of RawUtf8 = (
    '', 'keep state', 'none', 'sloppy state', 'synproxy state');
  ENUMPFSENSEAPI24_TXT: array[TEnumPfsenseapi24] of RawUtf8 = (
    '', 'ack', 'cwr', 'ece', 'fin', 'psh', 'rst', 'syn', 'urg');
  ENUMPFSENSEAPI25_TXT: array[TEnumPfsenseapi25] of RawUtf8 = (
    '', 'block', 'pass', 'reject');
  ENUMPFSENSEAPI26_TXT: array[TEnumPfsenseapi26] of RawUtf8 = (
    '', 'fast', 'slow');
  ENUMPFSENSEAPI27_TXT: array[TEnumPfsenseapi27] of RawUtf8 = (
    '', 'l2', 'l2,l3', 'l2,l3,l4', 'l2,l4', 'l3', 'l3,l4', 'l4');
  ENUMPFSENSEAPI28_TXT: array[TEnumPfsenseapi28] of RawUtf8 = (
    '', 'failover', 'lacp', 'loadbalance', 'none', 'roundrobin');
  ENUMPFSENSEAPI29_TXT: array[TEnumPfsenseapi29] of RawUtf8 = (
    '', 'rfc3164', 'rfc5424');
  ENUMPFSENSEAPI30_TXT: array[TEnumPfsenseapi30] of RawUtf8 = (
    '', 'ipv4', 'ipv6');
  ENUMPFSENSEAPI31_TXT: array[TEnumPfsenseapi31] of RawUtf8 = (
    '', 'bzip2', 'gzip', 'none', 'xz', 'zstd');
  ENUMPFSENSEAPI32_TXT: array[TEnumPfsenseapi32] of RawUtf8 = (
    '', 'auto', 'inet', 'inet6');
  ENUMPFSENSEAPI33_TXT: array[TEnumPfsenseapi33] of RawUtf8 = (
    '', '', '10', '11', '12', '13', '14', '15', '16', '17', '3', '4', '5',
    '6', '7', '8', '9', 'omit');
  ENUMPFSENSEAPI34_TXT: array[TEnumPfsenseapi34] of RawUtf8 = (
    '', 'md5', 'sha1', 'sha256');
  ENUMPFSENSEAPI35_TXT: array[TEnumPfsenseapi35] of RawUtf8 = (
    '', 'peer', 'pool', 'server');
  ENUMPFSENSEAPI36_TXT: array[TEnumPfsenseapi36] of RawUtf8 = (
    '', 'SavedCfg');
  ENUMPFSENSEAPI37_TXT: array[TEnumPfsenseapi37] of RawUtf8 = (
    '', 'dhcp', 'none', 'static');
  ENUMPFSENSEAPI38_TXT: array[TEnumPfsenseapi38] of RawUtf8 = (
    '', '6rd', '6to4', 'dhcp6', 'none', 'slaac', 'staticv6', 'track6');
  ENUMPFSENSEAPI39_TXT: array[TEnumPfsenseapi39] of RawUtf8 = (
    '', 'inet', 'inet6');
  ENUMPFSENSEAPI40_TXT: array[TEnumPfsenseapi40] of RawUtf8 = (
    '', 'disable', 'enable');
  ENUMPFSENSEAPI41_TXT: array[TEnumPfsenseapi41] of RawUtf8 = (
    '', 'asym', 'no', 'yes');
  ENUMPFSENSEAPI42_TXT: array[TEnumPfsenseapi42] of RawUtf8 = (
    '', 'both', 'v4only', 'v6only');
  ENUMPFSENSEAPI43_TXT: array[TEnumPfsenseapi43] of RawUtf8 = (
    '', 'tap', 'tun');
  ENUMPFSENSEAPI44_TXT: array[TEnumPfsenseapi44] of RawUtf8 = (
    '', '1', '2', '3', '4', '5', 'none');
  ENUMPFSENSEAPI45_TXT: array[TEnumPfsenseapi45] of RawUtf8 = (
    '', 'p2p_tls');
  ENUMPFSENSEAPI46_TXT: array[TEnumPfsenseapi46] of RawUtf8 = (
    '', 'ping_exit', 'ping_restart');
  ENUMPFSENSEAPI47_TXT: array[TEnumPfsenseapi47] of RawUtf8 = (
    '', 'keepalive', 'ping');
  ENUMPFSENSEAPI48_TXT: array[TEnumPfsenseapi48] of RawUtf8 = (
    '', 'TCP', 'TCP4', 'TCP6', 'UDP', 'UDP4', 'UDP6');
  ENUMPFSENSEAPI49_TXT: array[TEnumPfsenseapi49] of RawUtf8 = (
    '', 'basic', 'none', 'ntlm');
  ENUMPFSENSEAPI50_TXT: array[TEnumPfsenseapi50] of RawUtf8 = (
    '', 'auth', 'crypt');
  ENUMPFSENSEAPI51_TXT: array[TEnumPfsenseapi51] of RawUtf8 = (
    '', '0', '1', '2', 'default');
  ENUMPFSENSEAPI52_TXT: array[TEnumPfsenseapi52] of RawUtf8 = (
    '', 'net30', 'subnet');
  ENUMPFSENSEAPI53_TXT: array[TEnumPfsenseapi53] of RawUtf8 = (
    '', 'p2p_tls', 'server_tls', 'server_tls_user', 'server_user');
  ENUMPFSENSEAPI54_TXT: array[TEnumPfsenseapi54] of RawUtf8 = (
    '', 'bitmask', 'random', 'random sticky-address', 'round-robin', 'round-robin sticky-address',
    'source-hash');
  ENUMPFSENSEAPI55_TXT: array[TEnumPfsenseapi55] of RawUtf8 = (
    '', 'ah', 'esp', 'gre', 'icmp', 'igmp', 'ipv6', 'ospf', 'pim', 'tcp',
    'tcp/udp', 'udp');
  ENUMPFSENSEAPI56_TXT: array[TEnumPfsenseapi56] of RawUtf8 = (
    '', 'advanced', 'automatic', 'disabled', 'hybrid');
  ENUMPFSENSEAPI57_TXT: array[TEnumPfsenseapi57] of RawUtf8 = (
    '', 'disable', 'enable', 'purenat');
  ENUMPFSENSEAPI58_TXT: array[TEnumPfsenseapi58] of RawUtf8 = (
    '', 'allow', 'deny');
  ENUMPFSENSEAPI59_TXT: array[TEnumPfsenseapi59] of RawUtf8 = (
    '', 'sha256', 'sha384', 'sha512');
  ENUMPFSENSEAPI60_TXT: array[TEnumPfsenseapi60] of RawUtf8 = (
    '', 'descr', 'id', 'if');
  ENUMPFSENSEAPI61_TXT: array[TEnumPfsenseapi61] of RawUtf8 = (
    '', '', 'down', 'none');
  ENUMPFSENSEAPI62_TXT: array[TEnumPfsenseapi62] of RawUtf8 = (
    '', 'down', 'downlatency', 'downloss', 'downlosslatency');
  ENUMPFSENSEAPI63_TXT: array[TEnumPfsenseapi63] of RawUtf8 = (
    '', 'both', 'enabled');
  ENUMPFSENSEAPI64_TXT: array[TEnumPfsenseapi64] of RawUtf8 = (
    '', 'restart', 'start', 'stop');
  ENUMPFSENSEAPI65_TXT: array[TEnumPfsenseapi65] of RawUtf8 = (
    '', 'local', 'remote');
  ENUMPFSENSEAPI66_TXT: array[TEnumPfsenseapi66] of RawUtf8 = (
    '', '%', 'Gb', 'Kb', 'Mb', 'b');
  ENUMPFSENSEAPI67_TXT: array[TEnumPfsenseapi67] of RawUtf8 = (
    '', 'CBQ', 'CODELQ', 'FAIRQ', 'HFSC', 'PRIQ');
  ENUMPFSENSEAPI68_TXT: array[TEnumPfsenseapi68] of RawUtf8 = (
    '', 'codel', 'droptail', 'gred', 'pie', 'red');
  ENUMPFSENSEAPI69_TXT: array[TEnumPfsenseapi69] of RawUtf8 = (
    '', 'dstaddress', 'none', 'srcaddress');
  ENUMPFSENSEAPI70_TXT: array[TEnumPfsenseapi70] of RawUtf8 = (
    '', 'fifo', 'fq_codel', 'fq_pie', 'prio', 'qfq', 'rr', 'wf2q+');
  ENUMPFSENSEAPI71_TXT: array[TEnumPfsenseapi71] of RawUtf8 = (
    '', 'Kb', 'Mb', 'b');
  ENUMPFSENSEAPI72_TXT: array[TEnumPfsenseapi72] of RawUtf8 = (
    '', 'mcast', 'ucast');
  ENUMPFSENSEAPI73_TXT: array[TEnumPfsenseapi73] of RawUtf8 = (
    '', 'carp', 'ipalias', 'other', 'proxyarp');
  ENUMPFSENSEAPI74_TXT: array[TEnumPfsenseapi74] of RawUtf8 = (
    '', 'network', 'single');
  ENUMPFSENSEAPI75_TXT: array[TEnumPfsenseapi75] of RawUtf8 = (
    '', 'SORT_ASC', 'SORT_DESC');
  ENUMPFSENSEAPI76_TXT: array[TEnumPfsenseapi76] of RawUtf8 = (
    '', 'SORT_FLAG_CASE', 'SORT_LOCALE_STRING', 'SORT_NATURAL', 'SORT_NUMERIC',
    'SORT_REGULAR', 'SORT_STRING');


implementation

{ ************ Custom RTTI/JSON initialization }

const
  // exact definition of the DTOs expected JSON serialization
  _TARPTable = 'dnsresolve:RawUtf8 expires:RawUtf8 hostname:RawUtf8 interface:RawUtf8 ' +
    'ip_address:RawUtf8 mac_address:RawUtf8 permanent:boolean type:RawUtf8';
  _TAuthServer = 'host:RawUtf8 ldap_allow_unauthenticated:boolean ldap_attr_group:RawUtf8 ' +
    'ldap_attr_groupobj:RawUtf8 ldap_attr_member:RawUtf8 ldap_attr_user:RawUtf8 ' +
    'ldap_authcn:RawUtf8 ldap_basedn:RawUtf8 ldap_binddn:RawUtf8 ldap_bindpw:RawUtf8 ' +
    'ldap_caref:RawUtf8 ldap_extended_enabled:boolean ldap_extended_query:RawUtf8 ' +
    'ldap_nostrip_at:boolean ldap_pam_groupdn:RawUtf8 ldap_port:RawUtf8 ldap_protver:integer ' +
    'ldap_rfc2307:boolean ldap_rfc2307_userdn:boolean ldap_scope:TEnumPfsenseapi1 ' +
    'ldap_timeout:integer ldap_urltype:TEnumPfsenseapi2 ldap_utf8:boolean name:RawUtf8 ' +
    'radius_acct_port:RawUtf8 radius_auth_port:RawUtf8 radius_nasip_attribute:RawUtf8 ' +
    'radius_protocol:TEnumPfsenseapi3 radius_secret:RawUtf8 radius_timeout:integer ' +
    'refid:RawUtf8 type:TEnumPfsenseapi4';
  _TAuthenticationError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TAvailableInterface = 'dmesg:RawUtf8 if:RawUtf8 in_use_by:RawUtf8 mac:RawUtf8';
  _TAvailablePackage = 'deps:TRawUtf8DynArray descr:RawUtf8 installed:boolean ' +
    'name:RawUtf8 shortname:RawUtf8 version:RawUtf8';
  _TBINDAccessList = 'description:RawUtf8 entries:variant name:RawUtf8';
  _TBINDAccessListEntry = 'description:RawUtf8 value:RawUtf8';
  _TBINDSettings = 'bind_custom_options:RawUtf8 bind_dnssec_validation:TEnumPfsenseapi5 ' +
    'bind_forwarder:boolean bind_forwarder_ips:TRawUtf8DynArray bind_global_settings:RawUtf8 ' +
    'bind_hide_version:boolean bind_ip_version:TEnumPfsenseapi6 bind_logging:boolean ' +
    'bind_notify:boolean bind_ram_limit:RawUtf8 controlport:RawUtf8 enable_bind:boolean ' +
    'listenon:TRawUtf8DynArray listenport:RawUtf8 log_only:boolean log_options:TEnumPfsenseapi7Set ' +
    'log_severity:TEnumPfsenseapi8 rate_enabled:boolean rate_limit:integer';
  _TBINDSyncRemoteHost = 'ipaddress:RawUtf8 password:RawUtf8 syncdestinenable:boolean ' +
    'syncport:RawUtf8 syncprotocol:TEnumPfsenseapi9 username:RawUtf8';
  _TBINDSyncSettings = 'masterip:RawUtf8 synconchanges:TEnumPfsenseapi10 ' +
    'synctimeout:integer';
  _TBINDView = 'allow_recursion:TRawUtf8DynArray bind_custom_options:RawUtf8 ' +
    'descr:RawUtf8 match_clients:TRawUtf8DynArray name:RawUtf8 recursion:boolean';
  _TBINDZone = 'allowquery:TRawUtf8DynArray allowtransfer:TRawUtf8DynArray ' +
    'allowupdate:TRawUtf8DynArray backupkeys:boolean baseip:RawUtf8 custom:RawUtf8 ' +
    'customzonerecords:RawUtf8 description:RawUtf8 disabled:boolean dnssec:boolean ' +
    'enable_updatepolicy:boolean expire:integer forwarders:TRawUtf8DynArray ' +
    'mail:RawUtf8 minimum:integer name:RawUtf8 nameserver:RawUtf8 records:variant ' +
    'refresh:integer regdhcpstatic:boolean retry:integer reversev4:boolean reversev6:boolean ' +
    'rpz:boolean serial:integer slaveip:RawUtf8 ttl:integer type:TEnumPfsenseapi11 ' +
    'updatepolicy:RawUtf8 view:TRawUtf8DynArray';
  _TBINDZoneRecord = 'name:RawUtf8 priority:integer rdata:RawUtf8 type:TEnumPfsenseapi12';
  _TCARP = 'enable:boolean maintenance_mode:boolean';
  _TCertificate = 'caref:RawUtf8 crt:RawUtf8 csr:RawUtf8 descr:RawUtf8 prv:RawUtf8 ' +
    'refid:RawUtf8 type:TEnumPfsenseapi13';
  _TCertificateAuthority = 'crt:RawUtf8 descr:RawUtf8 prv:RawUtf8 randomserial:boolean ' +
    'refid:RawUtf8 serial:integer trust:boolean';
  _TCertificateAuthorityGenerate = 'caref:RawUtf8 crt:RawUtf8 descr:RawUtf8 ' +
    'digest_alg:RawUtf8 dn_city:RawUtf8 dn_commonname:RawUtf8 dn_country:RawUtf8 ' +
    'dn_organization:RawUtf8 dn_organizationalunit:RawUtf8 dn_state:RawUtf8 ' +
    'ecname:RawUtf8 is_intermediate:boolean keylen:integer keytype:TEnumPfsenseapi14 ' +
    'lifetime:integer prv:RawUtf8 randomserial:boolean refid:RawUtf8 serial:integer ' +
    'trust:boolean';
  _TCertificateAuthorityRenew = 'caref:RawUtf8 newserial:RawUtf8 oldserial:RawUtf8 ' +
    'reusekey:boolean reuseserial:boolean strictsecurity:boolean';
  _TCertificateGenerate = 'caref:RawUtf8 crt:RawUtf8 descr:RawUtf8 digest_alg:RawUtf8 ' +
    'dn_city:RawUtf8 dn_commonname:RawUtf8 dn_country:RawUtf8 dn_dns_sans:TRawUtf8DynArray ' +
    'dn_email_sans:TRawUtf8DynArray dn_ip_sans:TRawUtf8DynArray dn_organization:RawUtf8 ' +
    'dn_organizationalunit:RawUtf8 dn_state:RawUtf8 dn_uri_sans:TRawUtf8DynArray ' +
    'ecname:RawUtf8 keylen:integer keytype:TEnumPfsenseapi14 lifetime:integer ' +
    'prv:RawUtf8 refid:RawUtf8 type:TEnumPfsenseapi13';
  _TCertificatePKCS12Export = 'binary_data:RawUtf8 certref:RawUtf8 encryption:TEnumPfsenseapi15 ' +
    'filename:RawUtf8 passphrase:RawUtf8';
  _TCertificateRenew = 'certref:RawUtf8 newserial:RawUtf8 oldserial:RawUtf8 ' +
    'reusekey:boolean reuseserial:boolean strictsecurity:boolean';
  _TCertificateRevocationList = 'caref:RawUtf8 cert:variant descr:RawUtf8 ' +
    'lifetime:integer method:TEnumPfsenseapi16 refid:RawUtf8 serial:integer ' +
    'text:RawUtf8';
  _TCertificateRevocationListRevokedCertificate = 'caref:RawUtf8 certref:RawUtf8 ' +
    'crt:RawUtf8 descr:RawUtf8 prv:RawUtf8 reason:integer revoke_time:integer ' +
    'serial:RawUtf8 type:RawUtf8';
  _TCertificateSigningRequest = 'csr:RawUtf8 descr:RawUtf8 digest_alg:RawUtf8 ' +
    'dn_city:RawUtf8 dn_commonname:RawUtf8 dn_country:RawUtf8 dn_dns_sans:TRawUtf8DynArray ' +
    'dn_email_sans:TRawUtf8DynArray dn_ip_sans:TRawUtf8DynArray dn_organization:RawUtf8 ' +
    'dn_organizationalunit:RawUtf8 dn_state:RawUtf8 dn_uri_sans:TRawUtf8DynArray ' +
    'ecname:RawUtf8 keylen:integer keytype:TEnumPfsenseapi14 lifetime:integer ' +
    'prv:RawUtf8 refid:RawUtf8 type:TEnumPfsenseapi13';
  _TCertificateSigningRequestSign = 'caref:RawUtf8 crt:RawUtf8 csr:RawUtf8 ' +
    'descr:RawUtf8 digest_alg:RawUtf8 dn_dns_sans:TRawUtf8DynArray dn_email_sans:TRawUtf8DynArray ' +
    'dn_ip_sans:TRawUtf8DynArray dn_uri_sans:TRawUtf8DynArray lifetime:integer ' +
    'prv:RawUtf8 refid:RawUtf8 type:TEnumPfsenseapi13';
  _TCommandPrompt = 'command:RawUtf8 output:RawUtf8 result_code:integer';
  _TConfigHistoryRevision = 'description:RawUtf8 filesize:integer time:integer ' +
    'version:RawUtf8';
  _TConflictError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TCronJob = 'command:RawUtf8 hour:RawUtf8 mday:RawUtf8 minute:RawUtf8 month:RawUtf8 ' +
    'wday:RawUtf8 who:RawUtf8';
  _TDefaultGateway = 'defaultgw4:RawUtf8 defaultgw6:RawUtf8';
  _TEmailNotificationSettings = 'authentication_mechanism:TEnumPfsenseapi17 ' +
    'disable:boolean fromaddress:RawUtf8 ipaddress:RawUtf8 notifyemailaddress:RawUtf8 ' +
    'password:RawUtf8 port:RawUtf8 ssl:boolean sslvalidate:boolean timeout:integer ' +
    'username:RawUtf8';
  _TFailedDependencyError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TFirewallAdvancedSettings = 'aliasesresolveinterval:integer checkaliasesurlcert:boolean';
  _TFirewallAlias = 'address:TRawUtf8DynArray descr:RawUtf8 detail:TRawUtf8DynArray ' +
    'name:RawUtf8 type:TEnumPfsenseapi18';
  _TFirewallApply = 'applied:boolean pending_subsystems:TRawUtf8DynArray';
  _TFirewallLog = 'text:RawUtf8';
  _TFirewallRule = 'ackqueue:RawUtf8 associated_rule_id:RawUtf8 created_by:RawUtf8 ' +
    'created_time:integer defaultqueue:RawUtf8 descr:RawUtf8 destination:RawUtf8 ' +
    'destination_port:RawUtf8 direction:TEnumPfsenseapi19 disabled:boolean dnpipe:RawUtf8 ' +
    'floating:boolean gateway:RawUtf8 icmptype:TEnumPfsenseapi20Set interface:TRawUtf8DynArray ' +
    'ipprotocol:TEnumPfsenseapi21 log:boolean pdnpipe:RawUtf8 protocol:TEnumPfsenseapi22 ' +
    'quick:boolean sched:RawUtf8 source:RawUtf8 source_port:RawUtf8 statetype:TEnumPfsenseapi23 ' +
    'tag:RawUtf8 tcp_flags_any:boolean tcp_flags_out_of:TEnumPfsenseapi24Set ' +
    'tcp_flags_set:TEnumPfsenseapi24Set tracker:integer type:TEnumPfsenseapi25 ' +
    'updated_by:RawUtf8 updated_time:integer';
  _TFirewallSchedule = 'active:boolean descr:RawUtf8 name:RawUtf8 schedlabel:RawUtf8 ' +
    'timerange:variant';
  _TFirewallScheduleTimeRange = 'day:TIntegerDynArray hour:RawUtf8 month:TIntegerDynArray ' +
    'position:TIntegerDynArray rangedescr:RawUtf8';
  _TFirewallState = 'age:RawUtf8 bytes_in:integer bytes_out:integer bytes_total:integer ' +
    'destination:RawUtf8 direction:RawUtf8 expires_in:RawUtf8 interface:RawUtf8 ' +
    'packets_in:integer packets_out:integer packets_total:integer protocol:RawUtf8 ' +
    'source:RawUtf8 state:RawUtf8';
  _TFirewallStatesSize = 'currentstates:integer defaultmaximumstates:integer ' +
    'maximumstates:integer';
  _TInterfaceApply = 'applied:boolean pending_interfaces:TRawUtf8DynArray';
  _TInterfaceBridge = 'bridgeif:RawUtf8 descr:RawUtf8 members:TRawUtf8DynArray';
  _TInterfaceGRE = 'add_static_route:boolean descr:RawUtf8 greif:RawUtf8 ' +
    'if:RawUtf8 remote_addr:RawUtf8 tunnel_local_addr:RawUtf8 tunnel_local_addr6:RawUtf8 ' +
    'tunnel_remote_addr:RawUtf8 tunnel_remote_addr6:RawUtf8 tunnel_remote_net:integer ' +
    'tunnel_remote_net6:integer';
  _TInterfaceGroup = 'descr:RawUtf8 ifname:RawUtf8 members:TRawUtf8DynArray';
  _TInterfaceLAGG = 'descr:RawUtf8 failovermaster:RawUtf8 lacptimeout:TEnumPfsenseapi26 ' +
    'lagghash:TEnumPfsenseapi27 laggif:RawUtf8 members:TRawUtf8DynArray proto:TEnumPfsenseapi28';
  _TInterfaceStats = 'collisions:integer descr:RawUtf8 dhcplink:RawUtf8 enable:boolean ' +
    'gateway:RawUtf8 gatewayv6:RawUtf8 hwif:RawUtf8 inbytes:integer inbytespass:integer ' +
    'inerrs:integer inpkts:integer inpktspass:integer ipaddr:RawUtf8 ipaddrv6:RawUtf8 ' +
    'linklocal:RawUtf8 macaddr:RawUtf8 media:RawUtf8 mtu:RawUtf8 name:RawUtf8 ' +
    'outbytes:integer outbytespass:integer outerrs:integer outpkts:integer outpktspass:integer ' +
    'status:RawUtf8 subnet:RawUtf8 subnetv6:RawUtf8';
  _TInterfaceVLAN = 'descr:RawUtf8 if:RawUtf8 pcp:integer tag:integer vlanif:RawUtf8';
  _TLogSettings = 'auth:boolean dhcp:boolean disablelocallogging:boolean ' +
    'dpinger:boolean enableremotelogging:boolean filter:boolean filterdescriptions:integer ' +
    'format:TEnumPfsenseapi29 hostapd:boolean ipprotocol:TEnumPfsenseapi30 logall:boolean ' +
    'logcompressiontype:TEnumPfsenseapi31 logconfigchanges:boolean logfilesize:integer ' +
    'nentries:integer nologbogons:boolean nologdefaultblock:boolean nologdefaultpass:boolean ' +
    'nolognginx:boolean nologprivatenets:boolean ntpd:boolean portalauth:boolean ' +
    'ppp:boolean rawfilter:boolean remoteserver:RawUtf8 remoteserver2:RawUtf8 ' +
    'remoteserver3:RawUtf8 resolver:boolean reverseorder:boolean rotatecount:integer ' +
    'routing:boolean sourceip:RawUtf8 system:boolean vpn:boolean';
  _TMediaTypeError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TMethodNotAllowedError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TNTPSettings = 'clockstats:boolean dnsresolv:TEnumPfsenseapi32 enable:boolean ' +
    'interface:TRawUtf8DynArray leapsec:RawUtf8 logpeer:boolean logsys:boolean ' +
    'loopstats:boolean ntpmaxpeers:integer ntpmaxpoll:TEnumPfsenseapi33 ntpminpoll:TEnumPfsenseapi33 ' +
    'orphan:integer peerstats:boolean serverauth:boolean serverauthalgo:TEnumPfsenseapi34 ' +
    'serverauthkey:RawUtf8 statsgraph:boolean';
  _TNTPTimeServer = 'noselect:boolean prefer:boolean timeserver:RawUtf8 type:TEnumPfsenseapi35';
  _TNetworkInterface = 'adv_dhcp_config_advanced:boolean adv_dhcp_config_file_override:boolean ' +
    'adv_dhcp_config_file_override_path:RawUtf8 adv_dhcp_option_modifiers:RawUtf8 ' +
    'adv_dhcp_pt_backoff_cutoff:integer adv_dhcp_pt_initial_interval:integer ' +
    'adv_dhcp_pt_reboot:integer adv_dhcp_pt_retry:integer adv_dhcp_pt_select_timeout:integer ' +
    'adv_dhcp_pt_timeout:integer adv_dhcp_pt_values:TEnumPfsenseapi36 adv_dhcp_request_options:RawUtf8 ' +
    'adv_dhcp_required_options:RawUtf8 adv_dhcp_send_options:RawUtf8 alias_address:RawUtf8 ' +
    'alias_subnet:integer blockbogons:boolean blockpriv:boolean descr:RawUtf8 ' +
    'dhcphostname:RawUtf8 dhcprejectfrom:TRawUtf8DynArray enable:boolean gateway:RawUtf8 ' +
    'gateway_6rd:RawUtf8 gatewayv6:RawUtf8 if:RawUtf8 ipaddr:RawUtf8 ipaddrv6:RawUtf8 ' +
    'ipv6usev4iface:boolean media:RawUtf8 mediaopt:RawUtf8 mss:integer mtu:integer ' +
    'prefix_6rd:RawUtf8 prefix_6rd_v4plen:integer slaacusev4iface:boolean spoofmac:RawUtf8 ' +
    'subnet:integer subnetv6:integer track6_interface:RawUtf8 track6_prefix_id_hex:RawUtf8 ' +
    'typev4:TEnumPfsenseapi37 typev6:TEnumPfsenseapi38';
  _TNotAcceptableError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TNotFoundError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TOneToOneNATMapping = 'descr:RawUtf8 destination:RawUtf8 disabled:boolean ' +
    'external:RawUtf8 interface:RawUtf8 ipprotocol:TEnumPfsenseapi39 natreflection:TEnumPfsenseapi40 ' +
    'nobinat:boolean source:RawUtf8';
  _TOpenVPNClient = 'allow_compression:TEnumPfsenseapi41 auth_pass:RawUtf8 ' +
    'auth_retry_none:boolean auth_user:RawUtf8 caref:RawUtf8 certref:RawUtf8 ' +
    'create_gw:TEnumPfsenseapi42 custom_options:TRawUtf8DynArray data_ciphers:TRawUtf8DynArray ' +
    'data_ciphers_fallback:RawUtf8 description:RawUtf8 dev_mode:TEnumPfsenseapi43 ' +
    'digest:RawUtf8 disable:boolean dns_add:boolean exit_notify:TEnumPfsenseapi44 ' +
    'inactive_seconds:integer interface:RawUtf8 keepalive_interval:integer keepalive_timeout:integer ' +
    'local_port:RawUtf8 mode:TEnumPfsenseapi45 passtos:boolean ping_action:TEnumPfsenseapi46 ' +
    'ping_action_seconds:integer ping_method:TEnumPfsenseapi47 ping_seconds:integer ' +
    'protocol:TEnumPfsenseapi48 proxy_addr:RawUtf8 proxy_authtype:TEnumPfsenseapi49 ' +
    'proxy_passwd:RawUtf8 proxy_port:RawUtf8 proxy_user:RawUtf8 remote_cert_tls:boolean ' +
    'remote_network:TRawUtf8DynArray remote_networkv6:TRawUtf8DynArray route_no_exec:boolean ' +
    'route_no_pull:boolean server_addr:RawUtf8 server_port:RawUtf8 sndrcvbuf:integer ' +
    'tls:RawUtf8 tls_type:TEnumPfsenseapi50 tlsauth_keydir:TEnumPfsenseapi51 ' +
    'topology:TEnumPfsenseapi52 tunnel_network:RawUtf8 tunnel_networkv6:RawUtf8 ' +
    'udp_fast_io:boolean use_shaper:integer verbosity_level:integer vpnid:integer ' +
    'vpnif:RawUtf8';
  _TOpenVPNClientSpecificOverride = 'block:boolean common_name:RawUtf8 custom_options:TRawUtf8DynArray ' +
    'description:RawUtf8 disable:boolean dns_domain:RawUtf8 dns_server1:RawUtf8 ' +
    'dns_server2:RawUtf8 dns_server3:RawUtf8 dns_server4:RawUtf8 gwredir:boolean ' +
    'local_network:TRawUtf8DynArray local_networkv6:TRawUtf8DynArray netbios_enable:boolean ' +
    'netbios_ntype:integer netbios_scope:RawUtf8 ntp_server1:RawUtf8 ntp_server2:RawUtf8 ' +
    'push_reset:boolean remote_network:TRawUtf8DynArray remote_networkv6:TRawUtf8DynArray ' +
    'remove_route:boolean server_list:TRawUtf8DynArray tunnel_network:RawUtf8 ' +
    'tunnel_networkv6:RawUtf8 wins_server1:RawUtf8 wins_server2:RawUtf8';
  _TOpenVPNClientStatus = 'connect_time:RawUtf8 local_host:RawUtf8 local_port:RawUtf8 ' +
    'mgmt:RawUtf8 name:RawUtf8 port:RawUtf8 remote_host:RawUtf8 remote_port:RawUtf8 ' +
    'state:RawUtf8 state_detail:RawUtf8 status:RawUtf8 virtual_addr:RawUtf8 ' +
    'virtual_addr6:RawUtf8 vpnid:integer';
  _TOpenVPNServer = 'allow_compression:TEnumPfsenseapi41 authmode:TRawUtf8DynArray ' +
    'caref:RawUtf8 cert_depth:integer certref:RawUtf8 client2client:boolean ' +
    'connlimit:integer create_gw:TEnumPfsenseapi42 custom_options:TRawUtf8DynArray ' +
    'data_ciphers:TRawUtf8DynArray data_ciphers_fallback:RawUtf8 description:RawUtf8 ' +
    'dev_mode:TEnumPfsenseapi43 dh_length:RawUtf8 digest:RawUtf8 disable:boolean ' +
    'dns_domain:RawUtf8 dns_server1:RawUtf8 dns_server2:RawUtf8 dns_server3:RawUtf8 ' +
    'dns_server4:RawUtf8 duplicate_cn:boolean dynamic_ip:boolean ecdh_curve:RawUtf8 ' +
    'gwredir:boolean gwredir6:boolean inactive_seconds:integer interface:RawUtf8 ' +
    'keepalive_interval:integer keepalive_timeout:integer local_network:TRawUtf8DynArray ' +
    'local_networkv6:TRawUtf8DynArray local_port:RawUtf8 maxclients:integer ' +
    'mode:TEnumPfsenseapi53 netbios_enable:boolean netbios_ntype:integer netbios_scope:RawUtf8 ' +
    'ntp_server1:RawUtf8 ntp_server2:RawUtf8 passtos:boolean ping_action:TEnumPfsenseapi46 ' +
    'ping_action_push:boolean ping_action_seconds:integer ping_method:TEnumPfsenseapi47 ' +
    'ping_push:boolean ping_seconds:integer protocol:TEnumPfsenseapi48 push_blockoutsidedns:boolean ' +
    'push_register_dns:boolean remote_cert_tls:boolean remote_network:TRawUtf8DynArray ' +
    'remote_networkv6:TRawUtf8DynArray serverbridge_dhcp:boolean serverbridge_dhcp_end:RawUtf8 ' +
    'serverbridge_dhcp_start:RawUtf8 serverbridge_interface:RawUtf8 serverbridge_routegateway:boolean ' +
    'sndrcvbuf:integer strictusercn:boolean tls:RawUtf8 tls_type:TEnumPfsenseapi50 ' +
    'tlsauth_keydir:TEnumPfsenseapi51 topology:TEnumPfsenseapi52 tunnel_network:RawUtf8 ' +
    'tunnel_networkv6:RawUtf8 use_tls:boolean username_as_common_name:boolean ' +
    'verbosity_level:integer vpnid:integer vpnif:RawUtf8 wins_server1:RawUtf8 ' +
    'wins_server2:RawUtf8';
  _TOpenVPNServerConnectionStatus = 'bytes_recv:integer bytes_sent:integer ' +
    'cipher:RawUtf8 client_id:integer common_name:RawUtf8 connect_time:RawUtf8 ' +
    'connect_time_unix:integer peer_id:integer remote_host:RawUtf8 user_name:RawUtf8 ' +
    'virtual_addr:RawUtf8 virtual_addr6:RawUtf8';
  _TOpenVPNServerRouteStatus = 'common_name:RawUtf8 last_time:RawUtf8 remote_host:RawUtf8 ' +
    'virtual_addr:RawUtf8';
  _TOpenVPNServerStatus = 'conns:variant mgmt:RawUtf8 mode:RawUtf8 name:RawUtf8 ' +
    'port:RawUtf8 routes:variant vpnid:integer';
  _TOutboundNATMapping = 'descr:RawUtf8 destination:RawUtf8 destination_port:RawUtf8 ' +
    'disabled:boolean interface:RawUtf8 nat_port:RawUtf8 nonat:boolean nosync:boolean ' +
    'poolopts:TEnumPfsenseapi54 protocol:TEnumPfsenseapi55 source:RawUtf8 source_hash_key:RawUtf8 ' +
    'source_port:RawUtf8 static_nat_port:boolean target:RawUtf8 target_subnet:integer';
  _TOutboundNATMode = 'mode:TEnumPfsenseapi56';
  _TPackage = 'descr:RawUtf8 installed_version:RawUtf8 latest_version:RawUtf8 ' +
    'name:RawUtf8 shortname:RawUtf8 update_available:boolean';
  _TPortForward = 'associated_rule_id:RawUtf8 created_by:RawUtf8 created_time:integer ' +
    'descr:RawUtf8 destination:RawUtf8 destination_port:RawUtf8 disabled:boolean ' +
    'interface:RawUtf8 ipprotocol:TEnumPfsenseapi21 local_port:RawUtf8 natreflection:TEnumPfsenseapi57 ' +
    'nordr:boolean nosync:boolean protocol:TEnumPfsenseapi55 source:RawUtf8 ' +
    'source_port:RawUtf8 target:RawUtf8 updated_by:RawUtf8 updated_time:integer';
  _TRESTAPIAccessListEntry = 'descr:RawUtf8 network:RawUtf8 sched:RawUtf8 ' +
    'type:TEnumPfsenseapi58 users:TRawUtf8DynArray weight:integer';
  _TRESTAPIJWT = 'token:RawUtf8';
  _TRESTAPIKey = 'descr:RawUtf8 hash:RawUtf8 hash_algo:TEnumPfsenseapi59 ' +
    'key:RawUtf8 length_bytes:integer username:RawUtf8';
  _TRESTAPISettings = 'allow_pre_releases:boolean allowed_interfaces:TRawUtf8DynArray ' +
    'auth_methods:TRawUtf8DynArray enabled:boolean expose_sensitive_fields:boolean ' +
    'ha_sync:boolean ha_sync_hosts:TRawUtf8DynArray ha_sync_password:RawUtf8 ' +
    'ha_sync_username:RawUtf8 ha_sync_validate_certs:boolean hateoas:boolean ' +
    'jwt_exp:integer keep_backup:boolean log_successful_auth:boolean login_protection:boolean ' +
    'override_sensitive_fields:TRawUtf8DynArray read_only:boolean represent_interfaces_as:TEnumPfsenseapi60';
  _TRESTAPISettingsSync = 'sync_data:RawUtf8';
  _TRESTAPIVersion = 'available_versions:TRawUtf8DynArray current_version:RawUtf8 ' +
    'install_version:RawUtf8 latest_version:RawUtf8 latest_version_release_date:RawUtf8 ' +
    'update_available:boolean';
  _TRoutingApply = 'applied:boolean';
  _TRoutingGateway = 'action_disable:boolean alert_interval:integer data_payload:integer ' +
    'descr:RawUtf8 disabled:boolean dpinger_dont_add_static_route:boolean force_down:boolean ' +
    'gateway:RawUtf8 gw_down_kill_states:TEnumPfsenseapi61 interface:RawUtf8 ' +
    'interval:integer ipprotocol:TEnumPfsenseapi39 latencyhigh:integer latencylow:integer ' +
    'loss_interval:integer losshigh:integer losslow:integer monitor:RawUtf8 ' +
    'monitor_disable:boolean name:RawUtf8 nonlocalgateway:boolean time_period:integer ' +
    'weight:integer';
  _TRoutingGatewayGroup = 'descr:RawUtf8 ipprotocol:RawUtf8 name:RawUtf8 ' +
    'priorities:variant trigger:TEnumPfsenseapi62';
  _TRoutingGatewayGroupPriority = 'gateway:RawUtf8 tier:integer virtual_ip:RawUtf8';
  _TRoutingGatewayStatus = 'delay:single loss:single monitorip:RawUtf8 name:RawUtf8 ' +
    'srcip:RawUtf8 status:RawUtf8 stddev:single substatus:RawUtf8';
  _TSSH = 'enable:boolean port:RawUtf8 sshdagentforwarding:boolean sshdkeyonly:TEnumPfsenseapi63';
  _TServerError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TService = 'action:TEnumPfsenseapi64 description:RawUtf8 enabled:boolean ' +
    'name:RawUtf8 status:boolean';
  _TServiceUnavailableError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TServiceWatchdog = 'description:RawUtf8 enabled:boolean name:RawUtf8 notify:boolean';
  _TStaticRoute = 'descr:RawUtf8 disabled:boolean gateway:RawUtf8 network:RawUtf8';
  _TSuccess = '_links:variant code:integer data:variant message:RawUtf8 response_id:RawUtf8 ' +
    'status:RawUtf8';
  _TSystemConsole = 'passwd_protect_console:boolean';
  _TSystemDNS = 'dnsallowoverride:boolean dnslocalhost:TEnumPfsenseapi65 ' +
    'dnsserver:TRawUtf8DynArray';
  _TSystemHalt = 'dry_run:boolean';
  _TSystemHostname = 'domain:RawUtf8 hostname:RawUtf8';
  _TSystemLog = 'text:RawUtf8';
  _TSystemReboot = 'dry_run:boolean';
  _TSystemStatus = 'bios_date:RawUtf8 bios_vendor:RawUtf8 bios_version:RawUtf8 ' +
    'cpu_count:integer cpu_load_avg:TSingleDynArray cpu_model:RawUtf8 cpu_usage:single ' +
    'disk_usage:single kernel_pti:boolean mbuf_usage:single mds_mitigation:RawUtf8 ' +
    'mem_usage:single netgate_id:RawUtf8 platform:RawUtf8 serial:RawUtf8 swap_usage:single ' +
    'temp_c:single temp_f:single uptime:RawUtf8';
  _TSystemTunable = 'descr:RawUtf8 tunable:RawUtf8 value:RawUtf8';
  _TSystemVersion = 'base:RawUtf8 buildtime:RawUtf8 patch:RawUtf8 version:RawUtf8';
  _TTrafficShaper = 'bandwidth:integer bandwidthtype:TEnumPfsenseapi66 enabled:boolean ' +
    'interface:RawUtf8 name:RawUtf8 qlimit:integer queue:variant scheduler:TEnumPfsenseapi67 ' +
    'tbrconfig:integer';
  _TTrafficShaperLimiter = 'aqm:TEnumPfsenseapi68 bandwidth:variant buckets:integer ' +
    'delay:integer description:RawUtf8 ecn:boolean enabled:boolean mask:TEnumPfsenseapi69 ' +
    'maskbits:integer maskbitsv6:integer name:RawUtf8 number:integer param_codel_interval:integer ' +
    'param_codel_target:integer param_fq_codel_flows:integer param_fq_codel_interval:integer ' +
    'param_fq_codel_limit:integer param_fq_codel_quantum:integer param_fq_codel_target:integer ' +
    'param_fq_pie_alpha:integer param_fq_pie_beta:integer param_fq_pie_flows:integer ' +
    'param_fq_pie_limit:integer param_fq_pie_max_burst:integer param_fq_pie_max_ecnth:integer ' +
    'param_fq_pie_quantum:integer param_fq_pie_target:integer param_fq_pie_tupdate:integer ' +
    'param_gred_max_p:integer param_gred_max_th:integer param_gred_min_th:integer ' +
    'param_gred_w_q:integer param_pie_alpha:integer param_pie_beta:integer param_pie_max_burst:integer ' +
    'param_pie_max_ecnth:integer param_pie_target:integer param_pie_tupdate:integer ' +
    'param_red_max_p:integer param_red_max_th:integer param_red_min_th:integer ' +
    'param_red_w_q:integer pie_capdrop:boolean pie_onoff:boolean pie_pderand:boolean ' +
    'pie_qdelay:boolean plr:single qlimit:integer queue:variant sched:TEnumPfsenseapi70';
  _TTrafficShaperLimiterBandwidth = 'bw:integer bwscale:TEnumPfsenseapi71 ' +
    'bwsched:RawUtf8';
  _TTrafficShaperLimiterQueue = 'aqm:TEnumPfsenseapi68 buckets:integer description:RawUtf8 ' +
    'ecn:boolean enabled:boolean mask:TEnumPfsenseapi69 maskbits:integer maskbitsv6:integer ' +
    'name:RawUtf8 number:integer param_codel_interval:integer param_codel_target:integer ' +
    'param_gred_max_p:integer param_gred_max_th:integer param_gred_min_th:integer ' +
    'param_gred_w_q:integer param_pie_alpha:integer param_pie_beta:integer param_pie_max_burst:integer ' +
    'param_pie_max_ecnth:integer param_pie_target:integer param_pie_tupdate:integer ' +
    'param_red_max_p:integer param_red_max_th:integer param_red_min_th:integer ' +
    'param_red_w_q:integer pie_capdrop:boolean pie_onoff:boolean pie_pderand:boolean ' +
    'pie_qdelay:boolean plr:single qlimit:integer weight:integer';
  _TTrafficShaperQueue = 'bandwidth:integer bandwidthtype:TEnumPfsenseapi66 ' +
    'borrow:boolean buckets:integer codel:boolean default:boolean description:RawUtf8 ' +
    'ecn:boolean enabled:boolean hogs:integer interface:RawUtf8 linkshare:boolean ' +
    'linkshare_d:integer linkshare_m1:RawUtf8 linkshare_m2:RawUtf8 name:RawUtf8 ' +
    'priority:integer qlimit:integer realtime:boolean realtime_d:integer realtime_m1:RawUtf8 ' +
    'realtime_m2:RawUtf8 red:boolean rio:boolean upperlimit:boolean upperlimit_d:integer ' +
    'upperlimit_m1:RawUtf8 upperlimit_m2:RawUtf8';
  _TUnprocessableContentError = '_links:variant code:integer data:variant ' +
    'message:RawUtf8 response_id:RawUtf8 status:RawUtf8';
  _TUser = 'authorizedkeys:RawUtf8 cert:TRawUtf8DynArray descr:RawUtf8 disabled:boolean ' +
    'expires:RawUtf8 ipsecpsk:RawUtf8 name:RawUtf8 password:RawUtf8 priv:TRawUtf8DynArray ' +
    'scope:RawUtf8 uid:integer';
  _TUserGroup = 'description:RawUtf8 gid:integer member:TRawUtf8DynArray ' +
    'name:RawUtf8 priv:TRawUtf8DynArray scope:TEnumPfsenseapi65';
  _TValidationError = '_links:variant code:integer data:variant message:RawUtf8 ' +
    'response_id:RawUtf8 status:RawUtf8';
  _TVirtualIP = 'advbase:integer advskew:integer carp_mode:TEnumPfsenseapi72 ' +
    'carp_peer:RawUtf8 carp_status:RawUtf8 descr:RawUtf8 interface:RawUtf8 mode:TEnumPfsenseapi73 ' +
    'noexpand:boolean password:RawUtf8 subnet:RawUtf8 subnet_bits:integer type:TEnumPfsenseapi74 ' +
    'uniqid:RawUtf8 vhid:integer';
  _TVirtualIPApply = 'applied:boolean';
  _TWakeOnLANSend = 'interface:RawUtf8 mac_addr:RawUtf8';
  _TWebGUISettings = 'port:RawUtf8 protocol:TEnumPfsenseapi9 sslcertref:RawUtf8';


procedure RegisterRtti;
begin
  TRttiJson.RegisterCustomEnumValues([
    TypeInfo(TEnumPfsenseapi1), nil, @ENUMPFSENSEAPI1_TXT,
    TypeInfo(TEnumPfsenseapi2), nil, @ENUMPFSENSEAPI2_TXT,
    TypeInfo(TEnumPfsenseapi3), nil, @ENUMPFSENSEAPI3_TXT,
    TypeInfo(TEnumPfsenseapi4), nil, @ENUMPFSENSEAPI4_TXT,
    TypeInfo(TEnumPfsenseapi5), nil, @ENUMPFSENSEAPI5_TXT,
    TypeInfo(TEnumPfsenseapi6), nil, @ENUMPFSENSEAPI6_TXT,
    TypeInfo(TEnumPfsenseapi7), TypeInfo(TEnumPfsenseapi7Set), @ENUMPFSENSEAPI7_TXT,
    TypeInfo(TEnumPfsenseapi8), nil, @ENUMPFSENSEAPI8_TXT,
    TypeInfo(TEnumPfsenseapi9), nil, @ENUMPFSENSEAPI9_TXT,
    TypeInfo(TEnumPfsenseapi10), nil, @ENUMPFSENSEAPI10_TXT,
    TypeInfo(TEnumPfsenseapi11), nil, @ENUMPFSENSEAPI11_TXT,
    TypeInfo(TEnumPfsenseapi12), nil, @ENUMPFSENSEAPI12_TXT,
    TypeInfo(TEnumPfsenseapi13), nil, @ENUMPFSENSEAPI13_TXT,
    TypeInfo(TEnumPfsenseapi14), nil, @ENUMPFSENSEAPI14_TXT,
    TypeInfo(TEnumPfsenseapi15), nil, @ENUMPFSENSEAPI15_TXT,
    TypeInfo(TEnumPfsenseapi16), nil, @ENUMPFSENSEAPI16_TXT,
    TypeInfo(TEnumPfsenseapi17), nil, @ENUMPFSENSEAPI17_TXT,
    TypeInfo(TEnumPfsenseapi18), nil, @ENUMPFSENSEAPI18_TXT,
    TypeInfo(TEnumPfsenseapi19), nil, @ENUMPFSENSEAPI19_TXT,
    TypeInfo(TEnumPfsenseapi20), TypeInfo(TEnumPfsenseapi20Set), @ENUMPFSENSEAPI20_TXT,
    TypeInfo(TEnumPfsenseapi21), nil, @ENUMPFSENSEAPI21_TXT,
    TypeInfo(TEnumPfsenseapi22), nil, @ENUMPFSENSEAPI22_TXT,
    TypeInfo(TEnumPfsenseapi23), nil, @ENUMPFSENSEAPI23_TXT,
    TypeInfo(TEnumPfsenseapi24), TypeInfo(TEnumPfsenseapi24Set), @ENUMPFSENSEAPI24_TXT,
    TypeInfo(TEnumPfsenseapi25), nil, @ENUMPFSENSEAPI25_TXT,
    TypeInfo(TEnumPfsenseapi26), nil, @ENUMPFSENSEAPI26_TXT,
    TypeInfo(TEnumPfsenseapi27), nil, @ENUMPFSENSEAPI27_TXT,
    TypeInfo(TEnumPfsenseapi28), nil, @ENUMPFSENSEAPI28_TXT,
    TypeInfo(TEnumPfsenseapi29), nil, @ENUMPFSENSEAPI29_TXT,
    TypeInfo(TEnumPfsenseapi30), nil, @ENUMPFSENSEAPI30_TXT,
    TypeInfo(TEnumPfsenseapi31), nil, @ENUMPFSENSEAPI31_TXT,
    TypeInfo(TEnumPfsenseapi32), nil, @ENUMPFSENSEAPI32_TXT,
    TypeInfo(TEnumPfsenseapi33), nil, @ENUMPFSENSEAPI33_TXT,
    TypeInfo(TEnumPfsenseapi34), nil, @ENUMPFSENSEAPI34_TXT,
    TypeInfo(TEnumPfsenseapi35), nil, @ENUMPFSENSEAPI35_TXT,
    TypeInfo(TEnumPfsenseapi36), nil, @ENUMPFSENSEAPI36_TXT,
    TypeInfo(TEnumPfsenseapi37), nil, @ENUMPFSENSEAPI37_TXT,
    TypeInfo(TEnumPfsenseapi38), nil, @ENUMPFSENSEAPI38_TXT,
    TypeInfo(TEnumPfsenseapi39), nil, @ENUMPFSENSEAPI39_TXT,
    TypeInfo(TEnumPfsenseapi40), nil, @ENUMPFSENSEAPI40_TXT,
    TypeInfo(TEnumPfsenseapi41), nil, @ENUMPFSENSEAPI41_TXT,
    TypeInfo(TEnumPfsenseapi42), nil, @ENUMPFSENSEAPI42_TXT,
    TypeInfo(TEnumPfsenseapi43), nil, @ENUMPFSENSEAPI43_TXT,
    TypeInfo(TEnumPfsenseapi44), nil, @ENUMPFSENSEAPI44_TXT,
    TypeInfo(TEnumPfsenseapi45), nil, @ENUMPFSENSEAPI45_TXT,
    TypeInfo(TEnumPfsenseapi46), nil, @ENUMPFSENSEAPI46_TXT,
    TypeInfo(TEnumPfsenseapi47), nil, @ENUMPFSENSEAPI47_TXT,
    TypeInfo(TEnumPfsenseapi48), nil, @ENUMPFSENSEAPI48_TXT,
    TypeInfo(TEnumPfsenseapi49), nil, @ENUMPFSENSEAPI49_TXT,
    TypeInfo(TEnumPfsenseapi50), nil, @ENUMPFSENSEAPI50_TXT,
    TypeInfo(TEnumPfsenseapi51), nil, @ENUMPFSENSEAPI51_TXT,
    TypeInfo(TEnumPfsenseapi52), nil, @ENUMPFSENSEAPI52_TXT,
    TypeInfo(TEnumPfsenseapi53), nil, @ENUMPFSENSEAPI53_TXT,
    TypeInfo(TEnumPfsenseapi54), nil, @ENUMPFSENSEAPI54_TXT,
    TypeInfo(TEnumPfsenseapi55), nil, @ENUMPFSENSEAPI55_TXT,
    TypeInfo(TEnumPfsenseapi56), nil, @ENUMPFSENSEAPI56_TXT,
    TypeInfo(TEnumPfsenseapi57), nil, @ENUMPFSENSEAPI57_TXT,
    TypeInfo(TEnumPfsenseapi58), nil, @ENUMPFSENSEAPI58_TXT,
    TypeInfo(TEnumPfsenseapi59), nil, @ENUMPFSENSEAPI59_TXT,
    TypeInfo(TEnumPfsenseapi60), nil, @ENUMPFSENSEAPI60_TXT,
    TypeInfo(TEnumPfsenseapi61), nil, @ENUMPFSENSEAPI61_TXT,
    TypeInfo(TEnumPfsenseapi62), nil, @ENUMPFSENSEAPI62_TXT,
    TypeInfo(TEnumPfsenseapi63), nil, @ENUMPFSENSEAPI63_TXT,
    TypeInfo(TEnumPfsenseapi64), nil, @ENUMPFSENSEAPI64_TXT,
    TypeInfo(TEnumPfsenseapi65), nil, @ENUMPFSENSEAPI65_TXT,
    TypeInfo(TEnumPfsenseapi66), nil, @ENUMPFSENSEAPI66_TXT,
    TypeInfo(TEnumPfsenseapi67), nil, @ENUMPFSENSEAPI67_TXT,
    TypeInfo(TEnumPfsenseapi68), nil, @ENUMPFSENSEAPI68_TXT,
    TypeInfo(TEnumPfsenseapi69), nil, @ENUMPFSENSEAPI69_TXT,
    TypeInfo(TEnumPfsenseapi70), nil, @ENUMPFSENSEAPI70_TXT,
    TypeInfo(TEnumPfsenseapi71), nil, @ENUMPFSENSEAPI71_TXT,
    TypeInfo(TEnumPfsenseapi72), nil, @ENUMPFSENSEAPI72_TXT,
    TypeInfo(TEnumPfsenseapi73), nil, @ENUMPFSENSEAPI73_TXT,
    TypeInfo(TEnumPfsenseapi74), nil, @ENUMPFSENSEAPI74_TXT,
    TypeInfo(TEnumPfsenseapi75), nil, @ENUMPFSENSEAPI75_TXT,
    TypeInfo(TEnumPfsenseapi76), nil, @ENUMPFSENSEAPI76_TXT]);
  Rtti.RegisterFromText([
    TypeInfo(TARPTable), _TARPTable,
    TypeInfo(TAuthServer), _TAuthServer,
    TypeInfo(TAuthenticationError), _TAuthenticationError,
    TypeInfo(TAvailableInterface), _TAvailableInterface,
    TypeInfo(TAvailablePackage), _TAvailablePackage,
    TypeInfo(TBINDAccessList), _TBINDAccessList,
    TypeInfo(TBINDAccessListEntry), _TBINDAccessListEntry,
    TypeInfo(TBINDSettings), _TBINDSettings,
    TypeInfo(TBINDSyncRemoteHost), _TBINDSyncRemoteHost,
    TypeInfo(TBINDSyncSettings), _TBINDSyncSettings,
    TypeInfo(TBINDView), _TBINDView,
    TypeInfo(TBINDZone), _TBINDZone,
    TypeInfo(TBINDZoneRecord), _TBINDZoneRecord,
    TypeInfo(TCARP), _TCARP,
    TypeInfo(TCertificate), _TCertificate,
    TypeInfo(TCertificateAuthority), _TCertificateAuthority,
    TypeInfo(TCertificateAuthorityGenerate), _TCertificateAuthorityGenerate,
    TypeInfo(TCertificateAuthorityRenew), _TCertificateAuthorityRenew,
    TypeInfo(TCertificateGenerate), _TCertificateGenerate,
    TypeInfo(TCertificatePKCS12Export), _TCertificatePKCS12Export,
    TypeInfo(TCertificateRenew), _TCertificateRenew,
    TypeInfo(TCertificateRevocationList), _TCertificateRevocationList,
    TypeInfo(TCertificateRevocationListRevokedCertificate), _TCertificateRevocationListRevokedCertificate,
    TypeInfo(TCertificateSigningRequest), _TCertificateSigningRequest,
    TypeInfo(TCertificateSigningRequestSign), _TCertificateSigningRequestSign,
    TypeInfo(TCommandPrompt), _TCommandPrompt,
    TypeInfo(TConfigHistoryRevision), _TConfigHistoryRevision,
    TypeInfo(TConflictError), _TConflictError,
    TypeInfo(TCronJob), _TCronJob,
    TypeInfo(TDefaultGateway), _TDefaultGateway,
    TypeInfo(TEmailNotificationSettings), _TEmailNotificationSettings,
    TypeInfo(TFailedDependencyError), _TFailedDependencyError,
    TypeInfo(TFirewallAdvancedSettings), _TFirewallAdvancedSettings,
    TypeInfo(TFirewallAlias), _TFirewallAlias,
    TypeInfo(TFirewallApply), _TFirewallApply,
    TypeInfo(TFirewallLog), _TFirewallLog,
    TypeInfo(TFirewallRule), _TFirewallRule,
    TypeInfo(TFirewallSchedule), _TFirewallSchedule,
    TypeInfo(TFirewallScheduleTimeRange), _TFirewallScheduleTimeRange,
    TypeInfo(TFirewallState), _TFirewallState,
    TypeInfo(TFirewallStatesSize), _TFirewallStatesSize,
    TypeInfo(TInterfaceApply), _TInterfaceApply,
    TypeInfo(TInterfaceBridge), _TInterfaceBridge,
    TypeInfo(TInterfaceGRE), _TInterfaceGRE,
    TypeInfo(TInterfaceGroup), _TInterfaceGroup,
    TypeInfo(TInterfaceLAGG), _TInterfaceLAGG,
    TypeInfo(TInterfaceStats), _TInterfaceStats,
    TypeInfo(TInterfaceVLAN), _TInterfaceVLAN,
    TypeInfo(TLogSettings), _TLogSettings,
    TypeInfo(TMediaTypeError), _TMediaTypeError,
    TypeInfo(TMethodNotAllowedError), _TMethodNotAllowedError,
    TypeInfo(TNTPSettings), _TNTPSettings,
    TypeInfo(TNTPTimeServer), _TNTPTimeServer,
    TypeInfo(TNetworkInterface), _TNetworkInterface,
    TypeInfo(TNotAcceptableError), _TNotAcceptableError,
    TypeInfo(TNotFoundError), _TNotFoundError,
    TypeInfo(TOneToOneNATMapping), _TOneToOneNATMapping,
    TypeInfo(TOpenVPNClient), _TOpenVPNClient,
    TypeInfo(TOpenVPNClientSpecificOverride), _TOpenVPNClientSpecificOverride,
    TypeInfo(TOpenVPNClientStatus), _TOpenVPNClientStatus,
    TypeInfo(TOpenVPNServer), _TOpenVPNServer,
    TypeInfo(TOpenVPNServerConnectionStatus), _TOpenVPNServerConnectionStatus,
    TypeInfo(TOpenVPNServerRouteStatus), _TOpenVPNServerRouteStatus,
    TypeInfo(TOpenVPNServerStatus), _TOpenVPNServerStatus,
    TypeInfo(TOutboundNATMapping), _TOutboundNATMapping,
    TypeInfo(TOutboundNATMode), _TOutboundNATMode,
    TypeInfo(TPackage), _TPackage,
    TypeInfo(TPortForward), _TPortForward,
    TypeInfo(TRESTAPIAccessListEntry), _TRESTAPIAccessListEntry,
    TypeInfo(TRESTAPIJWT), _TRESTAPIJWT,
    TypeInfo(TRESTAPIKey), _TRESTAPIKey,
    TypeInfo(TRESTAPISettings), _TRESTAPISettings,
    TypeInfo(TRESTAPISettingsSync), _TRESTAPISettingsSync,
    TypeInfo(TRESTAPIVersion), _TRESTAPIVersion,
    TypeInfo(TRoutingApply), _TRoutingApply,
    TypeInfo(TRoutingGateway), _TRoutingGateway,
    TypeInfo(TRoutingGatewayGroup), _TRoutingGatewayGroup,
    TypeInfo(TRoutingGatewayGroupPriority), _TRoutingGatewayGroupPriority,
    TypeInfo(TRoutingGatewayStatus), _TRoutingGatewayStatus,
    TypeInfo(TSSH), _TSSH,
    TypeInfo(TServerError), _TServerError,
    TypeInfo(TService), _TService,
    TypeInfo(TServiceUnavailableError), _TServiceUnavailableError,
    TypeInfo(TServiceWatchdog), _TServiceWatchdog,
    TypeInfo(TStaticRoute), _TStaticRoute,
    TypeInfo(TSuccess), _TSuccess,
    TypeInfo(TSystemConsole), _TSystemConsole,
    TypeInfo(TSystemDNS), _TSystemDNS,
    TypeInfo(TSystemHalt), _TSystemHalt,
    TypeInfo(TSystemHostname), _TSystemHostname,
    TypeInfo(TSystemLog), _TSystemLog,
    TypeInfo(TSystemReboot), _TSystemReboot,
    TypeInfo(TSystemStatus), _TSystemStatus,
    TypeInfo(TSystemTunable), _TSystemTunable,
    TypeInfo(TSystemVersion), _TSystemVersion,
    TypeInfo(TTrafficShaper), _TTrafficShaper,
    TypeInfo(TTrafficShaperLimiter), _TTrafficShaperLimiter,
    TypeInfo(TTrafficShaperLimiterBandwidth), _TTrafficShaperLimiterBandwidth,
    TypeInfo(TTrafficShaperLimiterQueue), _TTrafficShaperLimiterQueue,
    TypeInfo(TTrafficShaperQueue), _TTrafficShaperQueue,
    TypeInfo(TUnprocessableContentError), _TUnprocessableContentError,
    TypeInfo(TUser), _TUser,
    TypeInfo(TUserGroup), _TUserGroup,
    TypeInfo(TValidationError), _TValidationError,
    TypeInfo(TVirtualIP), _TVirtualIP,
    TypeInfo(TVirtualIPApply), _TVirtualIPApply,
    TypeInfo(TWakeOnLANSend), _TWakeOnLANSend,
    TypeInfo(TWebGUISettings), _TWebGUISettings]);
end;

initialization
  RegisterRtti;

end.
