unit pfopenapi.dto;

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

  // The hash algorithm used for this API key. It is recommended to increase the
  // strength of the algorithm for keys assigned to privileged users.<br>
  TEnumPfopenapi1 = (
    epNone, epSha256, epSha384, epSha512);
  // Sets the type of alias this object will be. This directly impacts what values
  // can be
  // specified in the `address` field.<br>
  TEnumPfopenapi2 = (
    ep2None, ep2Host, ep2Network, ep2Port);
  // Enables or disables NAT reflection for traffic matching this mapping. Set to
  // `null` to use the system default.<br>
  TEnumPfopenapi3 = (
    ep3None, ep3Disable, ep3Enable);
  // The IP version this mapping applies to.<br>
  TEnumPfopenapi4 = (
    ep4None, ep4Inet, ep4Inet6);
  // The protocol this rule should match. Use `null` for any protocol.<br>
  TEnumPfopenapi5 = (
    ep5None, ep5Ah, ep5Esp, ep5Gre, ep5Icmp, ep5Igmp, ep5Ipv6, ep5Ospf, ep5Pim,
    ep5Tcp, ep5TcpUdp, ep5Udp);
  // The pool option used to load balance external IP mapping when `target` is set
  // to a subnet or alias of many addresses. Set to `null` to revert to the system
  // default.<br><br>This field is only available when the following conditions
  // are met:<br>- `nonat` must be equal to `false`<br>
  TEnumPfopenapi6 = (
    ep6None, ep6Bitmask, ep6Random, ep6RandomStickyAddress, ep6RoundRobin,
    ep6RoundRobinStickyAddress, ep6SourceHash);
  // The outbound NAT mode to assign this system. Set to `automatic` to have this
  // system automatically generate NAT rules this firewall, `hybrid` to automatically
  // generate NAT rules AND allow manual outbound NAT mappings to be assigned, `manual`
  // to prevent the system from automatically generating NAT rules and only allow
  // manual outbound NAT mappings, or `disabled` to disable outbound NAT on this
  // system entirely.<br>
  TEnumPfopenapi7 = (
    ep7None, ep7Advanced, ep7Automatic, ep7Disabled, ep7Hybrid);
  // The IP protocol this port forward rule should match.<br>
  TEnumPfopenapi8 = (
    ep8None, ep8Inet, ep8Inet46, ep8Inet6);
  // The NAT reflection mode to use for traffic matching this port forward rule.
  // Set to `null` to use the system default.<br>
  TEnumPfopenapi9 = (
    ep9None, ep9Disable, ep9Enable, ep9Purenat);
  // The action to take against traffic that matches this rule.<br>
  TEnumPfopenapi10 = (
    ep10None, ep10Block, ep10Pass, ep10Reject);
  // The IP/transport protocol this rule should match.<br>
  TEnumPfopenapi11 = (
    ep11None, ep11Ah, ep11Carp, ep11Esp, ep11Gre, ep11Icmp, ep11Igmp, ep11Ipv6,
    ep11Ospf, ep11Pfsync, ep11Pim, ep11Tcp, ep11TcpUdp, ep11Udp);
  TEnumPfopenapi12 = (
    ep12None, ep12Althost, ep12Any, ep12Dataconv, ep12Echorep, ep12Echoreq,
    ep12Inforep, ep12Inforeq, ep12Ipv6Here, ep12Ipv6Where, ep12Maskrep,
    ep12Maskreq, ep12Mobredir, ep12Mobregrep, ep12Mobregreq, ep12Paramprob,
    ep12Photuris, ep12Redir, ep12Routeradv, ep12Routersol, ep12Skip, ep12Squench,
    ep12Timerep, ep12Timereq, ep12Timex, ep12Trace, ep12Unreach);
  TEnumPfopenapi12Set = set of TEnumPfopenapi12;
  // The state mechanism to use for this firewall rule.<br>
  TEnumPfopenapi13 = (
    ep13None, ep13KeepState, ep13None2, ep13SloppyState, ep13SynproxyState);
  TEnumPfopenapi14 = (
    ep14None, ep14Ack, ep14Cwr, ep14Ece, ep14Fin, ep14Psh, ep14Rst, ep14Syn,
    ep14Urg);
  TEnumPfopenapi14Set = set of TEnumPfopenapi14;
  // The direction of traffic this firewall rule applies to. This field only applies
  // to floating firewall rules.<br><br>This field is only available when the following
  // conditions are met:<br>- `floating` must be equal to `true`<br>
  TEnumPfopenapi15 = (
    ep15None, ep15Any, ep15In, ep15Out);
  // The scheduler type to use for this traffic shaper. Changing this value will
  // automatically update any child queues assigned to this traffic shaper.<br>
  TEnumPfopenapi16 = (
    ep16None, ep16CBQ, ep16CODELQ, ep16FAIRQ, ep16HFSC, ep16PRIQ);
  // The scale type of the `bandwidth` field's value.<br>
  TEnumPfopenapi17 = (
    ep17None, ep171, ep17Gb, ep17Kb, ep17Mb, ep17B);
  // The scale factor of the `bw` fields value.<br>
  TEnumPfopenapi18 = (
    ep18None, ep18Kb, ep18Mb, ep18B);
  // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
  // delay, packet loss and queue size given above will be created for each source/destination
  // IP address encountered, respectively. This makes it possible to easily specify
  // bandwidth limits per host or subnet.<br>
  TEnumPfopenapi19 = (
    ep19None, ep19Dstaddress, ep19None2, ep19Srcaddress);
  // The Active Queue Management (AQM) algorithm to use for this limiter. AQM is
  // the intelligent drop of network packets inside the limiter, when it becomes
  // full or gets close to becoming full, with the goal of reducing network congestion.<br>
  TEnumPfopenapi20 = (
    ep20None, ep20Codel, ep20Droptail, ep20Gred, ep20Pie, ep20Red);
  // The scheduler to use for this limiter. The scheduler manages the sequence of
  // network packets in the limiter's queue.<br>
  TEnumPfopenapi21 = (
    ep21None, ep21Fifo, ep21FqCodel, ep21FqPie, ep21Prio, ep21Qfq, ep21Rr,
    ep21Wf2q);
  // The virtual IP mode to use for this virtual IP.<br>
  TEnumPfopenapi22 = (
    ep22None, ep22Carp, ep22Ipalias, ep22Other, ep22Proxyarp);
  // The virtual IP scope type. The `network` option is only applicable to the `proxyarp`
  // and `other` virtual IP modes.<br>
  TEnumPfopenapi23 = (
    ep23None, ep23Network, ep23Single);
  // The CARP mode to use for this virtual IP. Please note this field is exclusive
  // to pfSense Plus and has no effect on CE.<br><br>This field is only available
  // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
  TEnumPfopenapi24 = (
    ep24None, ep24Mcast, ep24Ucast);
  // The LAGG protocol to use.<br>
  TEnumPfopenapi25 = (
    ep25None, ep25Failover, ep25Lacp, ep25Loadbalance, ep25None4, ep25Roundrobin);
  // The LACP timeout mode to use.<br><br>This field is only available when the
  // following conditions are met:<br>- `proto` must be equal to `'lacp'`<br>
  TEnumPfopenapi26 = (
    ep26None, ep26Fast, ep26Slow);
  // The LAGG hash algorithm to use.<br><br>This field is only available when the
  // following conditions are met:<br>- `proto` must be one of [ lacp, loadbalance
  // ]<br>
  TEnumPfopenapi27 = (
    ep27None, ep27L2, ep27L2L3, ep27L2L3L4, ep27L2L4, ep27L3, ep27L3L4, ep27L4);
  // Selects the IPv4 address type to assign this interface.<br>
  TEnumPfopenapi28 = (
    ep28None, ep28Dhcp, ep28None2, ep28Static);
  // Selects the advanced DHCP timing preset.<br><br>This field is only available
  // when the following conditions are met:<br>- `typev4` must be equal to `'dhcp'`<br>-
  // `adv_dhcp_config_advanced` must be equal to `true`<br>
  TEnumPfopenapi29 = (
    ep29None, ep29SavedCfg);
  // Selects the IPv6 address type to assign this interface.<br>
  TEnumPfopenapi30 = (
    ep30None, ep306rd, ep306to4, ep30Dhcp6, ep30None4, ep30Slaac, ep30Staticv6,
    ep30Track6);
  // Controls the state killing behavior when this specific gateway goes down. Killing
  // states for specific down gateways only affects states created by policy routing
  // rules and reply-to. Has no effect if gateway monitoring or its action are disabled
  // or if the gateway is forced down. May not have any effect on dynamic gateways
  // during a link loss event.<br>
  TEnumPfopenapi31 = (
    ep31None, ep311, ep31Down, ep31None3);
  // The trigger that will cause a gateway to be excluded from the group.<br>
  TEnumPfopenapi32 = (
    ep32None, ep32Down, ep32Downlatency, ep32Downloss, ep32Downlosslatency);
  // The activation status of the ACME certificate.<br>
  TEnumPfopenapi33 = (
    ep33None, ep33Active, ep33Disabled);
  // The action method that should be used to run the command.<br>
  TEnumPfopenapi34 = (
    ep34None, ep34PhpCommand, ep34Servicerestart, ep34Shellcommand, ep34Xmlrpcservicerestart);
  // Algorithm used to generate the authentication Key for this zone<br><br>This
  // field is only available when the following conditions are met:<br>- `method`
  // must be equal to `'dns_nsupdate'`<br>
  TEnumPfopenapi35 = (
    ep35None, ep351, ep35157, ep35161, ep35162, ep35163, ep35164, ep35165);
  // Choose the NW API Endpoint<br><br>This field is only available when the following
  // conditions are met:<br>- `method` must be equal to `'dns_nw'`<br>
  TEnumPfopenapi36 = (
    ep36None, ep361, ep36HttpsCoreThermoIo, ep36HttpsMyFuturehostingCom, ep36HttpsPortalNexcessNet);
  // Choose the OVH API Endpoint / Region<br><br>This field is only available when
  // the following conditions are met:<br>- `method` must be equal to `'dns_ovh'`<br>
  TEnumPfopenapi37 = (
    ep37None, ep371, ep37KimsufiCa, ep37KimsufiEu, ep37OvhCa, ep37OvhEu, ep37RunaboveCa,
    ep37SoyoustartCa, ep37SoyoustartEu);
  // The length of the private key to use for the ACME certificate.<br>
  TEnumPfopenapi38 = (
    ep38None, ep382048, ep383072, ep384096, ep38Custom, ep38Ec256, ep38Ec384);
  // The IP version to use for the BIND service. Leave empty to use both IPv4 and
  // IPv6.<br>
  TEnumPfopenapi39 = (
    ep39None, ep391, ep394, ep396);
  // The minimum severity of events to log.<br>
  TEnumPfopenapi40 = (
    ep40None, ep40Critical, ep40Debug1, ep40Debug3, ep40Debug5, ep40Dynamic,
    ep40Error, ep40Info, ep40Notice, ep40Warning);
  TEnumPfopenapi41 = (
    ep41None, ep41Client, ep41Config, ep41Database, ep41Default, ep41Dispatch,
    ep41Dnssec, ep41General, ep41LameServers, ep41Network, ep41Notify,
    ep41Queries, ep41Resolver, ep41Security, ep41Unmatched, ep41Update,
    ep41XferIn, ep41XferOut);
  TEnumPfopenapi41Set = set of TEnumPfopenapi41;
  // Enable DNSSEC validation when BIND is acting as a recursive resolver.<br>
  TEnumPfopenapi42 = (
    ep42None, ep42Auto, ep42Off, ep42On);
  // The protocol to use for syncing.<br>
  TEnumPfopenapi43 = (
    ep43None, ep43Http, ep43Https);
  // The sync mode to use.<br>
  TEnumPfopenapi44 = (
    ep44None, ep44Auto, ep44Disabled, ep44Manual);
  // The type of this BIND zone.<br>
  TEnumPfopenapi45 = (
    ep45None, ep45Forward, ep45Master, ep45Redirect, ep45Slave);
  // The type of record.<br>
  TEnumPfopenapi46 = (
    ep46None, ep46A, ep46AAAA, ep46CNAME, ep46LOC, ep46MX, ep46NS, ep46PTR,
    ep46SPF, ep46SRV, ep46TXT);
  // Define how to handle unknown clients requesting DHCP leases. When set to `null`,
  // any DHCP client will get an IP address within this scope/range on this interface.
  // If set to `enabled`, any DHCP client with a MAC address listed in a static
  // mapping on any scope(s)/interface(s) will get an IP address. If set to `class`,
  // only MAC addresses listed in static mappings on this interface will get an
  // IP address within this scope/range.<br>
  TEnumPfopenapi47 = (
    ep47None, ep47Class, ep47Enabled);
  // The backend DHCP server service to use. ISC DHCP is deprecate and will be removed
  // in a future version of pfSense.<br>
  TEnumPfopenapi48 = (
    ep48None, ep48Isc, ep48Kea);
  // The type of value to configure for the option.<br>
  TEnumPfopenapi49 = (
    ep49None, ep49Boolean, ep49IpAddress, ep49SignedInteger16, ep49SignedInteger32,
    ep49SignedInteger8, ep49String, ep49Text, ep49UnsignedInteger16, ep49UnsignedInteger32,
    ep49UnsignedInteger8);
  // The action to take when an access list match is found.<br>
  TEnumPfopenapi50 = (
    ep50None, ep50Allow, ep50AllowSnoop, ep50Deny, ep50DenyNonlocal, ep50Refuse,
    ep50RefuseNonlocal);
  // The type of local zone used for the system domain.<br>
  TEnumPfopenapi51 = (
    ep51None, ep51Deny, ep51Inform, ep51InformDeny, ep51Nodefault, ep51Redirect,
    ep51Refuse, ep51Static, ep51Transparent, ep51Typetransparent);
  // The order in which the Python module is loaded.<br><br>This field is only available
  // when the following conditions are met:<br>- `python` must be equal to `true`<br>
  TEnumPfopenapi52 = (
    ep52None, ep52PostValidator, ep52PreValidator);
  // The expression to use to determine the match for this ACL.<br>
  TEnumPfopenapi53 = (
    ep53None, ep53Backendservercount, ep53Custom, ep53HostContains, ep53HostEndsWith,
    ep53HostMatches, ep53HostRegex, ep53HostStartsWith, ep53PathContains,
    ep53PathDir, ep53PathEndsWith, ep53PathMatches, ep53PathRegex, ep53PathStartsWith,
    ep53SourceIp, ep53SslCCaCommonname, ep53SslCVerify, ep53SslCVerifyCode,
    ep53SslSniContains, ep53SslSniEndsWith, ep53SslSniMatches, ep53SslSniRegex,
    ep53SslSniStartsWith, ep53TrafficIsHttp, ep53TrafficIsSsl, ep53UrlParameter);
  // The action to take when an ACL match is found.<br>
  TEnumPfopenapi54 = (
    ep54None, ep54Custom, ep54HttpAfterResponseAddHeader, ep54HttpAfterResponseDelHeader,
    ep54HttpAfterResponseReplaceHeader, ep54HttpAfterResponseReplaceValue,
    ep54HttpAfterResponseSetHeader, ep54HttpAfterResponseSetStatus, ep54HttpRequestAddHeader,
    ep54HttpRequestAllow, ep54HttpRequestAuth, ep54HttpRequestDelHeader,
    ep54HttpRequestDeny, ep54HttpRequestLua, ep54HttpRequestRedirect, ep54HttpRequestReplaceHeader,
    ep54HttpRequestReplacePath, ep54HttpRequestReplaceValue, ep54HttpRequestSetHeader,
    ep54HttpRequestSetMethod, ep54HttpRequestSetPath, ep54HttpRequestSetQuery,
    ep54HttpRequestSetUri, ep54HttpRequestTarpit, ep54HttpRequestUseService,
    ep54HttpResponseAddHeader, ep54HttpResponseAllow, ep54HttpResponseDelHeader,
    ep54HttpResponseDeny, ep54HttpResponseLua, ep54HttpResponseReplaceHeader,
    ep54HttpResponseReplaceValue, ep54HttpResponseSetHeader, ep54HttpResponseSetStatus,
    ep54TcpRequestConnectionAccept, ep54TcpRequestConnectionReject, ep54TcpRequestContentAccept,
    ep54TcpRequestContentLua, ep54TcpRequestContentReject, ep54TcpRequestContentUseService,
    ep54TcpResponseContentAccept, ep54TcpResponseContentClose, ep54TcpResponseContentLua,
    ep54TcpResponseContentReject, ep54UseServer);
  // The load balancing option to use for servers assigned to this backend.<br>
  TEnumPfopenapi55 = (
    ep55None, ep551, ep55Leastconn, ep55Roundrobin, ep55Source, ep55StaticRr,
    ep55Uri);
  // The health check method to use when checking the health of backend servers.<br>
  TEnumPfopenapi56 = (
    ep56None, ep56Basic, ep56ESMTP, ep56HTTP, ep56LDAP, ep56MySQL, ep56PostgreSQL,
    ep56Redis, ep56SMTP, ep56SSL, ep56None10);
  // The HTTP method to use for HTTP health checks.<br><br>This field is only available
  // when the following conditions are met:<br>- `check_type` must be equal to `'HTTP'`<br>
  TEnumPfopenapi57 = (
    ep57None, ep57DELETE, ep57GET, ep57HEAD, ep57OPTIONS, ep57POST, ep57PUT,
    ep57TRACE);
  // The mode HAProxy uses to insert/prefix/replace or examine cookie and set-cookie
  // headers.<br><br>This field is only available when the following conditions
  // are met:<br>- `persist_cookie_enabled` must be equal to `true`<br>
  TEnumPfopenapi58 = (
    ep58None, ep58InsertOnly, ep58InsertOnlySilent, ep58Passive, ep58PassiveSessionPrefix,
    ep58PassiveSilent, ep58Reset, ep58SessionPrefix, ep58Set, ep58SetSilent);
  // The sticky table mode to use for this backend. These options are used to make
  // sure subsequent requests from a single client go to the same backend.<br>
  TEnumPfopenapi59 = (
    ep59None, ep59None1, ep59StickCookieValue, ep59StickRdpCookie, ep59StickSourceipv4,
    ep59StickSourceipv6, ep59StickSslsessionid);
  // The maximum log level to send emails for. Leave empty to disable sending email
  // alerts. If left empty, the value set in the global settings will be used.<br>
  TEnumPfopenapi60 = (
    ep60None, ep601, ep60Alert, ep60Crit, ep60Debug, ep60Dontlog, ep60Emerg,
    ep60Err, ep60Info, ep60Notice, ep60Warning);
  // The eligibility status for this backend server.<br>
  TEnumPfopenapi61 = (
    ep61None, ep61Active, ep61Backup, ep61Disabled, ep61Inactive);
  // The type of file. Use `null` to assume an Errorfile.<br>
  TEnumPfopenapi62 = (
    ep62None, ep62Luascript, ep62Writetodisk);
  // The action to take when an ACL match is found.<br>
  TEnumPfopenapi63 = (
    ep63None, ep63Custom, ep63HttpAfterResponseAddHeader, ep63HttpAfterResponseDelHeader,
    ep63HttpAfterResponseReplaceHeader, ep63HttpAfterResponseReplaceValue,
    ep63HttpAfterResponseSetHeader, ep63HttpAfterResponseSetStatus, ep63HttpRequestAddHeader,
    ep63HttpRequestAllow, ep63HttpRequestAuth, ep63HttpRequestDelHeader,
    ep63HttpRequestDeny, ep63HttpRequestLua, ep63HttpRequestRedirect, ep63HttpRequestReplaceHeader,
    ep63HttpRequestReplacePath, ep63HttpRequestReplaceValue, ep63HttpRequestSetHeader,
    ep63HttpRequestSetMethod, ep63HttpRequestSetPath, ep63HttpRequestSetQuery,
    ep63HttpRequestSetUri, ep63HttpRequestTarpit, ep63HttpRequestUseService,
    ep63HttpResponseAddHeader, ep63HttpResponseAllow, ep63HttpResponseDelHeader,
    ep63HttpResponseDeny, ep63HttpResponseLua, ep63HttpResponseReplaceHeader,
    ep63HttpResponseReplaceValue, ep63HttpResponseSetHeader, ep63HttpResponseSetStatus,
    ep63TcpRequestConnectionAccept, ep63TcpRequestConnectionReject, ep63TcpRequestContentAccept,
    ep63TcpRequestContentLua, ep63TcpRequestContentReject, ep63TcpRequestContentUseService,
    ep63TcpResponseContentAccept, ep63TcpResponseContentClose, ep63TcpResponseContentLua,
    ep63TcpResponseContentReject, ep63UseBackend);
  // The external address to use.<br>
  TEnumPfopenapi64 = (
    ep64None, ep64AnyIpv4, ep64AnyIpv6, ep64Custom, ep64LocalhostIpv4, ep64LocalhostIpv6);
  // The processing type for this frontend.<br>
  TEnumPfopenapi65 = (
    ep65None, ep65Http, ep65Https, ep65Tcp);
  // The `httpclose` option this frontend will operate.<br>
  TEnumPfopenapi66 = (
    ep66None, ep66Forceclose, ep66HttpKeepAlive, ep66HttpServerClose, ep66HttpTunnel,
    ep66Httpclose);
  // The logging facility to log to.<br>
  TEnumPfopenapi67 = (
    ep67None, ep67Audit, ep67Auth, ep67Auth2, ep67Cron, ep67Cron2, ep67Daemon,
    ep67Ftp, ep67Kern, ep67Local0, ep67Local1, ep67Local2, ep67Local3,
    ep67Local4, ep67Local5, ep67Local6, ep67Local7, ep67Lpr, ep67Mail,
    ep67News, ep67Ntp, ep67Syslog, ep67User, ep67Uucp);
  // The log level to begin logging events. Only events of this level or higher
  // will be logged.<br>
  TEnumPfopenapi68 = (
    ep68None, ep68Alert, ep68Crit, ep68Debug, ep68Emerg, ep68Err, ep68Info,
    ep68Notice, ep68Warning);
  // The maximum log level to send emails for. Leave empty to disable sending email
  // alerts.<br>
  TEnumPfopenapi69 = (
    ep69None, ep691, ep69Alert, ep69Crit, ep69Debug, ep69Emerg, ep69Err, ep69Info,
    ep69Notice, ep69Warning);
  // The SSL/TLS compatibility mode which determines the cipher suites and TLS versions
  // supported.<br>
  TEnumPfopenapi70 = (
    ep70None, ep70Auto, ep70Intermediate, ep70Modern, ep70Old);
  // The minimum poll interval for NTP messages. Use empty string to assume system
  // default, and `omit` to not set this value.<br>
  TEnumPfopenapi71 = (
    ep71None, ep711, ep7110, ep7111, ep7112, ep7113, ep7114, ep7115, ep7116,
    ep7117, ep713, ep714, ep715, ep716, ep717, ep718, ep719, ep71Omit);
  // The IP protocol peers are forced to use for DNS resolution.<br>
  TEnumPfopenapi72 = (
    ep72None, ep72Auto, ep72Inet, ep72Inet6);
  // The digest algorithm for the server authentication key.<br>
  TEnumPfopenapi73 = (
    ep73None, ep73Md5, ep73Sha1, ep73Sha256);
  // The type of this timeserver. Use `server` is `timeserver` is a standalone NTP
  // server, use `pool` if `timeserver` represents an NTP pool, or `peer` if `timeserver`
  // is an NTP peer. Note: If the `timeserver` value ends with the `pool.ntp.org`
  // suffix, this field will be forced to use `pool`.<br>
  TEnumPfopenapi74 = (
    ep74None, ep74Peer, ep74Pool, ep74Server);
  // The SSH authentication mode to use. Use `enabled` to require public key authentication,
  // use both to require both a public key AND a password, or use `null` to allow
  // a password OR a public key.<br>
  TEnumPfopenapi75 = (
    ep75None, ep75Both, ep75Enabled);
  // The format of the log entries.<br>
  TEnumPfopenapi76 = (
    ep76None, ep76Rfc3164, ep76Rfc5424);
  // The type of compression to use for log files.<br>
  TEnumPfopenapi77 = (
    ep77None, ep77Bzip2, ep77Gzip, ep77None3, ep77Xz, ep77Zstd);
  // The IP protocol to use for remote logging.<br><br>This field is only available
  // when the following conditions are met:<br>- `enableremotelogging` must be equal
  // to `true`<br>
  TEnumPfopenapi78 = (
    ep78None, ep78Ipv4, ep78Ipv6);
  // The action to perform against this service.<br>
  TEnumPfopenapi79 = (
    ep79None, ep79Restart, ep79Start, ep79Stop);
  // The method used to generate this CRL.<br>
  TEnumPfopenapi80 = (
    ep80None, ep80Existing, ep80Internal);
  // The type of key pair to generate.<br>
  TEnumPfopenapi81 = (
    ep81None, ep81ECDSA, ep81RSA);
  // The certificate type. Use `server` when this certificate is to be used by one
  // or more services on this system. Use `user` when this certificate is intended
  // to be assigned to a user for authentication purposes.<br>
  TEnumPfopenapi82 = (
    ep82None, ep82Server, ep82User);
  // The level of encryption to use when exporting the PKCS#12 archive.<br>
  TEnumPfopenapi83 = (
    ep83None, ep83High, ep83Legacy, ep83Low);
  // Use local DNS server (DNS Resover or DNS Forwarder) as the primary DNS, or
  // use only remote DNS servers specified in `dnsserver`. Set to `null` to use
  // local DNS server as the primary and remote DNS servers as backup.<br>
  TEnumPfopenapi84 = (
    ep84None, ep84Local, ep84Remote);
  // The authentication mechanism to use for the SMTP connection.<br>
  TEnumPfopenapi85 = (
    ep85None, ep85LOGIN, ep85PLAIN);
  // The type of access this entry provides. "allow" entries permit access to the
  // REST API from the specified networks. "deny" entries block access to the REST
  // API from the specified networks.<br>
  TEnumPfopenapi86 = (
    ep86None, ep86Allow, ep86Deny);
  // Specifies how the API should represent interface names. Use `descr` to represent
  // interface objects by their description name, use `id` to represent interface
  // objects by their
  // internal pfSense ID (e.g. wan, lan, opt1), or use `if` to represent interface
  // objects by their
  // real interface name (e.g. em0, igb1, bxe3).<br>
  TEnumPfopenapi87 = (
    ep87None, ep87Descr, ep87Id, ep87If);
  // The type of this authentication server.<br>
  TEnumPfopenapi88 = (
    ep88None, ep88Ldap, ep88Radius);
  // The encryption mode to use when connecting to this authentication server. Use
  // `Standard TCP` for unencrypted LDAP connections, use `STARTTLS Encrypt` to
  // start an encrypted connection via STARTTLS if it's available, or `SSL/TLS Encrypted`
  // to only use LDAPS encrypted connections.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
  TEnumPfopenapi89 = (
    ep89None, ep89SSLTLSEncrypted, ep89STARTTLSEncrypt, ep89StandardTCP);
  // The LDAP search scope. Use `one` to limit the scope to a single level, or `subtree`
  // to allow the entire subtree to be searched.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
  TEnumPfopenapi90 = (
    ep90None, ep90One, ep90Subtree);
  // The RADIUS protocol to use when authenticating.<br><br>This field is only available
  // when the following conditions are met:<br>- `type` must be equal to `'radius'`<br>
  TEnumPfopenapi91 = (
    ep91None, ep91CHAPMD5, ep91MSCHAPv1, ep91MSCHAPv2, ep91PAP);
  // The name of the encryption algorithm to use for this P1 encryption item.<br>
  TEnumPfopenapi92 = (
    ep92None, ep92Aes, ep92Aes128gcm, ep92Aes192gcm, ep92Aes256gcm, ep92Chacha20poly1305);
  // The hash algorithm to use for this P1 encryption item.<br>
  TEnumPfopenapi93 = (
    ep93None, ep93Aesxcbc, ep93Sha1, ep93Sha256, ep93Sha384, ep93Sha512);
  // The IKE protocol version this phase 1 entry will use.<br>
  TEnumPfopenapi94 = (
    ep94None, ep94Auto, ep94Ikev1, ep94Ikev2);
  // The IKEv1 negotiation mode this phase 1 entry will use.<br><br>This field is
  // only available when the following conditions are met:<br>- `iketype` must be
  // one of [ ikev1, auto ]<br>
  TEnumPfopenapi95 = (
    ep95None, ep95Aggressive, ep95Main);
  // The IP version this phase 1 entry will use.<br>
  TEnumPfopenapi96 = (
    ep96None, ep96Both, ep96Inet, ep96Inet6);
  // The IPsec authentication method this tunnel will use.<br>
  TEnumPfopenapi97 = (
    ep97None, ep97Cert, ep97PreSharedKey);
  // The identifier type used by the local end of the tunnel.<br>
  TEnumPfopenapi98 = (
    ep98None, ep98Address, ep98Asn1dn, ep98Auto, ep98DynDns, ep98Fqdn, ep98KeyidTag,
    ep98Myaddress, ep98UserFqdn);
  // The identifier type used by the remote end of the tunnel.<br>
  TEnumPfopenapi99 = (
    ep99None, ep99Address, ep99Any, ep99Asn1dn, ep99Auto, ep99DynDns, ep99Fqdn,
    ep99KeyidTag, ep99Peeraddress, ep99UserFqdn);
  // The option used to force specific initiation/responder behavior for child SA
  // (P2) entries.<br>
  TEnumPfopenapi100 = (
    ep100None, ep1001, ep100None2, ep100Start, ep100Trap);
  // The option used to enable the use of NAT-T (i.e. the encapsulation of ESP in
  // UDP packets) if needed, which can help with clients that are behind restrictive
  // firewalls.<br>
  TEnumPfopenapi101 = (
    ep101None, ep101Force, ep101On);
  // The IPsec phase 2 mode this entry will use.<br>
  TEnumPfopenapi102 = (
    ep102None, ep102Transport, ep102Tunnel, ep102Tunnel6, ep102Vti);
  // the IPsec phase 2 proposal protocol for this entry. Encapsulating Security
  // Payload (`esp`) performs encryption and authentication, Authentication Header
  // (`ah`) is authentication only.<br>
  TEnumPfopenapi103 = (
    ep103None, ep103Ah, ep103Esp);
  TEnumPfopenapi104 = (
    ep104None, ep104Aesxcbc, ep104HmacSha1, ep104HmacSha256, ep104HmacSha384,
    ep104HmacSha512);
  TEnumPfopenapi104Set = set of TEnumPfopenapi104;
  // The OpenVPN client mode.<br>
  TEnumPfopenapi105 = (
    ep105None, ep105P2pTls);
  // The carrier mode for this OpenVPN client. `tun` mode carries IPv4 and IPv6
  // (layer 3) and is the most common and compatible mode across all platforms.
  // `tap` mode is capable of carrying 802.3 (layer 2).<br>
  TEnumPfopenapi106 = (
    ep106None, ep106Tap, ep106Tun);
  // The protocol used by this OpenVPN client.<br>
  TEnumPfopenapi107 = (
    ep107None, ep107TCP, ep107TCP4, ep107TCP6, ep107UDP, ep107UDP4, ep107UDP6);
  // The type of authentication used by the proxy server.<br>
  TEnumPfopenapi108 = (
    ep108None, ep108Basic, ep108None2, ep108Ntlm);
  // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
  // for the control channel, protecting the peers from unauthorized connections.
  // The `crypt` mode encrypts the control channel communication in addition to
  // providing authentication, providing more privacy and traffic control channel
  // obfuscation.<br><br>This field is only available when the following conditions
  // are met:<br>- `tls` must not be equal to `NULL`<br>
  TEnumPfopenapi109 = (
    ep109None, ep109Auth, ep109Crypt);
  // The TLS key direction. This must be set to complementary values on the client
  // and client. For example, if the client is set to 0, the client must be set
  // to 1. Both may be set to omit the direction, in which case the TLS Key will
  // be used bidirectionally.<br><br>This field is only available when the following
  // conditions are met:<br>- `tls` must not be equal to `NULL`<br>
  TEnumPfopenapi110 = (
    ep100None, ep1000, ep1001, ep1002, ep100Default);
  // The compression mode allowed by this OpenVPN client. Compression can potentially
  // increase throughput but may allow an attacker to extract secrets if they can
  // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
  TEnumPfopenapi111 = (
    ep100None, ep100Asym, ep100No, ep100Yes);
  // The method used to supply a virtual adapter IP address to clients when using
  // TUN mode on IPv4.<br><br>This field is only available when the following conditions
  // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
  TEnumPfopenapi112 = (
    ep100None, ep100Net30, ep100Subnet);
  // The method used to define ping configuration.<br>
  TEnumPfopenapi113 = (
    ep100None, ep100Keepalive, ep100Ping);
  // The action to take after a ping to the remote peer times-out.<br><br>This field
  // is only available when the following conditions are met:<br>- `ping_method`
  // must be equal to `'ping'`<br>
  TEnumPfopenapi114 = (
    ep100None, ep100PingExit, ep100PingRestart);
  // The number of times this client will attempt to send an exit notifications.<br>
  TEnumPfopenapi115 = (
    ep100None, ep1001, ep1002, ep1003, ep1004, ep1005, ep100None6);
  // The gateway type(s) that will be created when a virtual interface is assigned
  // to this OpenVPN server<br>
  TEnumPfopenapi116 = (
    ep100None, ep100Both, ep100V4only, ep100V6only);
  // The OpenVPN server mode.<br>
  TEnumPfopenapi117 = (
    ep100None, ep100P2pTls, ep100ServerTls, ep100ServerTlsUser, ep100ServerUser);
  // Configures which WireGuard tunnels are members of the WireGuard interface group.<br>
  TEnumPfopenapi118 = (
    ep100None, ep100All, ep100None2, ep100Unassigned);
  TEnumPfopenapi119 = (
    ep100None, ep100SORTASC, ep100SORTDESC);
  TEnumPfopenapi120 = (
    ep100None, ep100SORTFLAGCASE, ep100SORTLOCALESTRING, ep100SORTNATURAL,
    ep100SORTNUMERIC, ep100SORTREGULAR, ep100SORTSTRING);


{ ************ Data Transfert Objects }

  TAuthenticationError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PAuthenticationError = ^TAuthenticationError;

  TConflictError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PConflictError = ^TConflictError;

  TFailedDependencyError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PFailedDependencyError = ^TFailedDependencyError;

  TForbiddenError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PForbiddenError = ^TForbiddenError;

  TDtoPfopenapi2 = packed record
    // The error response ID.
    ResponseId: string;
  end;
  PDtoPfopenapi2 = ^TDtoPfopenapi2;

  TDtoPfopenapi3 = packed record
    // The error line.
    Line: integer;
    // The error column.
    Column: integer;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PDtoPfopenapi3 = ^TDtoPfopenapi3;
  TDtoPfopenapi3DynArray = array of TDtoPfopenapi3;

  TDtoPfopenapi1 = packed record
    // The error message.
    Message: string;
    // The error extensions.
    Extensions: TDtoPfopenapi2;
    // The error locations.
    Locations: TDtoPfopenapi3DynArray;
    // The error path.
    Path: TStringDynArray;
  end;
  PDtoPfopenapi1 = ^TDtoPfopenapi1;
  TDtoPfopenapi1DynArray = array of TDtoPfopenapi1;

  TGraphQLResponse = packed record
    // The GraphQL response data.
    Data: variant;
    // The GraphQL response errors.
    Errors: TDtoPfopenapi1DynArray;
  end;
  PGraphQLResponse = ^TGraphQLResponse;

  TMediaTypeError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PMediaTypeError = ^TMediaTypeError;

  TMethodNotAllowedError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PMethodNotAllowedError = ^TMethodNotAllowedError;

  TNotAcceptableError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PNotAcceptableError = ^TNotAcceptableError;

  TNotFoundError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PNotFoundError = ^TNotFoundError;

  TServerError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PServerError = ^TServerError;

  TServiceUnavailableError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PServiceUnavailableError = ^TServiceUnavailableError;

  TSuccess = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PSuccess = ^TSuccess;

  TUnprocessableContentError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PUnprocessableContentError = ^TUnprocessableContentError;

  TValidationError = packed record
    // The HTTP status code that corresponds with the API response.
    Code: integer;
    // The HTTP status message that corresponds with the HTTP status code.
    Status: string;
    // The unique response ID that corresponds with the result of the APIcall. In
    // most situations, this will contain an error code.
    ResponseId: string;
    // The descriptive message detailing the results of the API call.
    Message: string;
    // The data requested from the API. In the event that many objects havebeen requested,
    // this field will be an array of objects. Otherwise, it will only returnthe single
    // object requested.
    Data: variant;
    // An array of links to resources that are related to this API response.
    Links: variant;
  end;
  PValidationError = ^TValidationError;

  TRESTAPIJWT = packed record
    // The generated JWT that can be used for JWT authentication.<br>
    Token: string;
  end;
  PRESTAPIJWT = ^TRESTAPIJWT;

  TRESTAPIKey = packed record
    // Sets a description for this API key. This is used to identify the key's purpose
    // and cannot be changed once created.<br>
    Descr: string;
    // The username this API key is issued to.<br>
    Username: string;
    // The hash algorithm used for this API key. It is recommended to increase the
    // strength of the algorithm for keys assigned to privileged users.<br>
    HashAlgo: TEnumPfopenapi1;
    // The length of the API key (in bytes). Greater key lengths provide greater security,
    // but also increase the number of characters used in the key string.<br>
    LengthBytes: integer;
    // The hash of the generated API key<br>
    Hash: string;
    // The real API key. This value is not stored internally and cannot be recovered
    // if lost.<br>
    Key: string;
  end;
  PRESTAPIKey = ^TRESTAPIKey;

  TARPTable = packed record
    // The hostname associated with the ARP entry.<br>
    Hostname: string;
    // The IP address associated with the ARP entry.<br>
    IpAddress: string;
    // The MAC address associated with the ARP entry.<br>
    MacAddress: string;
    // The interface where the ARP entry was registered.<br>
    _Interface: string;
    // The type of connection this host utilizes.<br>
    _Type: string;
    // Indicates whether the ARP entry is permanent in the ARP table.<br>
    Permanent: boolean;
    // The full DNS name associated with this ARP entry.<br>
    Dnsresolve: string;
    // The expiration time for this ARP entry.<br>
    Expires: string;
  end;
  PARPTable = ^TARPTable;

  TCommandPrompt = packed record
    // The command to be executed.<br>
    Command: string;
    // The output of the executed command.<br>
    Output: string;
    // The result code of the executed command.<br>
    ResultCode: integer;
  end;
  PCommandPrompt = ^TCommandPrompt;

  TConfigHistoryRevision = packed record
    // The time the configuration change was made.<br>
    Time: integer;
    // The description of the configuration change.<br>
    Description: string;
    // The configuration version associated with this change.<br>
    Version: string;
    // The file size (in bytes) of the configuration file associated with this change.<br>
    Filesize: integer;
  end;
  PConfigHistoryRevision = ^TConfigHistoryRevision;

  TSystemHalt = packed record
    // Run through the call but don't actually initiate a shutdown.<br>
    DryRun: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PSystemHalt = ^TSystemHalt;

  TSystemReboot = packed record
    // Run through the call but don't actually initiate a reboot.<br>
    DryRun: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PSystemReboot = ^TSystemReboot;

  TFirewallAdvancedSettings = packed record
    // The interval (in seconds) at which to resolve hostnames in aliases.<br>
    Aliasesresolveinterval: integer;
    // Check the certificate of URLs used in aliases.<br>
    Checkaliasesurlcert: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PFirewallAdvancedSettings = ^TFirewallAdvancedSettings;

  TFirewallAlias = packed record
    // Sets the name for the alias. This name must be unique from all other aliases.<br>
    Name: string;
    // Sets the type of alias this object will be. This directly impacts what values
    // can be
    // specified in the `address` field.<br>
    _Type: TEnumPfopenapi2;
    // Sets a description to help specify the purpose or contents of the alias.<br>
    Descr: string;
    // Sets the host, network or port entries for the alias. When `type` is set to
    // `host`, each
    // entry must be a valid IP address or FQDN. When `type` is set to `network`,
    // each entry must be a valid
    // network CIDR or FQDN. When `type` is set to `port`, each entry must be a valid
    // port or port range. You
    // may also specify an existing alias's `name` as an entry to created nested aliases.<br>
    Address: TStringDynArray;
    // Sets descriptions for each alias `address`. Values must match the order of
    // the `address`
    // value it relates to. For example, the first value specified here is the description
    // for the first
    // value specified in the `address` field. This value cannot contain <br>
    Detail: TStringDynArray;
  end;
  PFirewallAlias = ^TFirewallAlias;

  TFirewallApply = packed record
    // Displays `true` when all firewall changes are applied and there are no pending
    // changes left.Displays `false` when there are pending firewall changes that
    // have not been applied.<br>
    Applied: boolean;
    // Displays the specific firewall subsystems that have pending changes.<br>
    PendingSubsystems: TStringDynArray;
  end;
  PFirewallApply = ^TFirewallApply;

  TOneToOneNATMapping = packed record
    // The interface this 1:1 NAT mapping applies to.<br>
    _Interface: string;
    // Disables this 1:1 NAT mapping.<br>
    Disabled: boolean;
    // Exclude traffic matching this mapping from a later, more general, mapping.<br>
    Nobinat: boolean;
    // Enables or disables NAT reflection for traffic matching this mapping. Set to
    // `null` to use the system default.<br>
    Natreflection: TEnumPfopenapi3;
    // The IP version this mapping applies to.<br>
    Ipprotocol: TEnumPfopenapi4;
    // The external IP address or interface for the 1:1 mapping. Valid value options
    // are: an IP address. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    _External: string;
    // The source IP address or subnet that traffic must match to apply this mapping.
    // Valid value options are: an existing interface, an IP address, a subnet CIDR,
    // `any`, `l2tp`, `pppoe`. The context of this address can be inverted by prefixing
    // the value with `!`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    Source: string;
    // The destination IP address or subnet that traffic must match to apply this
    // mapping. Valid value options are: an existing interface, an IP address, a subnet
    // CIDR, an existing alias, `any`, `l2tp`, `pppoe`. The context of this address
    // can be inverted by prefixing the value with `!`. For interface values, the
    // `:ip`  modifier can be appended to the value to use the interface's IP address
    // instead of its entire subnet.<br>
    Destination: string;
    // A description for this 1:1 NAT mapping<br>
    Descr: string;
  end;
  POneToOneNATMapping = ^TOneToOneNATMapping;

  TOutboundNATMapping = packed record
    // The interface on which traffic is matched as it exits the firewall. In most
    // cases this is a WAN-type or another externally-connected interface.<br>
    _Interface: string;
    // The protocol this rule should match. Use `null` for any protocol.<br>
    Protocol: TEnumPfopenapi5;
    // Disable this outbound NAT rule.<br>
    Disabled: boolean;
    // Do not NAT traffic matching this rule.<br>
    Nonat: boolean;
    // Do not sync this rule to HA peers.<br>
    Nosync: boolean;
    // The source network this rule should match. Valid value options are: an existing
    // interface, a subnet CIDR, an existing alias, `any`, `(self)`, `pppoe`. The
    // context of this address can be inverted by prefixing the value with `!`. For
    // interface values, the `:ip`  modifier can be appended to the value to use the
    // interface's IP address instead of its entire subnet.<br>
    Source: string;
    // The source port this rule should match. Valid options are: a TCP/UDP port number,
    // a TCP/UDP port range separated by `:`, an existing port type firewall alias<br>
    SourcePort: string;
    // The destination network this rule should match. Valid value options are: an
    // existing interface, a subnet CIDR, an existing alias, `any`, `pppoe`. The context
    // of this address can be inverted by prefixing the value with `!`. For interface
    // values, the `:ip`  modifier can be appended to the value to use the interface's
    // IP address instead of its entire subnet.<br>
    Destination: string;
    // The destination port this rule should match. Valid options are: a TCP/UDP port
    // number, a TCP/UDP port range separated by `:`, an existing port type firewall
    // alias<br>
    DestinationPort: string;
    // The target network traffic matching this rule should be translated to. Valid
    // value options are: an IP address, an existing alias. For interface values,
    // the `:ip`  modifier can be appended to the value to use the interface's IP
    // address instead of its entire subnet.<br><br>This field is only available when
    // the following conditions are met:<br>- `nonat` must be equal to `false`<br>
    Target: string;
    // The subnet bits for the assigned `target`. This field is only applicable if
    // `target` is set to an IP address. This has no affect for alias or interface
    // `targets`.<br><br>This field is only available when the following conditions
    // are met:<br>- `nonat` must be equal to `false`<br>
    TargetSubnet: integer;
    // The external source port or port range used for rewriting the original source
    // port on connections matching the rule. Valid options are: a TCP/UDP port number,
    // a TCP/UDP port range separated by `:`<br><br>This field is only available when
    // the following conditions are met:<br>- `static_nat_port` must be equal to `false`<br>-
    // `nonat` must be equal to `false`<br>
    NatPort: string;
    // Do not rewrite source port for traffic matching this rule.<br><br>This field
    // is only available when the following conditions are met:<br>- `nonat` must
    // be equal to `false`<br>
    StaticNatPort: boolean;
    // The pool option used to load balance external IP mapping when `target` is set
    // to a subnet or alias of many addresses. Set to `null` to revert to the system
    // default.<br><br>This field is only available when the following conditions
    // are met:<br>- `nonat` must be equal to `false`<br>
    Poolopts: TEnumPfopenapi6;
    // The key that is fed to the hashing algorithm in hex format. This must be a
    // 16 byte (32 character) hex string prefixed with `0x`. If a value is not provided,
    // one will automatically be generated<br><br>This field is only available when
    // the following conditions are met:<br>- `poolopts` must be equal to `'source-hash'`<br>-
    // `nonat` must be equal to `false`<br>
    SourceHashKey: string;
    // A description for the outbound NAT mapping.<br>
    Descr: string;
  end;
  POutboundNATMapping = ^TOutboundNATMapping;

  TOutboundNATMode = packed record
    // The outbound NAT mode to assign this system. Set to `automatic` to have this
    // system automatically generate NAT rules this firewall, `hybrid` to automatically
    // generate NAT rules AND allow manual outbound NAT mappings to be assigned, `manual`
    // to prevent the system from automatically generating NAT rules and only allow
    // manual outbound NAT mappings, or `disabled` to disable outbound NAT on this
    // system entirely.<br>
    Mode: TEnumPfopenapi7;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  POutboundNATMode = ^TOutboundNATMode;

  TPortForward = packed record
    // The interface this port forward rule applies to.<br>
    _Interface: string;
    // The IP protocol this port forward rule should match.<br>
    Ipprotocol: TEnumPfopenapi8;
    // The IP/transport protocol this port forward rule should match.<br>
    Protocol: TEnumPfopenapi5;
    // The source address this port forward rule applies to. Valid value options are:
    // an existing interface, an IP address, a subnet CIDR, an existing alias, `any`,
    // `(self)`, `l2tp`, `pppoe`. The context of this address can be inverted by prefixing
    // the value with `!`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br>
    Source: string;
    // The source port this port forward rule applies to. Set to `null` to allow any
    // source port. Valid options are: a TCP/UDP port number, a TCP/UDP port range
    // separated by `:`, an existing port type firewall alias<br><br>This field is
    // only available when the following conditions are met:<br>- `protocol` must
    // be one of [ tcp, udp, tcp/udp ]<br>
    SourcePort: string;
    // The destination address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Destination: string;
    // The destination port this port forward rule applies to. Set to `null` to allow
    // any destination port. Valid options are: a TCP/UDP port number, a TCP/UDP port
    // range separated by `:`, an existing port type firewall alias<br><br>This field
    // is only available when the following conditions are met:<br>- `protocol` must
    // be one of [ tcp, udp, tcp/udp ]<br>
    DestinationPort: string;
    // The IP address or alias of the internal host to forward matching traffic to.<br>
    Target: string;
    // The port on the internal host to forward matching traffic to. In most cases,
    // this must match the `destination_port` value. In the event that the `desintation_port`
    // is a range, this value should be the first value in that range. Valid options
    // are: a TCP/UDP port number, an existing port type firewall alias<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must be one of [ tcp, udp, tcp/udp ]<br>
    LocalPort: string;
    // Disables this port forward rule.<br>
    Disabled: boolean;
    // Disables redirection for traffic matching this rule.<br>
    Nordr: boolean;
    // Prevents this port forward rule from being synced to non-primary CARP members.<br>
    Nosync: boolean;
    // A description for this port forward rule.<br>
    Descr: string;
    // The NAT reflection mode to use for traffic matching this port forward rule.
    // Set to `null` to use the system default.<br>
    Natreflection: TEnumPfopenapi9;
    // The associated firewall rule mode. Use an empty string to require a separate
    // firewall rule to be created to pass traffic matching this port forward rule.
    // Use `new` to create a new associated firewall rule to pass traffic matching
    // this port forward rule. Use `pass` to automatically pass traffic matching this
    // port forward rule without the need for a firewall rule.   Otherwise, you can
    // specify the `associated_rule_id` of an existing firewall rule to associate
    // with this port forward rule.<br>
    AssociatedRuleId: string;
    // The unix timestamp of when this port forward rule was original created.<br>
    CreatedTime: integer;
    // The username and IP of the user who originally created this port forward rule.<br>
    CreatedBy: string;
    // The unix timestamp of when this port forward rule was original created.<br>
    UpdatedTime: integer;
    // The username and IP of the user who last updated this port forward rule.<br>
    UpdatedBy: string;
  end;
  PPortForward = ^TPortForward;

  TFirewallRule = packed record
    // The action to take against traffic that matches this rule.<br>
    _Type: TEnumPfopenapi10;
    // The interface where packets must originate to match this rule.<br>
    _Interface: TStringDynArray;
    // The IP version(s) this rule applies to.<br>
    Ipprotocol: TEnumPfopenapi8;
    // The IP/transport protocol this rule should match.<br>
    Protocol: TEnumPfopenapi11;
    // Th ICMP subtypes this rule applies to. This field is only applicable when `ipprotocol`
    // is `inet` and `protocol` is `icmp`.<br><br>This field is only available when
    // the following conditions are met:<br>- `protocol` must be equal to `'icmp'`<br>
    Icmptype: TEnumPfopenapi12Set;
    // The source address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Source: string;
    // The source port this rule applies to. Set to `null` to allow any source port.
    // Valid options are: a TCP/UDP port number, a TCP/UDP port range separated by
    // `:`, an existing port type firewall alias<br><br>This field is only available
    // when the following conditions are met:<br>- `protocol` must be one of [ tcp,
    // udp, tcp/udp ]<br>
    SourcePort: string;
    // The destination address this rule applies to. Valid value options are: an existing
    // interface, an IP address, a subnet CIDR, an existing alias, `any`, `(self)`,
    // `l2tp`, `pppoe`. The context of this address can be inverted by prefixing the
    // value with `!`. For interface values, the `:ip`  modifier can be appended to
    // the value to use the interface's IP address instead of its entire subnet.<br>
    Destination: string;
    // The destination port this rule applies to. Set to `null` to allow any destination
    // port. Valid options are: a TCP/UDP port number, a TCP/UDP port range separated
    // by `:`, an existing port type firewall alias<br><br>This field is only available
    // when the following conditions are met:<br>- `protocol` must be one of [ tcp,
    // udp, tcp/udp ]<br>
    DestinationPort: string;
    // A description detailing the purpose or justification of this firewall rule.<br>
    Descr: string;
    // Enable or disable this firewall rule.<br>
    Disabled: boolean;
    // Enable or disable logging of traffic that matches this rule.<br>
    Log: boolean;
    // A packet matching this rule can be marked and this mark used to match on other
    // NAT/filter rules. It is called <br>
    Tag: string;
    // The state mechanism to use for this firewall rule.<br>
    Statetype: TEnumPfopenapi13;
    // Allow any TCP flags.<br>
    TcpFlagsAny: boolean;
    // The TCP flags that can be set for this rule to match.<br><br>This field is
    // only available when the following conditions are met:<br>- `tcp_flags_any`
    // must be equal to `false`<br>
    TcpFlagsOutOf: TEnumPfopenapi14Set;
    // The TCP flags that must be set for this rule to match.<br><br>This field is
    // only available when the following conditions are met:<br>- `tcp_flags_any`
    // must be equal to `false`<br>
    TcpFlagsSet: TEnumPfopenapi14Set;
    // The gateway traffic matching this rule will be routed to. Set to `null` to
    // use default.<br>
    Gateway: string;
    // The name of an existing firewall schedule to assign to this firewall rule.<br>
    Sched: string;
    // The name of the traffic shaper limiter pipe or queue to use for incoming traffic.<br>
    Dnpipe: string;
    // The name of the traffic shaper limiter pipe or queue to use for outgoing traffic.<br>
    Pdnpipe: string;
    // The name of the traffic shaper queue to assume as the default queue for traffic
    // matching this rule.<br>
    Defaultqueue: string;
    // The name of the traffic shaper queue to assume as the ACK queue for ACK traffic
    // matching this rule.<br>
    Ackqueue: string;
    // Mark this rule as a floating firewall rule.<br>
    Floating: boolean;
    // Apply this action to traffic that matches this rule immediately. This field
    // only applies to floating firewall rules.<br><br>This field is only available
    // when the following conditions are met:<br>- `floating` must be equal to `true`<br>
    Quick: boolean;
    // The direction of traffic this firewall rule applies to. This field only applies
    // to floating firewall rules.<br><br>This field is only available when the following
    // conditions are met:<br>- `floating` must be equal to `true`<br>
    Direction: TEnumPfopenapi15;
    // The internal tracking ID for this firewall rule.<br>
    Tracker: integer;
    // The internal rule ID for the NAT rule associated with this rule.<br>
    AssociatedRuleId: string;
    // The unix timestamp of when this firewall rule was original created.<br>
    CreatedTime: integer;
    // The username and IP of the user who originally created this firewall rule.<br>
    CreatedBy: string;
    // The unix timestamp of when this firewall rule was original created.<br>
    UpdatedTime: integer;
    // The username and IP of the user who last updated this firewall rule.<br>
    UpdatedBy: string;
  end;
  PFirewallRule = ^TFirewallRule;

  TFirewallSchedule = packed record
    // A unique ID for this schedule used internally by the system.<br>
    Schedlabel: string;
    // The unique name to assign this schedule.<br>
    Name: string;
    // A description of this schedules purpose.<br>
    Descr: string;
    // Displays whether the schedule is currently active or not.<br>
    Active: boolean;
    // The date/times this firewall schedule will be active.<br>
    Timerange: variant;
  end;
  PFirewallSchedule = ^TFirewallSchedule;

  TFirewallScheduleTimeRange = packed record
    // The day of the week this schedule should be active for. Use `1` for every Monday,
    // `2` for every Tuesday, `3` for every Wednesday, `4` for every Thursday, `5`
    // for every Friday, `6` for every Saturday, or `7` for every Sunday. If this
    // field has a value specified, the `month` and `day` fields will be unavailable.<br>
    Position: TIntegerDynArray;
    // The month for each specified `day` value. Each value specified must correspond
    // with a `day` field value and must match the order exactly. For example, a `month`
    // value of `[3, 6]` and a `day` value of `[2, 17]` would evaluate to March 2nd
    // and June 17th respectively.<br><br>This field is only available when the following
    // conditions are met:<br>- `position` must be equal to `NULL`<br>
    Month: TIntegerDynArray;
    // The day for each specified `month` value. Each value specified must correspond
    // with a `month` field value and must match the order exactly. For example, a
    // `month` value of `[3, 6]` and a `day` value of `[2, 17]` would evaluate to
    // March 2nd and June 17th respectively.<br><br>This field is only available when
    // the following conditions are met:<br>- `position` must be equal to `NULL`<br>
    Day: TIntegerDynArray;
    // The start time and end time for this time range in 24-hour format (i.e. HH:MM-HH:MM).<br>
    Hour: string;
    // A description detailing this firewall schedule time range's purpose.<br>
    Rangedescr: string;
  end;
  PFirewallScheduleTimeRange = ^TFirewallScheduleTimeRange;

  TFirewallState = packed record
    // The interface that initially received the traffic which registered the state.<br>
    _Interface: string;
    // The protocol listed in the state.<br>
    Protocol: string;
    // The direction of traffic listed in the state.<br>
    Direction: string;
    // The source address listed in the state. Note: Depending on the `protocol`,
    // this value may contain the source port as well.<br>
    Source: string;
    // The destination address listed in the state. Note: Depending on the `protocol`,
    // this value may contain the destination port as well.<br>
    Destination: string;
    // The current status of the firewall state.<br>
    State: string;
    // The age of the firewall state in HH:MM:SS format.<br>
    Age: string;
    // The amount of time remaining until the state expires in HH:MM:SS format.<br>
    ExpiresIn: string;
    // The total number of packets observed by the state.<br>
    PacketsTotal: integer;
    // The total number of inbound packets observed by the state.<br>
    PacketsIn: integer;
    // The total number of outbound packets observed by the state.<br>
    PacketsOut: integer;
    // The total number of traffic (in bytes) observed by the state.<br>
    BytesTotal: integer;
    // The total number of inbound traffic (in bytes) observed by the state.<br>
    BytesIn: integer;
    // The total number of outbound traffic (in bytes) observed by the state.<br>
    BytesOut: integer;
  end;
  PFirewallState = ^TFirewallState;

  TFirewallStatesSize = packed record
    // The maximum number of firewall state entries allowed by this firewall.<br>
    Maximumstates: integer;
    // The default number of firewall state entries allowed by this firewall.<br>
    Defaultmaximumstates: integer;
    // The number of firewall state entries currently registered in the states table.<br>
    Currentstates: integer;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PFirewallStatesSize = ^TFirewallStatesSize;

  TTrafficShaper = packed record
    // Enables or disables this traffic shaper.<br>
    Enabled: boolean;
    // The interface this traffic shaper will be applied to.<br>
    _Interface: string;
    // The name of this traffic shaper. This value is automatically set by the system
    // and cannot be changed.<br>
    Name: string;
    // The scheduler type to use for this traffic shaper. Changing this value will
    // automatically update any child queues assigned to this traffic shaper.<br>
    Scheduler: TEnumPfopenapi16;
    // The scale type of the `bandwidth` field's value.<br>
    Bandwidthtype: TEnumPfopenapi17;
    // The total bandwidth amount allowed by this traffic shaper.<br>
    Bandwidth: integer;
    // The number of packets that can be held in a queue waiting to be transmitted
    // by the shaper.<br><br>This field is only available when the following conditions
    // are met:<br>- `scheduler` must not be one of [ CODELQ ]<br>
    Qlimit: integer;
    // The size, in bytes, of the token bucket regulator. If `null`, heuristics based
    // on the interface bandwidth are used to determine the size.<br>
    Tbrconfig: integer;
    // The child queues assigned to this traffic shaper.<br>
    Queue: variant;
  end;
  PTrafficShaper = ^TTrafficShaper;

  TTrafficShaperLimiterBandwidth = packed record
    // The amount of bandwidth this profile allows.<br>
    Bw: integer;
    // The scale factor of the `bw` fields value.<br>
    Bwscale: TEnumPfopenapi18;
    // The schedule to assign this bandwidth profile. When this firewall schedule
    // is active, this bandwidth profile will be used.<br>
    Bwsched: string;
  end;
  PTrafficShaperLimiterBandwidth = ^TTrafficShaperLimiterBandwidth;

  TTrafficShaperLimiter = packed record
    // The unique name for this limiter.<br>
    Name: string;
    // A unique number auto-assigned to this limiter. This is only used internally
    // by the system and cannot be manually set or changed.<br>
    Number: integer;
    // Enables or disables this limiter and its child queues.<br>
    Enabled: boolean;
    // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
    // delay, packet loss and queue size given above will be created for each source/destination
    // IP address encountered, respectively. This makes it possible to easily specify
    // bandwidth limits per host or subnet.<br>
    Mask: TEnumPfopenapi19;
    // The IPv4 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbits: integer;
    // The IPv6 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbitsv6: integer;
    // The length of the limiter's queue which the scheduler and AQM are responsible
    // for. Set to `null` to assume default.<br>
    Qlimit: integer;
    // Enable or disable ECN. ECN sets a reserved TCP flag when the queue is nearing
    // or exceeding capacity. Not all AQMs or schedulers support this.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be one of [ codel, pie, red, gred ]<br>- `sched` must be one of [ fq_codel,
    // fq_pie ]<br>
    Ecn: boolean;
    // The verbose description for this limiter.<br>
    Description: string;
    // The Active Queue Management (AQM) algorithm to use for this limiter. AQM is
    // the intelligent drop of network packets inside the limiter, when it becomes
    // full or gets close to becoming full, with the goal of reducing network congestion.<br>
    Aqm: TEnumPfopenapi20;
    // The scheduler to use for this limiter. The scheduler manages the sequence of
    // network packets in the limiter's queue.<br>
    Sched: TEnumPfopenapi21;
    // The value for the CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelTarget: integer;
    // The value for the CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelInterval: integer;
    // The value for the PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTarget: integer;
    // The value for the PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTupdate: integer;
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
    // Enable or disable turning PIE on and off depending on queue load.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieOnoff: boolean;
    // Enable or disable cap drop adjustment.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    PieCapdrop: boolean;
    // Set queue delay type to timestamps (true) or departure rate estimation (false).<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieQdelay: boolean;
    // Enable or disable drop probability de-randomisation.<br><br>This field is only
    // available when the following conditions are met:<br>- `aqm` must be equal to
    // `'pie'`<br>
    PiePderand: boolean;
    // The value for the RED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedWQ: integer;
    // The value for the RED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMinTh: integer;
    // The value for the RED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxTh: integer;
    // The value for the RED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxP: integer;
    // The value for the GRED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredWQ: integer;
    // The value for the GRED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMinTh: integer;
    // The value for the GRED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxTh: integer;
    // The value for the GRED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxP: integer;
    // The value for the FQ CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelTarget: integer;
    // The value for the FQ CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelInterval: integer;
    // The value for the FQ CoDel quantum parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelQuantum: integer;
    // The value for the FQ CoDel limit parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelLimit: integer;
    // The value for the FQ CoDel flows parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_codel'`<br>
    ParamFqCodelFlows: integer;
    // The value for the FQ PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieTarget: integer;
    // The value for the FQ PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieTupdate: integer;
    // The value for the FQ PIE alpha parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieAlpha: integer;
    // The value for the FQ PIE beta parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieBeta: integer;
    // The value for the FQ PIE max_burst parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieMaxBurst: integer;
    // The value for the FQ PIE ecnth parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieMaxEcnth: integer;
    // The value for the FQ PIE quantum parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieQuantum: integer;
    // The value for the FQ PIE limit parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieLimit: integer;
    // The value for the FQ PIE flows parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `sched` must be equal to `'fq_pie'`<br>
    ParamFqPieFlows: integer;
    // The amount of delay (in milliseconds) added to traffic passing through this
    // limiter.<br>
    Delay: integer;
    // The amount of packet loss (in percentage) added to traffic passing through
    // the limiter.<br>
    Plr: single;
    // The limiter's bucket size (slots).<br>
    Buckets: integer;
    // The bandwidth profiles for this limiter.<br>
    Bandwidth: variant;
    // The child queues for this limiter.<br>
    Queue: variant;
  end;
  PTrafficShaperLimiter = ^TTrafficShaperLimiter;

  TTrafficShaperLimiterQueue = packed record
    // The unique name for this limiter queue.<br>
    Name: string;
    // A unique number auto-assigned to this limiter. This is only used internally
    // by the system and cannot be manually set or changed.<br>
    Number: integer;
    // Enables or disables this limiter queue.<br>
    Enabled: boolean;
    // If `source` or `destination` slots is chosen a dynamic pipe with the bandwidth,
    // delay, packet loss and queue size given above will be created for each source/destination
    // IP address encountered, respectively. This makes it possible to easily specify
    // bandwidth limits per host or subnet.<br>
    Mask: TEnumPfopenapi19;
    // The IPv4 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbits: integer;
    // The IPv6 mask bits to use when determine the scope of the dynamic pipe for
    // IPv4 traffic.<br><br>This field is only available when the following conditions
    // are met:<br>- `mask` must be one of [ srcaddress, dstaddress ]<br>
    Maskbitsv6: integer;
    // The length of the limiter's queue which the scheduler and AQM are responsible
    // for. Set to `null` to assume default.<br>
    Qlimit: integer;
    // Enable or disable ECN. ECN sets a reserved TCP flag when the queue is nearing
    // or exceeding capacity. Not all AQMs or schedulers support this.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be one of [ codel, pie, red, gred ]<br>- `sched` must be one of [ fq_codel,
    // fq_pie ]<br>
    Ecn: boolean;
    // The verbose description for this limiter queue.<br>
    Description: string;
    // The Active Queue Management (AQM) algorithm to use for this queue. AQM is the
    // intelligent drop of network packets inside the queue, when it becomes full
    // or gets close to becoming full, with the goal of reducing network congestion.<br>
    Aqm: TEnumPfopenapi20;
    // The value for the CoDel target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelTarget: integer;
    // The value for the CoDel interval parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'codel'`<br>
    ParamCodelInterval: integer;
    // The value for the PIE target parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTarget: integer;
    // The value for the PIE tupdate parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    ParamPieTupdate: integer;
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
    // Enable or disable turning PIE on and off depending on queue load.<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieOnoff: boolean;
    // Enable or disable cap drop adjustment.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'pie'`<br>
    PieCapdrop: boolean;
    // Set queue delay type to timestamps (true) or departure rate estimation (false).<br><br>This
    // field is only available when the following conditions are met:<br>- `aqm` must
    // be equal to `'pie'`<br>
    PieQdelay: boolean;
    // Enable or disable drop probability de-randomisation.<br><br>This field is only
    // available when the following conditions are met:<br>- `aqm` must be equal to
    // `'pie'`<br>
    PiePderand: boolean;
    // The value for the RED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedWQ: integer;
    // The value for the RED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMinTh: integer;
    // The value for the RED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxTh: integer;
    // The value for the RED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'red'`<br>
    ParamRedMaxP: integer;
    // The value for the GRED w_q parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredWQ: integer;
    // The value for the GRED min_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMinTh: integer;
    // The value for the GRED max_th parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxTh: integer;
    // The value for the GRED max_p parameter.<br><br>This field is only available
    // when the following conditions are met:<br>- `aqm` must be equal to `'gred'`<br>
    ParamGredMaxP: integer;
    // The share of the parent limiter this queue gets.<br>
    Weight: integer;
    // The amount of packet loss (in percentage) added to traffic passing through
    // this limiter queue.<br>
    Plr: single;
    // The limiter queue's bucket size (slots).<br>
    Buckets: integer;
  end;
  PTrafficShaperLimiterQueue = ^TTrafficShaperLimiterQueue;

  TTrafficShaperQueue = packed record
    // The parent interface this traffic shaper queue a child of. This value is automatically
    // determined by the queue's parent and cannot be manually set or changed.<br>
    _Interface: string;
    // Enables or disables the traffic shaper queue.<br>
    Enabled: boolean;
    // The name to assign this traffic shaper queue.<br>
    Name: string;
    // The priority level for this traffic shaper queue.<br><br>This field is only
    // available when the following conditions are met:<br>- Parent field `scheduler`
    // must be one of [ FAIRQ, CBQ, PRIQ ]<br>
    Priority: integer;
    // The number of packets that can be held in a queue waiting to be transmitted
    // by the shaper.<br>
    Qlimit: integer;
    // A description for this traffic shaper queue.<br>
    Description: string;
    // Mark this traffic shaper queue as the default queue.<br>
    Default: boolean;
    // Use the 'Random Early Detection' scheduler option for this traffic shaper queue.<br>
    Red: boolean;
    // Use the 'Random Early Detection In and Out' scheduler option for this traffic
    // shaper queue.<br>
    Rio: boolean;
    // Use the 'Explicit Congestion Notification' scheduler option for this traffic
    // shaper queue.<br>
    Ecn: boolean;
    // Use the 'Codel Active Queue' scheduler option for this traffic shaper queue.<br>
    Codel: boolean;
    // The scale type of the `bandwidth` field's value.<br><br>This field is only
    // available when the following conditions are met:<br>- Parent field `scheduler`
    // must be one of [ FAIRQ, CBQ, HFSC ]<br>
    Bandwidthtype: TEnumPfopenapi17;
    // The total bandwidth amount allowed by this traffic shaper.<br><br>This field
    // is only available when the following conditions are met:<br>- Parent field
    // `scheduler` must be one of [ FAIRQ, CBQ, HFSC ]<br>
    Bandwidth: integer;
    // <br><br>This field is only available when the following conditions are met:<br>-
    // Parent field `scheduler` must be equal to `'FAIRQ'`<br>
    Buckets: integer;
    // The bandwidth limit per host.<br><br>This field is only available when the
    // following conditions are met:<br>- Parent field `scheduler` must be equal to
    // `'FAIRQ'`<br>
    Hogs: integer;
    // Allow this queue to borrow from other queues when available.<br><br>This field
    // is only available when the following conditions are met:<br>- Parent field
    // `scheduler` must be equal to `'CBQ'`<br>
    Borrow: boolean;
    // Allow setting the maximum bandwidth allowed for the queue. Will force hard
    // bandwidth limiting.<br><br>This field is only available when the following
    // conditions are met:<br>- Parent field `scheduler` must be equal to `'HFSC'`<br>
    Upperlimit: boolean;
    // The burst-able bandwidth limit for this traffic shaper queue.<br><br>This field
    // is only available when the following conditions are met:<br>- `upperlimit`
    // must be equal to `true`<br>
    UpperlimitM1: string;
    // The duration (in milliseconds) that the burst-able bandwidth limit (`upperlimit_m1`
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `upperlimit` must be equal to `true`<br>
    UpperlimitD: integer;
    // The normal bandwidth limit for this traffic shaper queue. If `upperlimit_m1`
    // is not defined, this limit will always be in effect. If `upperlimit_m1` is
    // defined, this limit will take effect after the `upperlimit_d` duration has
    // expired.<br><br>This field is only available when the following conditions
    // are met:<br>- `upperlimit` must be equal to `true`<br>
    UpperlimitM2: string;
    // Allow setting the guaranteed bandwidth minimum allotted to the queue.<br><br>This
    // field is only available when the following conditions are met:<br>- Parent
    // field `scheduler` must be equal to `'HFSC'`<br>
    Realtime: boolean;
    // The guaranteed minimum bandwidth limit for this traffic shaper queue during
    // real time.<br><br>This field is only available when the following conditions
    // are met:<br>- `realtime` must be equal to `true`<br>
    RealtimeM1: string;
    // The duration (in milliseconds) that the guaranteed bandwidth limit (`realtime_m1`)
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `realtime` must be equal to `true`<br>
    RealtimeD: integer;
    // The maximum bandwidth this traffic shaper queue is allowed to use. Note: This
    // value should not exceed 30% of parent queue's maximum bandwidth.<br><br>This
    // field is only available when the following conditions are met:<br>- `realtime`
    // must be equal to `true`<br>
    RealtimeM2: string;
    // Allow sharing bandwidth from this queue for other queues as long as the real
    // time values have been satisfied.<br><br>This field is only available when the
    // following conditions are met:<br>- Parent field `scheduler` must be equal to
    // `'HFSC'`<br>
    Linkshare: boolean;
    // The initial bandwidth limit for this traffic shaper queue when link sharing.<br><br>This
    // field is only available when the following conditions are met:<br>- `linkshare`
    // must be equal to `true`<br>
    LinkshareM1: string;
    // The duration (in milliseconds) that the initial bandwidth limit (`linkshare_m1`)
    // is in effect.<br><br>This field is only available when the following conditions
    // are met:<br>- `linkshare` must be equal to `true`<br>
    LinkshareD: integer;
    // The maximum bandwidth this traffic shaper queue is allowed to use. Note: This
    // behaves exactly the same as the `bandwidth` field. If this field is set, it
    // will override whatever value is current assigned to the `bandwidth` field.<br><br>This
    // field is only available when the following conditions are met:<br>- `linkshare`
    // must be equal to `true`<br>
    LinkshareM2: string;
  end;
  PTrafficShaperQueue = ^TTrafficShaperQueue;

  TVirtualIPApply = packed record
    // Displays `true` when all virtual IP changes are applied and there are no pending
    // changes left.Displays `false` when there are pending virtual IP changes that
    // have not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PVirtualIPApply = ^TVirtualIPApply;

  TVirtualIP = packed record
    // The unique ID for this virtual IP.<br>
    Uniqid: string;
    // The virtual IP mode to use for this virtual IP.<br>
    Mode: TEnumPfopenapi22;
    // The interface this virtual IP will apply to.<br>
    _Interface: string;
    // The virtual IP scope type. The `network` option is only applicable to the `proxyarp`
    // and `other` virtual IP modes.<br>
    _Type: TEnumPfopenapi23;
    // The address for this virtual IP.<br>
    Subnet: string;
    // The subnet bits for this virtual IP. For `proxyarp` and `other` virtual IPs,
    // this value specifies a block of many IP address. For all other virtual IP modes,
    // this specifies the subnet mask<br>
    SubnetBits: integer;
    // A description for administrative reference<br>
    Descr: string;
    // Disable expansion of this entry into IPs on NAT lists (e.g. 192.168.1.0/24
    // expands to 256 entries.)<br><br>This field is only available when the following
    // conditions are met:<br>- `mode` must be one of [ proxyarp, other ]<br>
    Noexpand: boolean;
    // The VHID group that the machines will share.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    Vhid: integer;
    // The base frequency that this machine will advertise.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Advbase: integer;
    // The frequency skew that this machine will advertise.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Advskew: integer;
    // The VHID group password shared by all CARP members.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be equal
    // to `'carp'`<br>
    Password: string;
    // The current CARP status of this virtual IP. This will display show whether
    // this CARP node is the primary or backup peer.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    CarpStatus: string;
    // The CARP mode to use for this virtual IP. Please note this field is exclusive
    // to pfSense Plus and has no effect on CE.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be equal to `'carp'`<br>
    CarpMode: TEnumPfopenapi24;
    // The IP address of the CARP peer. Please note this field is exclusive to pfSense
    // Plus and has no effect on CE.<br><br>This field is only available when the
    // following conditions are met:<br>- `carp_mode` must be equal to `'ucast'`<br>
    CarpPeer: string;
  end;
  PVirtualIP = ^TVirtualIP;

  TGraphQL = packed record
    // The GraphQL query/mutation to execute.<br>
    Query: string;
    // The variables to pass to the GraphQL query or mutation. In general, this will
    // be an object containing the variables to pass to the query or mutation.<br>
    Variables: variant;
  end;
  PGraphQL = ^TGraphQL;

  TInterfaceApply = packed record
    // Displays `true` when all interfaces are applied and there are no pending changes
    // left.Displays `false` when there are pending interface changes that have not
    // been applied.<br>
    Applied: boolean;
    // Displays a list of interfaces that have pending changes waiting to be applied.<br>
    PendingInterfaces: TStringDynArray;
  end;
  PInterfaceApply = ^TInterfaceApply;

  TAvailableInterface = packed record
    // The name of the interface.<br>
    _If: string;
    // The MAC address of the interface.<br>
    Mac: string;
    // The description of the interface.<br>
    Dmesg: string;
    // The pfSense interface ID that is using this interface.<br>
    InUseBy: string;
  end;
  PAvailableInterface = ^TAvailableInterface;

  TInterfaceBridge = packed record
    // The member interfaces to include in this bridge.<br>
    Members: TStringDynArray;
    // A description for this interface bridge.<br>
    Descr: string;
    // The real interface name for this bridge interface.<br>
    Bridgeif: string;
  end;
  PInterfaceBridge = ^TInterfaceBridge;

  TInterfaceGRE = packed record
    // The pfSense interface interface serving as the local address to be used for
    // the GRE tunnel.<br>
    _If: string;
    // The real interface name for this GRE interface.<br>
    Greif: string;
    // A description for this GRE interface.<br>
    Descr: string;
    // Whether to add an explicit static route for the remote inner tunnel address/subnet
    // via the local tunnel address.<br>
    AddStaticRoute: boolean;
    // The remote address to use for the GRE tunnel.<br>
    RemoteAddr: string;
    // The local IPv4 address to use for the GRE tunnel.<br>
    TunnelLocalAddr: string;
    // The remote IPv4 address to use for the GRE tunnel.<br><br>This field is only
    // available when the following conditions are met:<br>- `tunnel_local_addr` must
    // not be equal to `NULL`<br>
    TunnelRemoteAddr: string;
    // The remote IPv4 subnet bitmask to use for the GRE tunnel.<br><br>This field
    // is only available when the following conditions are met:<br>- `tunnel_local_addr`
    // must not be equal to `NULL`<br>
    TunnelRemoteNet: integer;
    // The local IPv6 address to use for the GRE tunnel.<br>
    TunnelLocalAddr6: string;
    // The remote IPv6 address to use for the GRE tunnel.<br><br>This field is only
    // available when the following conditions are met:<br>- `tunnel_local_addr6`
    // must not be equal to `NULL`<br>
    TunnelRemoteAddr6: string;
    // The remote IPv6 subnet bitmask to use for the GRE tunnel.<br><br>This field
    // is only available when the following conditions are met:<br>- `tunnel_local_addr6`
    // must not be equal to `NULL`<br>
    TunnelRemoteNet6: integer;
  end;
  PInterfaceGRE = ^TInterfaceGRE;

  TInterfaceGroup = packed record
    // The name of this interface group.<br>
    Ifname: string;
    // The member interfaces to assign to this interface group.<br>
    Members: TStringDynArray;
    // The description for this interface group.<br>
    Descr: string;
  end;
  PInterfaceGroup = ^TInterfaceGroup;

  TInterfaceLAGG = packed record
    // The real name of the LAGG interface.<br>
    Laggif: string;
    // A description to help document the purpose of this LAGG interface.<br>
    Descr: string;
    // A list of member interfaces to include in the LAGG.<br>
    Members: TStringDynArray;
    // The LAGG protocol to use.<br>
    Proto: TEnumPfopenapi25;
    // The LACP timeout mode to use.<br><br>This field is only available when the
    // following conditions are met:<br>- `proto` must be equal to `'lacp'`<br>
    Lacptimeout: TEnumPfopenapi26;
    // The LAGG hash algorithm to use.<br><br>This field is only available when the
    // following conditions are met:<br>- `proto` must be one of [ lacp, loadbalance
    // ]<br>
    Lagghash: TEnumPfopenapi27;
    // The failover master interface to use.<br><br>This field is only available when
    // the following conditions are met:<br>- `proto` must be equal to `'failover'`<br>
    Failovermaster: string;
  end;
  PInterfaceLAGG = ^TInterfaceLAGG;

  TInterfaceVLAN = packed record
    // The real parent interface this VLAN will be applied to.<br>
    _If: string;
    // The VLAN ID tag to use. This must be unique from all other VLANs on the parent
    // interface.<br>
    Tag: integer;
    // Displays the full interface VLAN. This value is automatically populated and
    // cannot be set.<br>
    Vlanif: string;
    // The 802.1p VLAN priority code point (PCP) to assign to this VLAN.<br>
    Pcp: integer;
    // A description to help document the purpose of this VLAN.<br>
    Descr: string;
  end;
  PInterfaceVLAN = ^TInterfaceVLAN;

  TNetworkInterface = packed record
    // The real interface this configuration will be applied to.<br>
    _If: string;
    // Enable or disable this interface.<br>
    Enable: boolean;
    // The descriptive name for this interface.<br>
    Descr: string;
    // Assigns (spoofs) the MAC address for this interface instead of using the interface's
    // real MAC.<br>
    Spoofmac: string;
    // Sets the MTU for this interface. Assumes default MTU if value is `null`.<br>
    Mtu: integer;
    // Sets the MSS for this interface. Assumes default MSS if value is `null`.<br>
    Mss: integer;
    // Sets the link speed for this interface. In most situations this can be left
    // as the default.<br>
    Media: string;
    // Sets the link duplex for this interface. In most situations this can be left
    // as the default.<br>
    Mediaopt: string;
    // Enable or disable automatically blocking RFC 1918 private networks on this
    // interface.<br>
    Blockpriv: boolean;
    // Enable or disable automatically blocking bogon networks on this interface.<br>
    Blockbogons: boolean;
    // Selects the IPv4 address type to assign this interface.<br>
    Typev4: TEnumPfopenapi28;
    // Sets the IPv4 address to assign to this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev4` must be one
    // of [ static, dhcp ]<br>
    Ipaddr: string;
    // Sets the subnet bit count to assign this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev4` must be equal
    // to `'static'`<br>
    Subnet: integer;
    // Sets the upstream gateway this interface will use. This is only applicable
    // for WAN-type interfaces.<br><br>This field is only available when the following
    // conditions are met:<br>- `typev4` must be equal to `'static'`<br>
    Gateway: string;
    // Sets the DHCP hostname this interface will advertise via DHCP.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    Dhcphostname: string;
    // Sets the value used as a fixed alias IPv4 address by the DHCP client.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    AliasAddress: string;
    // Sets the value used as the fixed alias IPv4 address's subnet bit count by the
    // DHCP client.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    AliasSubnet: integer;
    // Sets a list of IPv4 DHCP server addresses to reject DHCP offers for on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    Dhcprejectfrom: TStringDynArray;
    // Enables or disables the advanced DHCP settings on this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>
    AdvDhcpConfigAdvanced: boolean;
    // Selects the advanced DHCP timing preset.<br><br>This field is only available
    // when the following conditions are met:<br>- `typev4` must be equal to `'dhcp'`<br>-
    // `adv_dhcp_config_advanced` must be equal to `true`<br>
    AdvDhcpPtValues: TEnumPfopenapi29;
    // Manually sets the timeout timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtTimeout: integer;
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
    // Manually sets the reboot timing value used when requested DHCP leases on this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpPtReboot: integer;
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
    // Sets DHCP options to be sent when requesting a DHCP lease for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced` must be equal to
    // `true`<br>
    AdvDhcpSendOptions: string;
    // Sets DHCP option 55 values to be sent when requesting a DHCP lease for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpRequestOptions: string;
    // Sets DHCP options required by the client when requesting a DHCP lease for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced`
    // must be equal to `true`<br>
    AdvDhcpRequiredOptions: string;
    // Sets DHCP option modifiers applied to the obtained DHCP lease.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_advanced` must be equal to
    // `true`<br>
    AdvDhcpOptionModifiers: string;
    // Enables or disables overriding the entire DHCP configuration file for this
    // interface.<br><br>This field is only available when the following conditions
    // are met:<br>- `typev4` must be equal to `'dhcp'`<br>
    AdvDhcpConfigFileOverride: boolean;
    // Sets the local file path of the custom DHCP configuration file.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev4`
    // must be equal to `'dhcp'`<br>- `adv_dhcp_config_file_override` must be equal
    // to `true`<br>
    AdvDhcpConfigFileOverridePath: string;
    // Selects the IPv6 address type to assign this interface.<br>
    Typev6: TEnumPfopenapi30;
    // Sets the IPv6 address to assign to this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev6` must be one
    // of [ staticv6, dhcp6, slaac, 6rd, track6, 6to4 ]<br>
    Ipaddrv6: string;
    // Sets the subnet bit count to assign this interface.<br><br>This field is only
    // available when the following conditions are met:<br>- `typev6` must be equal
    // to `'staticv6'`<br>
    Subnetv6: integer;
    // Sets the upstream IPv6 gateway this interface will use. This is only applicable
    // for WAN-type interfaces.<br><br>This field is only available when the following
    // conditions are met:<br>- `typev6` must be equal to `'staticv6'`<br>
    Gatewayv6: string;
    // Enable or disable IPv6 using the IPv4 connectivity link (PPPoE).<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'staticv6'`<br>
    Ipv6usev4iface: boolean;
    // Enable or disable IPv6 using the IPv4 connectivity link (PPPoE).<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'slaac'`<br>
    Slaacusev4iface: boolean;
    // Sets the 6RD IPv6 prefix assigned by the ISP for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'6rd'`<br>
    Prefix6rd: string;
    // Sets the 6RD IPv4 gateway address assigned by the ISP for this interface.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'6rd'`<br>
    Gateway6rd: string;
    // Sets the 6RD IPv4 prefix length. Normally specified by the ISP. A value of
    // 0 means embed theentire IPv4 address in the 6RD prefix.<br><br>This field is
    // only available when the following conditions are met:<br>- `typev6` must be
    // equal to `'6rd'`<br>
    Prefix6rdV4plen: integer;
    // Sets the dynamic IPv6 WAN interface to track for configuration.<br><br>This
    // field is only available when the following conditions are met:<br>- `typev6`
    // must be equal to `'track6'`<br>
    Track6Interface: string;
    // Sets the hexadecimal IPv6 prefix ID. This determines the configurable network
    // ID based on the dynamic IPv6 connection.<br><br>This field is only available
    // when the following conditions are met:<br>- `typev6` must be equal to `'track6'`<br>
    Track6PrefixIdHex: string;
  end;
  PNetworkInterface = ^TNetworkInterface;

  TRoutingApply = packed record
    // Displays `true` when all routing changes are applied and there are no pending
    // changes left.Displays `false` when there are pending routing changes that have
    // not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PRoutingApply = ^TRoutingApply;

  TDefaultGateway = packed record
    // The gateway to assigns as the default IPv4 gateway for this system. Leave blank
    // to automatically determine the default gateway, or set to `-` to assign no
    // gateway.<br>
    Defaultgw4: string;
    // The gateway to assigns as the default IPv6 gateway for this system. Leave blank
    // to automatically determine the default gateway, or set to `-` to assign no
    // gateway.<br>
    Defaultgw6: string;
  end;
  PDefaultGateway = ^TDefaultGateway;

  TRoutingGateway = packed record
    // Sets a name for the gateway.<br>
    Name: string;
    // Sets a descriptions for the gateway.<br>
    Descr: string;
    // Disable this gateway.<br>
    Disabled: boolean;
    // Sets the Internet Protocol version this gateway uses.<br>
    Ipprotocol: TEnumPfopenapi4;
    // Sets the interface this gateway will apply to.<br>
    _Interface: string;
    // Sets the IP address of the remote gateway.<br>
    Gateway: string;
    // Disable gateway monitoring for this gateway.<br>
    MonitorDisable: boolean;
    // Sets a different IP address to use when monitoring this gateway. This is typically
    // only
    // necessary if the gateway IP does not accept ICMP probes.<br><br>This field
    // is only available when the following conditions are met:<br>- `monitor_disable`
    // must be equal to `false`<br>
    Monitor: string;
    // Disable actions from taking place when gateway events occur. The gateway will
    // always be
    // considered up.<br>
    ActionDisable: boolean;
    // Always consider this gateway to be up.<br>
    ForceDown: boolean;
    // Prevents gateway monitoring from adding a static route for this gateway's monitor
    // IP.<br>
    DpingerDontAddStaticRoute: boolean;
    // Controls the state killing behavior when this specific gateway goes down. Killing
    // states for specific down gateways only affects states created by policy routing
    // rules and reply-to. Has no effect if gateway monitoring or its action are disabled
    // or if the gateway is forced down. May not have any effect on dynamic gateways
    // during a link loss event.<br>
    GwDownKillStates: TEnumPfopenapi31;
    // Allows or disallows gateway IPs that are not a part of the parent interface's
    // subnet(s).<br>
    Nonlocalgateway: boolean;
    // Sets the weight for this gateway when used in a Gateway Group.<br>
    Weight: integer;
    // Sets the data payload to send in ICMP packets to gateway monitor IP.<br>
    DataPayload: integer;
    // Sets the threshold to consider latency as low.<br>
    Latencylow: integer;
    // Sets the threshold to consider latency as high. This value must be greater
    // than `latencylow`.<br>
    Latencyhigh: integer;
    // Sets the threshold to consider packet loss as low.<br>
    Losslow: integer;
    // Sets the threshold to consider packet loss as high. This value must be greater
    // than `losslow`.<br>
    Losshigh: integer;
    // Sets how often ICMP probes will be sent in milliseconds.<br>
    Interval: integer;
    // Sets the time interval in milliseconds before packets are treated as lost.<br>
    LossInterval: integer;
    // Sets the time period in milliseconds over which results are averaged.<br>
    TimePeriod: integer;
    // Sets the time interval in milliseconds between checking for an alert conditions.<br>
    AlertInterval: integer;
  end;
  PRoutingGateway = ^TRoutingGateway;

  TRoutingGatewayGroup = packed record
    // The name of the gateway group.<br>
    Name: string;
    // The trigger that will cause a gateway to be excluded from the group.<br>
    Trigger: TEnumPfopenapi32;
    // A description of the gateway group.<br>
    Descr: string;
    // The assumed IP protocol of the gateways in this group.<br>
    Ipprotocol: string;
    // The priorities of the gateways in this group.<br>
    Priorities: variant;
  end;
  PRoutingGatewayGroup = ^TRoutingGatewayGroup;

  TRoutingGatewayGroupPriority = packed record
    // The name of the gateway to prioritize in this gateway group.<br>
    Gateway: string;
    // The priority of this gateway in the group. Lower numbered tiers are higher
    // priority.<br>
    Tier: integer;
    // The virtual IP to use for this gateway group. Use `address` to use the interface's
    // current IP.<br>
    VirtualIp: string;
  end;
  PRoutingGatewayGroupPriority = ^TRoutingGatewayGroupPriority;

  TStaticRoute = packed record
    // Sets the destination network for this static route in CIDR notation.<br>
    Network: string;
    // Sets which gateway this route applies to.<br>
    Gateway: string;
    // Sets a description for administrative reference.<br>
    Descr: string;
    // Disable this static route.<br>
    Disabled: boolean;
  end;
  PStaticRoute = ^TStaticRoute;

  TACMEAccountKey = packed record
    // The name of the ACME account key.<br>
    Name: string;
    // A description of the ACME account key.<br>
    Descr: string;
    // The email address associated with the ACME account key.<br>
    Email: string;
    // The ACME server this account key will belong to.<br>
    Acmeserver: string;
    // The RSA private key for the ACME account key.<br>
    Accountkey: string;
  end;
  PACMEAccountKey = ^TACMEAccountKey;

  TACMEAccountKeyRegister = packed record
    // The name of the ACME account key to register.<br>
    Name: string;
    // The registration status of the ACME account key. This will show 'pending' if
    // the registration process is still running, 'registered' if the registration
    // was successful, 'failed' if the registration failed, and 'unknown' if the registration
    // status is not known. Note: This status can only be determined for registrations
    // initiated through the REST API.<br>
    Status: string;
  end;
  PACMEAccountKeyRegister = ^TACMEAccountKeyRegister;

  TACMECertificateAction = packed record
    // The activation status of the ACME certificate.<br>
    Status: TEnumPfopenapi33;
    // The command to execute on the ACME certificate.<br>
    Command: string;
    // The action method that should be used to run the command.<br>
    Method: TEnumPfopenapi34;
  end;
  PACMECertificateAction = ^TACMECertificateAction;

  TACMECertificateDomain = packed record
    // The fully-qualified domain name of this domain (SAN).<br>
    Name: string;
    // The activation status of the ACME certificate.<br>
    Status: TEnumPfopenapi3;
    // The method to use to validate this domain.<br>
    Method: string;
    // Folder into which the acme challenge response is written; for example: /usr/local/www/.well-known/acme-challenge/<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'webroot'`<br>
    Webrootfolder: string;
    // Hostname of FTP server to which ACME will connect (e.g. ftps://www.webserver.tld
    // ). Currently supports FTPS (passive) and SFTP.<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'webrootftp'`<br>
    Webrootftpftpserver: string;
    // Username for the remote server<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'webrootftp'`<br>
    Webrootftpusername: string;
    // Password to authenticate this user on the remote server<br><br>This field is
    // only available when the following conditions are met:<br>- `method` must be
    // equal to `'webrootftp'`<br>
    Webrootftppassword: string;
    // Folder into which the acme challenge response is written (e.g. /.well-known/acme-challenge/)<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'webrootftp'`<br>
    Webrootftpfolder: string;
    // HTTP listen port for stand-alone server. Must be 80 or have port 80 on WAN
    // forwarded to this port. Firewall rules must allow traffic to reach this port.<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'standalone'`<br>
    Standaloneport: string;
    // Bind to IPv6 instead of IPv4.<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'standalone'`<br>
    Standaloneipv6: boolean;
    // TLS listen port for stand-alone server. Must be 443 or have port 443 on WAN
    // forwarded to this port. Firewall rules must allow traffic to reach this port.<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'standalonetls'`<br>
    Standalonetlsport: string;
    // The DNS server to which updates are sent (IP address or hostname)<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_nsupdate'`<br>
    NsupdateServer: string;
    // (Optional) A name for the key, if it is different than _acme-challenge.[DomainName]<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_nsupdate'`<br>
    NsupdateKeyname: string;
    // Algorithm used to generate the authentication Key for this zone<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_nsupdate'`<br>
    NsupdateKeyalgo: TEnumPfopenapi35;
    // The key which authenticates updates for this zone<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_nsupdate'`<br>
    NsupdateKey: string;
    // (Optional) Explicitly set the zone name for updates.<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_nsupdate'`<br>
    NsupdateZone: string;
    // 1984Hosting Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_1984hosting'`<br>
    One984hostingUsername: string;
    // 1984Hosting Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_1984hosting'`<br>
    One984hostingPassword: string;
    // Acmeproxy Endpoint URL (https://ip:port)<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_acmeproxy'`<br>
    AcmeproxyEndpoint: string;
    // Acmeproxy Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_acmeproxy'`<br>
    AcmeproxyUsername: string;
    // Acmeproxy Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_acmeproxy'`<br>
    AcmeproxyPassword: string;
    // acme-dns.io Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_acmedns'`<br>
    AcmednsUsername: string;
    // acme-dns.io Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_acmedns'`<br>
    AcmednsPassword: string;
    // acme-dns.io subdomain<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_acmedns'`<br>
    AcmednsSubdomain: string;
    // (optional) Custom ACME DNS Base URL<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'dns_acmedns'`<br>
    AcmednsUpdateUrl: string;
    // Active24 Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_active24'`<br>
    Active24Token: string;
    // Hostname<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_edgedns'`<br>
    AkamaiHost: string;
    // Access Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_edgedns'`<br>
    AkamaiAccessToken: string;
    // Client Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_edgedns'`<br>
    AkamaiClientToken: string;
    // Client Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_edgedns'`<br>
    AkamaiClientSecret: string;
    // API Key<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_ali'`<br>
    AliKey: string;
    // API Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_ali'`<br>
    AliSecret: string;
    // Login<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_kas'`<br>
    KasLogin: string;
    // Auth type (default: sha1)<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_kas'`<br>
    KasAuthtype: string;
    // Auth data<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_kas'`<br>
    KasAuthdata: string;
    // Alwaysdata API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_ad'`<br>
    AdApiKey: string;
    // API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_anx'`<br>
    AnxToken: string;
    // ArtFiles Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_artfiles'`<br>
    AfApiUsername: string;
    // ArtFiles Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_artfiles'`<br>
    AfApiPassword: string;
    // Arvan API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_arvan'`<br>
    ArvanToken: string;
    // API Key<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_aurora'`<br>
    AuroraKey: string;
    // API Secret. Obtain the key and secret from https://cp.pcextreme.nl/auroradns/users.<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_aurora'`<br>
    AuroraSecret: string;
    // autoDNS Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_autodns'`<br>
    AutodnsUser: string;
    // autoDNS Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_autodns'`<br>
    AutodnsPassword: string;
    // autoDNS Context<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_autodns'`<br>
    AutodnsContext: string;
    // AWS Access Key / API ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_aws'`<br>
    AwsAccessKeyId: string;
    // AWS Secret Access / API Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_aws'`<br>
    AwsSecretAccessKey: string;
    // Sleep interval after TXT record update, in seconds (default: 1)<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_aws'`<br>
    AwsDnsSlowrate: string;
    // Account e-mail address<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_azion'`<br>
    AzionEmail: string;
    // Account password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_azion'`<br>
    AzionPassword: string;
    // Azure Subscription ID. First, <a href="https://github.com/acmesh-official/acme.sh/wiki/How-to-use-Azure-DNS">setup
    // a service principal for access to the DNS Zone</a>.<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_azure'`<br>
    AzurednsSubscriptionid: string;
    // Azure Tenant ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_azure'`<br>
    AzurednsTenantid: string;
    // Azure App ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_azure'`<br>
    AzurednsAppid: string;
    // Azure Client Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_azure'`<br>
    AzurednsClientsecret: string;
    // BookMyName Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_bookmyname'`<br>
    BookmynameUsername: string;
    // BookMyName Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_bookmyname'`<br>
    BookmynamePassword: string;
    // Bunny DNS API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_bunny'`<br>
    BunnyApiKey: string;
    // CloudDNS e-mail address<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_clouddns'`<br>
    ClouddnsEmail: string;
    // CloudDNS client ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_clouddns'`<br>
    ClouddnsClientId: string;
    // CloudDNS Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_clouddns'`<br>
    ClouddnsPassword: string;
    // Authentication ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cloudns'`<br>
    CloudnsAuthId: string;
    // Sub authentication ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cloudns'`<br>
    CloudnsSubAuthId: string;
    // ClouDNS Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cloudns'`<br>
    CloudnsAuthPassword: string;
    // Cloudflare API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cf'`<br>
    CfKey: string;
    // Cloudflare API Email Address<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cf'`<br>
    CfEmail: string;
    // Cloudflare API Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cf'`<br>
    CfToken: string;
    // Cloudflare API Account ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cf'`<br>
    CfAccountId: string;
    // Cloudflare API Zone ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cf'`<br>
    CfZoneId: string;
    // Conoha Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_conoha'`<br>
    ConohaUsername: string;
    // Conoha Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_conoha'`<br>
    ConohaPassword: string;
    // Conoha Tenant ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_conoha'`<br>
    ConohaTenantid: string;
    // Conoha Identity Service API<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_conoha'`<br>
    ConohaIdentityserviceapi: string;
    // Constellix Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_constellix'`<br>
    ConstellixKey: string;
    // Constellix Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_constellix'`<br>
    ConstellixSecret: string;
    // cPanel username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cpanel'`<br>
    CpanelUsername: string;
    // cPanel API token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cpanel'`<br>
    CpanelApitoken: string;
    // URL to cPanel instance<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cpanel'`<br>
    CpanelHostname: string;
    // Core Networks Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cn'`<br>
    CnUser: string;
    // Core Networks Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_cn'`<br>
    CnPassword: string;
    // Authentication Client ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_curanet'`<br>
    CuranetAuthclientid: string;
    // Authentication Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_curanet'`<br>
    CuranetAuthsecret: string;
    // CY username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cyon'`<br>
    CyUsername: string;
    // CY Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_cyon'`<br>
    CyPassword: string;
    // API Token (e.g. aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee)<br><br>This field is
    // only available when the following conditions are met:<br>- `method` must be
    // equal to `'dns_ddnss'`<br>
    DdnssToken: string;
    // deSEC.io API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_desec'`<br>
    DedynToken: string;
    // deSEC.io Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_desec'`<br>
    DedynName: string;
    // DigitalOcean API Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_dgon'`<br>
    DoApiKey: string;
    // DirectAdmin API URI (e.g. https://remoteUser:remotePassword@da.example.com:8443)<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_da'`<br>
    DaApi: string;
    // DirectAdmin API Security check, 0=check for valid SSL certificate, 1=always
    // accept<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_da'`<br>
    DaApiInsecure: string;
    // DNSExit API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnsexit'`<br>
    DnsexitApiKey: string;
    // DNSExit Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnsexit'`<br>
    DnsexitAuthUser: string;
    // DNSExit Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnsexit'`<br>
    DnsexitAuthPass: string;
    // Subdomain<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnshome'`<br>
    DnshomeSubdomain: string;
    // Subdomain Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnshome'`<br>
    DnshomeSubdomainpassword: string;
    // DNSimple oauth token, visit <a href="https://dnsimple.com/user">https://dnsimple.com/user</a>
    // to generate.<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dnsimple'`<br>
    DnsimpleOauthToken: string;
    // DNSMadeEasy API Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_me'`<br>
    MeKey: string;
    // DNSMadeEasy API Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_me'`<br>
    MeSecret: string;
    // dns.services Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_dnsservices'`<br>
    DnsservicesUsername: string;
    // dns.services Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_dnsservices'`<br>
    DnsservicesPassword: string;
    // DO.de API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_doapi'`<br>
    DoLetoken: string;
    // DO Customer ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_do'`<br>
    DoPid: string;
    // DO Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_do'`<br>
    DoPw: string;
    // Domeneshop API Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_domeneshop'`<br>
    DomeneshopToken: string;
    // Domeneshop API Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_domeneshop'`<br>
    DomeneshopSecret: string;
    // Dnspod API ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dp'`<br>
    DpId: string;
    // Dnspod API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dp'`<br>
    DpKey: string;
    // Dnspod API ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dpi'`<br>
    DpiId: string;
    // Dnspod API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dpi'`<br>
    DpiKey: string;
    // Dreamhost API Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_dreamhost'`<br>
    DhApiKey: string;
    // DuckDNS API Token (Look in DuckDNS account settings)<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_duckdns'`<br>
    DuckdnsToken: string;
    // DurableDNS API User<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_durabledns'`<br>
    DdApiUser: string;
    // DurableDNS API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_durabledns'`<br>
    DdApiKey: string;
    // dyn.com customer ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_dyn'`<br>
    DynCustomer: string;
    // dyn.com API Username (Dyn Managed DNS user, Needs Z&R Permissions for RecordAdd,
    // RecordUpdate, RecordDelete, RecordGet, ZoneGet, ZoneAddNode, ZoneRemoveNode,
    // ZonePublish)<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dyn'`<br>
    DynUsername: string;
    // dyn.com Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dyn'`<br>
    DynPassword: string;
    // dyndnsfree.de Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_df'`<br>
    DfUser: string;
    // dyndnsfree.de Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_df'`<br>
    DfPassword: string;
    // Dynu API Client ID created in the Dynu account settings<br><br>This field is
    // only available when the following conditions are met:<br>- `method` must be
    // equal to `'dns_dynu'`<br>
    DynuClientid: string;
    // Dynu API Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_dynu'`<br>
    DynuSecret: string;
    // easyDNS API Key. Sign up for a key at https://cp.easydns.com/manage/security/api/signup.php<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_easydns'`<br>
    EasydnsKey: string;
    // easyDNS API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_easydns'`<br>
    EasydnsToken: string;
    // Euserv.eu Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_euserv'`<br>
    EuservUsername: string;
    // Euserv.eu Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_euserv'`<br>
    EuservPassword: string;
    // Exoscale API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_exoscale'`<br>
    ExoscaleApiKey: string;
    // Exoscale Secret Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_exoscale'`<br>
    ExoscaleSecretKey: string;
    // Fornex API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_fornex'`<br>
    FornexApiKey: string;
    // FreeDNS username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_freedns'`<br>
    FreednsUser: string;
    // FreeDNS Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_freedns'`<br>
    FreednsPassword: string;
    // Gandi LiveDNS API Key, retrieved from <a href="https://account.gandi.net">https://account.gandi.net</a><br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_gandi_livedns'`<br>
    GandiLivednsKey: string;
    // Gcore API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_gcore'`<br>
    GcoreKey: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_geoscaling'`<br>
    GeoscalingUsername: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_geoscaling'`<br>
    GeoscalingPassword: string;
    // GoDaddy API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_gd'`<br>
    GdKey: string;
    // GoDaddy API Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_gd'`<br>
    GdSecret: string;
    // Google Domains API Access Token<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_googledomains'`<br>
    GoogledomainsAccessToken: string;
    // Google Domains DNS Zone<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_googledomains'`<br>
    GoogledomainsZone: string;
    // Hetzner API Token. Visit https://dns.hetzner.com/settings/api-token to retrieve.<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_hetzner'`<br>
    HetznerToken: string;
    // Hexonet Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_hexonet'`<br>
    HexonetLogin: string;
    // Hexonet Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_hexonet'`<br>
    HexonetPassword: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_huaweicloud'`<br>
    HuaweicloudUsername: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_huaweicloud'`<br>
    HuaweicloudPassword: string;
    // Domain Name<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_huaweicloud'`<br>
    HuaweicloudDomainname: string;
    // Hurricane Electric username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_he'`<br>
    HeUsername: string;
    // Hurricane Electric password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_he'`<br>
    HePassword: string;
    // Hosting.de API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_hostingde'`<br>
    HostingdeApikey: string;
    // Hosting.de API endpoint, e.g. https://secure.hosting.de<br><br>This field is
    // only available when the following conditions are met:<br>- `method` must be
    // equal to `'dns_hostingde'`<br>
    HostingdeEndpoint: string;
    // Infoblox credentials in <strong>username:password</strong> format<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_infoblox'`<br>
    InfobloxCreds: string;
    // Infoblox server IP address or hostname<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_infoblox'`<br>
    InfobloxServer: string;
    // Infoblox DNS View name, or enter "default"<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_infoblox'`<br>
    InfobloxView: string;
    // Infomaniak API token. Visit https://manager.infomaniak.com/v3/&lt;account_id&gt;/api/dashboard
    // and generate a token with the scope Domain.<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_infomaniak'`<br>
    InfomaniakApiToken: string;
    // Infomaniak API URL (Default: https://api.infomaniak.com)<br><br>This field
    // is only available when the following conditions are met:<br>- `method` must
    // be equal to `'dns_infomaniak'`<br>
    DefaultInfomaniakApiUrl: string;
    // Infomaniak DNS record TTL (Default: 300)<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_infomaniak'`<br>
    InfomaniakTtl: string;
    // Prefix<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_ionos'`<br>
    IonosPrefix: string;
    // Secret. Read https://beta.developer.hosting.ionos.de/docs/getstarted to learn
    // how to get a prefix and secret.<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_ionos'`<br>
    IonosSecret: string;
    // IPv64.net Access Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_ipv64'`<br>
    Ipv64Token: string;
    // Internet.BS API Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_internetbs'`<br>
    InternetbsApiKey: string;
    // Internet.BS API Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_internetbs'`<br>
    InternetbsApiPassword: string;
    // INWX.de username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_inwx'`<br>
    InwxUsername: string;
    // INWX.de password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_inwx'`<br>
    InwxPassword: string;
    // INWX.de shared secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_inwx'`<br>
    InwxSharedSecret: string;
    // ISPConfig remoteUser<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_ispconfig'`<br>
    IspcUser: string;
    // ISPConfig remotePassword<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_ispconfig'`<br>
    IspcPassword: string;
    // API URL (e.g. https://ispc.domain.tld:8080/remote/json.php )<br><br>This field
    // is only available when the following conditions are met:<br>- `method` must
    // be equal to `'dns_ispconfig'`<br>
    IspcApi: string;
    // Set 1 for insecure and 0 for secure. Controls whether the server TLS certificate
    // is checked for validity (0) or always accepted (1)<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_ispconfig'`<br>
    IspcApiInsecure: string;
    // jdcloud Access Key ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_jd'`<br>
    JdAccessKeyId: string;
    // jdcloud Access Key Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_jd'`<br>
    JdAccessKeySecret: string;
    // jdcloud Region<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_jd'`<br>
    JdRegion: string;
    // Joker.com Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_joker'`<br>
    JokerUsername: string;
    // Joker.com Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_joker'`<br>
    JokerPassword: string;
    // kapper.net API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_kappernet'`<br>
    KappernetdnsKey: string;
    // kapper.net API Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_kappernet'`<br>
    KappernetdnsSecret: string;
    // Kinghost API Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_kinghost'`<br>
    KinghostUsername: string;
    // Kinghost API Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_kinghost'`<br>
    KinghostPassword: string;
    // IP address of the Knot server<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_knot'`<br>
    KnotServer: string;
    // Knot TSIG Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_knot'`<br>
    KnotKey: string;
    // ID<br><br>This field is only available when the following conditions are met:<br>-
    // `method` must be equal to `'dns_la'`<br>
    LaId: string;
    // Key<br><br>This field is only available when the following conditions are met:<br>-
    // `method` must be equal to `'dns_la'`<br>
    LaKey: string;
    // Leaseweb API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_leaseweb'`<br>
    LswKey: string;
    // API Key must have the following roles: dns.admin, domains.reader<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_limacity'`<br>
    LimacityApikey: string;
    // Linode API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_linode'`<br>
    LinodeApiKey: string;
    // Linode v4 API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_linode_v4'`<br>
    LinodeV4ApiKey: string;
    // Loopia username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_loopia'`<br>
    LoopiaUser: string;
    // Loopia Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_loopia'`<br>
    LoopiaPassword: string;
    // Luadns API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_lua'`<br>
    LuaKey: string;
    // Luadns API Email Address<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_lua'`<br>
    LuaEmail: string;
    // MailinaBox Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_miab'`<br>
    MiabUsername: string;
    // MailinaBox Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_miab'`<br>
    MiabPassword: string;
    // MailinaBox Server<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_miab'`<br>
    MiabServer: string;
    // misaka.io Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_misaka'`<br>
    MisakaKey: string;
    // MyDNS.jp Master ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_mydnsjp'`<br>
    MydnsjpMasterid: string;
    // MyDNS.jp Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_mydnsjp'`<br>
    MydnsjpPassword: string;
    // OAuth2 Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_mythic_beasts'`<br>
    MbAk: string;
    // OAuth2 Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_mythic_beasts'`<br>
    MbAs: string;
    // Name.com username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_namecom'`<br>
    NamecomUsername: string;
    // Name.com API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_namecom'`<br>
    NamecomToken: string;
    // Namecheap API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_namecheap'`<br>
    NamecheapApiKey: string;
    // Namecheap Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_namecheap'`<br>
    NamecheapUsername: string;
    // namemaster.de API username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_nm'`<br>
    NmUser: string;
    // namemaster.de API password as SHA256 hash<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_nm'`<br>
    NmSha256: string;
    // Nanelo.com Access Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_nanelo'`<br>
    NaneloToken: string;
    // NederHost API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_nederhost'`<br>
    NederhostKey: string;
    // Namesilo API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_namesilo'`<br>
    NamesiloKey: string;
    // Neodigit API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_neodigit'`<br>
    NeodigitApiToken: string;
    // Netcup API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_netcup'`<br>
    NcApikey: string;
    // Netcup API Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_netcup'`<br>
    NcApipw: string;
    // Netcup Customer ID/Number<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_netcup'`<br>
    NcCid: string;
    // Netlify API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_netlify'`<br>
    NetlifyAccessToken: string;
    // nic.ru API Client ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_nic'`<br>
    NicClientid: string;
    // nic.ru API Client Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_nic'`<br>
    NicClientsecret: string;
    // nic.ru Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_nic'`<br>
    NicUsername: string;
    // nic.ru Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_nic'`<br>
    NicPassword: string;
    // NS1 API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_nsone'`<br>
    Ns1Key: string;
    // NW API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_nw'`<br>
    NwApiToken: string;
    // Choose the NW API Endpoint<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_nw'`<br>
    NwApiEndpoint: TEnumPfopenapi36;
    // One.com Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_one'`<br>
    OnecomUser: string;
    // One.com Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_one'`<br>
    OnecomPassword: string;
    // Online.net API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_online'`<br>
    OnlineApiKey: string;
    // OCID of tenancy that contains the target DNS zone<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_oci'`<br>
    OciCliTenancy: string;
    // OCID of user with permission to add/remove records from zones<br><br>This field
    // is only available when the following conditions are met:<br>- `method` must
    // be equal to `'dns_oci'`<br>
    OciCliUser: string;
    // Tenancy home region<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_oci'`<br>
    OciCliRegion: string;
    // The private API signing key in PEM format. Using an encrypted private key that
    // needs a passphrase is not supported.<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'dns_oci'`<br>
    OciCliKey: string;
    // OpenProvider Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_openprovider'`<br>
    OpenproviderUser: string;
    // OpenProvider Password Hash<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_openprovider'`<br>
    OpenproviderPasswordhash: string;
    // OVH Application Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_ovh'`<br>
    OvhAk: string;
    // OVH Application Secret<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_ovh'`<br>
    OvhAs: string;
    // OVH Consumer Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_ovh'`<br>
    OvhCk: string;
    // Choose the OVH API Endpoint / Region<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'dns_ovh'`<br>
    OvhEndPoint: TEnumPfopenapi37;
    // Plesk User<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_pleskxml'`<br>
    PleskxmlUser: string;
    // Plesk Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_pleskxml'`<br>
    PleskxmlPass: string;
    // Plesk Server URI<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_pleskxml'`<br>
    PleskxmlUri: string;
    // PointHQ API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_pointhq'`<br>
    PointhqKey: string;
    // PointHQ account E-mail address<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_pointhq'`<br>
    PointhqEmail: string;
    // API Key<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_porkbun'`<br>
    PorkbunApiKey: string;
    // Secret API Key. Obtain the key and secret from https://porkbun.com/account/api<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_porkbun'`<br>
    PorkbunSecretApiKey: string;
    // PowerDNS URL (e.g. http://ns.example.com:8081 )<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_pdns'`<br>
    PdnsUrl: string;
    // PowerDNS ServerId (e.g. localhost )<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'dns_pdns'`<br>
    PdnsServerid: string;
    // PowerDNS Token (e.g. 0123456789ABCDEF )<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_pdns'`<br>
    PdnsToken: string;
    // PowerDNS Record TTL (e.g. 60 )<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_pdns'`<br>
    PdnsTtl: string;
    // API UUID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rackcorp'`<br>
    RackcorpApiuuid: string;
    // API Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rackcorp'`<br>
    RackcorpApisecret: string;
    // Rackspace Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rackspace'`<br>
    RackspaceUsername: string;
    // Rackspace API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rackspace'`<br>
    RackspaceApikey: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rage4'`<br>
    Rage4Username: string;
    // Token<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_rage4'`<br>
    Rage4Token: string;
    // Rcode0 API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rcode0'`<br>
    Rcode0ApiToken: string;
    // Rcode0 URL<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rcode0'`<br>
    Rcode0Url: string;
    // Rcode0 TTL<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_rcode0'`<br>
    Rcode0Ttl: string;
    // reg.ru Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_regru'`<br>
    RegruApiUsername: string;
    // reg.ru API Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_regru'`<br>
    RegruApiPassword: string;
    // API Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_scaleway'`<br>
    ScalewayApiToken: string;
    // schlundtech.de Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_schlundtech'`<br>
    SchlundtechUser: string;
    // schlundtech.de Password<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_schlundtech'`<br>
    SchlundtechPassword: string;
    // Selectel API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_selectel'`<br>
    SlKey: string;
    // Username (Customer number, not email address or DynDNS account)<br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_selfhost'`<br>
    SelfhostdnsUsername: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_selfhost'`<br>
    SelfhostdnsPassword: string;
    // Record ID (Edit the record, value is shown in brackets)<br><br>This field is
    // only available when the following conditions are met:<br>- `method` must be
    // equal to `'dns_selfhost'`<br>
    SelfhostdnsMap: string;
    // Servercow username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_servercow'`<br>
    ServercowApiUsername: string;
    // Servercow password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_servercow'`<br>
    ServercowApiPassword: string;
    // Account Name<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_simply'`<br>
    SimplyAccountname: string;
    // API Key<br><br>This field is only available when the following conditions are
    // met:<br>- `method` must be equal to `'dns_simply'`<br>
    SimplyApikey: string;
    // API Endpoint URL. Default: https://api.simply.com/1<br><br>This field is only
    // available when the following conditions are met:<br>- `method` must be equal
    // to `'dns_simply'`<br>
    SimplyApi: string;
    // Tele3 Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_tele3'`<br>
    Tele3Key: string;
    // Tele3 Secret<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_tele3'`<br>
    Tele3Secret: string;
    // Tencent Secret ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_tencent'`<br>
    TencentSecretid: string;
    // Tencent Secret Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_tencent'`<br>
    TencentSecretkey: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_udr'`<br>
    UdrUser: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_udr'`<br>
    UdrPass: string;
    // UltraDNS Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_ultra'`<br>
    UltraUsr: string;
    // UltraDNS Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_ultra'`<br>
    ULTRAPWD: string;
    // UnoEuro username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_unoeuro'`<br>
    UnoUser: string;
    // UnoEuro API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_unoeuro'`<br>
    UnoKey: string;
    // variomedia.de API Token<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_variomedia'`<br>
    VariomediaApiToken: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_veesp'`<br>
    VeespUser: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_veesp'`<br>
    VeespPassword: string;
    // Vercel Token<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_vercel'`<br>
    VercelToken: string;
    // vscale API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_vscale'`<br>
    VscaleApiKey: string;
    // vultr.com API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_vultr'`<br>
    VultrApiKey: string;
    // API Key / "Identifier" in the WS Admin<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_websupport'`<br>
    WsApikey: string;
    // API Secret / "Secret key" in the WS Admin. Obtain the API Key and Secret from
    // https://admin.websupport.sk/en/auth/apiKey.<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'dns_websupport'`<br>
    WsApisecret: string;
    // West.cn Domain API Username<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_west_cn'`<br>
    WestUsername: string;
    // West.cn Domain API Key<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_west_cn'`<br>
    WestKey: string;
    // Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_world4you'`<br>
    World4youUsername: string;
    // Password<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_world4you'`<br>
    World4youPassword: string;
    // Yandex PDD Token, generate at <a href="https://pddimp.yandex.ru/api2/admin/get_token">https://pddimp.yandex.ru/api2/admin/get_token</a><br><br>This
    // field is only available when the following conditions are met:<br>- `method`
    // must be equal to `'dns_yandex'`<br>
    PddToken: string;
    // DNS Zone ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_yc'`<br>
    YcZoneId: string;
    // Yandex Cloud Folder ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_yc'`<br>
    YcFolderId: string;
    // Service Account ID<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_yc'`<br>
    YcSaId: string;
    // Service Account IAM Key ID<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'dns_yc'`<br>
    YcSaKeyId: string;
    // Base64 content of private key.<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'dns_yc'`<br>
    YcSaKeyFilePemB64: string;
    // Zonomi API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_zonomi'`<br>
    ZmKey: string;
    // Zone.ee Username<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_zone'`<br>
    ZoneUsername: string;
    // Zone.ee API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_zone'`<br>
    ZoneKey: string;
    // Zilore API Key<br><br>This field is only available when the following conditions
    // are met:<br>- `method` must be equal to `'dns_zilore'`<br>
    ZiloreKey: string;
    // (Optional) Adds the --challenge-alias flag to the acme.sh call.<br/>To use
    // a CNAME for _acme-challenge.importantDomain.tld to direct the acme validation
    // to a different (sub)domain _acme-challenge.aliasDomainForValidationOnly.tld,
    // configure the alternate domain here.<br/>More information can be found <a href="https://github.com/acmesh-official/acme.sh/wiki/DNS-alias-mode"
    // target="_new">here</a>.<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must not be one of [ webroot, webrootftp,
    // standalone, standalonetls ]<br>
    Anydnschallengealias: string;
    // (Optional) Uses the challenge domain alias value as --domain-alias instead
    // in the acme.sh call.<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must not be one of [ webroot, webrootftp,
    // standalone, standalonetls ]<br>
    Anydnschallengedomain: boolean;
  end;
  PACMECertificateDomain = ^TACMECertificateDomain;

  TACMECertificate = packed record
    // The name of the ACME certificate.<br>
    Name: string;
    // A description of the ACME certificate.<br>
    Descr: string;
    // The activation status of the ACME certificate.<br>
    Status: TEnumPfopenapi33;
    // The ACME account key to use for the ACME certificate.<br>
    Acmeaccount: string;
    // The length of the private key to use for the ACME certificate.<br>
    Keylength: TEnumPfopenapi38;
    // The custom private key to use for the ACME certificate.<br><br>This field is
    // only available when the following conditions are met:<br>- `keylength` must
    // be equal to `'custom'`<br>
    Keypaste: string;
    // The preferred certificate chain to use for the ACME certificate.<br>
    Preferredchain: string;
    // Whether to enable OCSP Stapling for the ACME certificate.<br>
    Oscpstaple: boolean;
    // The number of seconds to wait for DNS propagation before requesting verification.<br>
    Dnssleep: integer;
    // The number of days before expiration to renew the ACME certificate.<br>
    Renewafter: integer;
    // The list of domain verifications  to include in the ACME certificate.<br>
    ADomainlist: variant;
    // The list of actions to perform on the ACME certificate after being issued/renewed.<br>
    AActionlist: variant;
  end;
  PACMECertificate = ^TACMECertificate;

  TACMECertificateIssue = packed record
    // The name of the ACME certificate to be issued.<br>
    Certificate: string;
    // The status of the ACME certificate issue process. This will show 'pending'
    // if the issue process is still running or 'completed' if the issue process has
    // finished. This status only indicates whether the issue process has completed,
    // not whether it was successful. You will needto refer to the result log for
    // that information.<br>
    Status: string;
    // The unix timestamp of when the ACME certificate issue status last changed.<br>
    LastUpdated: integer;
    // The output result of the acme.sh issue command.<br>
    ResultLog: string;
  end;
  PACMECertificateIssue = ^TACMECertificateIssue;

  TACMECertificateRenew = packed record
    // The name of the ACME certificate to be renewed.<br>
    Certificate: string;
    // The status of the ACME certificate renew process. This will show 'pending'
    // if the renew process is still running or 'completed' if the renew process has
    // finished. This status only indicates whether the renew process has completed,
    // not whether it was successful. You will needto refer to the result log for
    // that information. Note: This log is only populated when the renew process is
    // initiated via REST API, not when it is initiated via the pfSense webConfigurator
    // or auto-renewals.<br>
    Status: string;
    // The unix timestamp of when the ACME certificate renew status last changed.
    // Note: This timestamp is only updated when the renew process is initiated via
    // REST API, not when it is initiated via the pfSense webConfigurator or auto-renewals.<br>
    LastUpdated: integer;
    // The output result of the acme.sh renew command. Note: This log is only populated
    // when the renew process is initiated via REST API, not when it is initiated
    // via the pfSense webConfigurator or auto-renewals.<br>
    ResultLog: string;
  end;
  PACMECertificateRenew = ^TACMECertificateRenew;

  TACMESettings = packed record
    // Enables or disables the ACME renewal job.<br>
    Enable: boolean;
    // Enables or disables the writing of certificates to /conf/acme/ in various formats
    // for use by other scripts or daemons which do not integrate with the pfSense
    // certificate manager.<br>
    Writecerts: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PACMESettings = ^TACMESettings;

  TBINDAccessList = packed record
    // The name of the access list.<br>
    Name: string;
    // A description for the access list.<br>
    Description: string;
    // The network entries for this access list.<br>
    Entries: variant;
  end;
  PBINDAccessList = ^TBINDAccessList;

  TBINDAccessListEntry = packed record
    // The network CIDR to allow.<br>
    Value: string;
    // A description of the access list entry.<br>
    Description: string;
  end;
  PBINDAccessListEntry = ^TBINDAccessListEntry;

  TBINDSettings = packed record
    // Enables the BIND service.<br>
    EnableBind: boolean;
    // The IP version to use for the BIND service. Leave empty to use both IPv4 and
    // IPv6.<br>
    BindIpVersion: TEnumPfopenapi39;
    // The interfaces to listen on for DNS requests.<br>
    Listenon: TStringDynArray;
    // Notify slave server after any update on master.<br>
    BindNotify: boolean;
    // Hide the BIND version in responses.<br>
    BindHideVersion: boolean;
    // The maximum amount of RAM to use for the BIND service.<br>
    BindRamLimit: string;
    // Enable logging for the BIND service.<br>
    BindLogging: boolean;
    // The minimum severity of events to log.<br>
    LogSeverity: TEnumPfopenapi40;
    // The categories to log.<br>
    LogOptions: TEnumPfopenapi41Set;
    // Enable rate limiting for the BIND service.<br>
    RateEnabled: boolean;
    // The maximum number of queries per second to allow.<br><br>This field is only
    // available when the following conditions are met:<br>- `rate_enabled` must be
    // equal to `true`<br>
    RateLimit: integer;
    // When rate limiting, only log that the query limit has been exceeded. If disabled,
    // the query will be dropped instead.<br>
    LogOnly: boolean;
    // Enable forwarding queries to other DNS servers listed below rather than this
    // server performing its own recursion.<br>
    BindForwarder: boolean;
    // The IP addresses of the DNS servers to forward queries to.<br><br>This field
    // is only available when the following conditions are met:<br>- `bind_forwarder`
    // must be equal to `true`<br>
    BindForwarderIps: TStringDynArray;
    // Enable DNSSEC validation when BIND is acting as a recursive resolver.<br>
    BindDnssecValidation: TEnumPfopenapi42;
    // The TCP and UDP port to listen on for DNS requests. Valid options are: a TCP/UDP
    // port number<br>
    Listenport: string;
    // The TCP port to listen on for control requests (localhost only). Valid options
    // are: a TCP/UDP port number<br>
    Controlport: string;
    // Custom BIND options to include in the configuration file.<br>
    BindCustomOptions: string;
    // Global BIND settings to include in the configuration file.<br>
    BindGlobalSettings: string;
  end;
  PBINDSettings = ^TBINDSettings;

  TBINDSyncRemoteHost = packed record
    // Enable this remote host for syncing.<br>
    Syncdestinenable: boolean;
    // The protocol to use for syncing.<br>
    Syncprotocol: TEnumPfopenapi43;
    // The IP address/hostname of the remote host.<br>
    Ipaddress: string;
    // The remote host port to use for syncing. Valid options are: a TCP/UDP port
    // number<br>
    Syncport: string;
    // The username to use to authenticate when syncing.<br>
    Username: string;
    // The password to use to authenticate when syncing.<br>
    Password: string;
  end;
  PBINDSyncRemoteHost = ^TBINDSyncRemoteHost;

  TBINDSyncSettings = packed record
    // The sync mode to use.<br>
    Synconchanges: TEnumPfopenapi44;
    // The timeout for the sync process.<br>
    Synctimeout: integer;
    // The IP address of the master BIND server.<br>
    Masterip: string;
  end;
  PBINDSyncSettings = ^TBINDSyncSettings;

  TBINDView = packed record
    // The name of the view.<br>
    Name: string;
    // A description for the view.<br>
    Descr: string;
    // Enables or disables recursion for the view.<br>
    Recursion: boolean;
    // The access lists to match clients against.<br>
    MatchClients: TStringDynArray;
    // The access lists to allow recursion for.<br>
    AllowRecursion: TStringDynArray;
    // Custom BIND options for the view.<br>
    BindCustomOptions: string;
  end;
  PBINDView = ^TBINDView;

  TBINDZone = packed record
    // Disable this BIND zone.<br>
    Disabled: boolean;
    // The name of this BIND zone.<br>
    Name: string;
    // A description for this BIND zone.<br>
    Description: string;
    // The type of this BIND zone.<br>
    _Type: TEnumPfopenapi45;
    // The views this BIND zone belongs to.<br>
    View: TStringDynArray;
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
    // Custom BIND options for this BIND zone.<br>
    Custom: string;
    // Enable DNSSEC for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, slave
    // ]<br>
    Dnssec: boolean;
    // Enable backing up DNSSEC keys in the XML configuration for this BIND zone.<br><br>This
    // field is only available when the following conditions are met:<br>- `dnssec`
    // must be equal to `true`<br>
    Backupkeys: boolean;
    // The IP address of the slave server for this BIND zone.<br><br>This field is
    // only available when the following conditions are met:<br>- `type` must be equal
    // to `'slave'`<br>
    Slaveip: string;
    // The forwarders for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'forward'`<br>
    Forwarders: TStringDynArray;
    // The default TTL interval (in seconds) for records within this BIND zone without
    // a specific TTL.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'master'`<br>
    Ttl: integer;
    // The IP address of the base domain for this zone. This sets an A record for
    // the base domain.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'master'`<br>
    Baseip: string;
    // The SOA nameserver for this zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, redirect
    // ]<br>
    Nameserver: string;
    // The SOA email address (RNAME) for this zone. This must be in an FQDN format.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be one of [ master, redirect ]<br>
    Mail: string;
    // The SOA serial number for this zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be one of [ master, redirect
    // ]<br>
    Serial: integer;
    // The SOA refresh interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Refresh: integer;
    // The SOA retry interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Retry: integer;
    // The SOA expiry interval (in seconds) for this zone.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be one of
    // [ master, redirect ]<br>
    Expire: integer;
    // The SOA minimum TTL interval (in seconds) for this zone. This is also referred
    // to as the negative TTL.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be one of [ master, redirect ]<br>
    Minimum: integer;
    // Enable a specific dynamic update policy for this BIND zone.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'master'`<br>
    EnableUpdatepolicy: boolean;
    // The update policy for this BIND zone.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'master'`<br>-
    // `enable_updatepolicy` must be equal to `true`<br>
    Updatepolicy: string;
    // The access lists that are allowed to submit dynamic updates for 'master' zones
    // (e.g. dynamic DNS).<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'master'`<br>- `enable_updatepolicy`
    // must be equal to `false`<br>
    Allowupdate: TStringDynArray;
    // The access lists that are allowed to transfer this BIND zone.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'master'`<br>
    Allowtransfer: TStringDynArray;
    // The access lists that are allowed to query this BIND zone.<br>
    Allowquery: TStringDynArray;
    // Register DHCP static mappings as records in this BIND zone.<br>
    Regdhcpstatic: boolean;
    // Custom records for this BIND zone.<br>
    Customzonerecords: string;
    // The records for this BIND zone.<br>
    Records: variant;
  end;
  PBINDZone = ^TBINDZone;

  TBINDZoneRecord = packed record
    // The domain name for this record.<br>
    Name: string;
    // The type of record.<br>
    _Type: TEnumPfopenapi46;
    // The data for this record. This can be an IP address, domain name, or other
    // data depending on the record type.<br>
    Rdata: string;
    // The priority for this record.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be one of [ MX, SRV ]<br>
    Priority: integer;
  end;
  PBINDZoneRecord = ^TBINDZoneRecord;

  TCronJob = packed record
    // The minute(s) at which the command will be executed or a special @ event string.
    // (0-59, ranges, divided, @ event or delay, *=all). When using a special @ event,
    // such as @reboot, the other time fields must be empty.<br>
    Minute: string;
    // The hour(s) at which the command will be executed. (0-23, ranges, or divided,
    // *=all)<br><br>This field is only available when the following conditions are
    // met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually, @monthly,
    // @weekly, @daily, @midnight, @hourly, @every_minute, @every_second ]<br>
    Hour: string;
    // The day(s) of the month on which the command will be executed. (1-31, ranges,
    // or divided, *=all).<br><br>This field is only available when the following
    // conditions are met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually,
    // @monthly, @weekly, @daily, @midnight, @hourly, @every_minute, @every_second
    // ]<br>
    Mday: string;
    // The month(s) of the year in which the command will be executed. (1-31, ranges,
    // or divided, *=all).<br><br>This field is only available when the following
    // conditions are met:<br>- `minute` must not be one of [ @reboot, @yearly, @annually,
    // @monthly, @weekly, @daily, @midnight, @hourly, @every_minute, @every_second
    // ]<br>
    Month: string;
    // The day(s) of the week on which the command will be executed. (0-7, 7=Sun or
    // use names, ranges, or divided, *=all).<br><br>This field is only available
    // when the following conditions are met:<br>- `minute` must not be one of [ @reboot,
    // @yearly, @annually, @monthly, @weekly, @daily, @midnight, @hourly, @every_minute,
    // @every_second ]<br>
    Wday: string;
    // The OS user to use when cron runs the command.<br>
    Who: string;
    // The command to run. Use full file paths for this command and include an command
    // parameters.<br>
    Command: string;
  end;
  PCronJob = ^TCronJob;

  TDHCPServerAddressPool = packed record
    // The starting IP address for this address pool. This address must be less than
    // or equal to the `range_to` field.<br>
    RangeFrom: string;
    // The ending IP address for the this address pool. This address must be greater
    // than or equal to the `range_to` field.<br>
    RangeTo: string;
    // The domain to be assigned via DHCP.<br>
    Domain: string;
    // MAC addresses this DHCP server is allowed to provide leases for.<br>
    MacAllow: TStringDynArray;
    // MAC addresses this DHCP server is not allowed to provide leases for.<br>
    MacDeny: TStringDynArray;
    // The domain search list to provide via DHCP.<br>
    Domainsearchlist: TStringDynArray;
    // The default DHCP lease validity period (in seconds). This is used for clients
    // that do not ask for a specific expiration time.<br>
    Defaultleasetime: integer;
    // The maximum DHCP lease validity period (in seconds) a client can request.<br>
    Maxleasetime: integer;
    // The gateway IPv4 address to provide via DHCP. This is only necessary if you
    // are not using the interface's IP as the gateway. Specify `none` for no gateway
    // assignment.<br>
    Gateway: string;
    // The DNS servers to provide via DHCP. Leave empty to default to system nameservers.<br>
    Dnsserver: TStringDynArray;
    // The WINS servers to provide via DHCP.<br>
    Winsserver: TStringDynArray;
    // The NTP servers to provide via DHCP.<br>
    Ntpserver: TStringDynArray;
    // Force this DHCP server to ignore BOOTP queries.<br>
    Ignorebootp: boolean;
    // Prevent recording a unique identifier (UID) in client lease data if present
    // in the client DHCP request. This option may be useful when a client can dual
    // boot using different client identifiers but the same hardware (MAC) address.
    // Note that the resulting server behavior violates the official DHCP specification.<br>
    Ignoreclientuids: boolean;
    // Define how to handle unknown clients requesting DHCP leases. When set to `null`,
    // any DHCP client will get an IP address within this scope/range on this interface.
    // If set to `enabled`, any DHCP client with a MAC address listed in a static
    // mapping on any scope(s)/interface(s) will get an IP address. If set to `class`,
    // only MAC addresses listed in static mappings on this interface will get an
    // IP address within this scope/range.<br>
    Denyunknown: TEnumPfopenapi47;
  end;
  PDHCPServerAddressPool = ^TDHCPServerAddressPool;

  TDHCPServerApply = packed record
    // Displays `true` if all DHCP server changes are applied and there are no pending
    // changes left.Displays `false` when there are pending DHCP server changes that
    // have not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PDHCPServerApply = ^TDHCPServerApply;

  TDHCPServerBackend = packed record
    // The backend DHCP server service to use. ISC DHCP is deprecate and will be removed
    // in a future version of pfSense.<br>
    Dhcpbackend: TEnumPfopenapi48;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PDHCPServerBackend = ^TDHCPServerBackend;

  TDHCPServerCustomOption = packed record
    // The DHCP option number to configure.<br>
    Number: integer;
    // The type of value to configure for the option.<br>
    _Type: TEnumPfopenapi49;
    // The value to configure for the option.<br>
    Value: string;
  end;
  PDHCPServerCustomOption = ^TDHCPServerCustomOption;

  TDHCPServer = packed record
    // The interface to configure the DHCP server for. This field is only necessary
    // when you wantto change the interface (ID) of an existing DHCP server, or you
    // are replacing all DHCP server objects with a new configuration. Note that specifying
    // an interface in this field will update the ID of the DHCP server to match the
    // interface specified here. Leaving this field empty will retain the existing
    // interface.<br>
    _Interface: string;
    // Enable the DHCP server for this interface.<br>
    Enable: boolean;
    // The starting IP address for the primary DHCP pool. This address must be less
    // than or equal to the `range_to` field.<br>
    RangeFrom: string;
    // The ending IP address for the primary DHCP pool. This address must be greater
    // than or equal to the `range_to` field.<br>
    RangeTo: string;
    // The domain to be assigned via DHCP.<br>
    Domain: string;
    // The interface IP address of the other firewall (failover peer) in this subnet.
    // Leave empty to disable failover peering.<br>
    FailoverPeerip: string;
    // MAC addresses this DHCP server is allowed to provide leases for.<br>
    MacAllow: TStringDynArray;
    // MAC addresses this DHCP server is not allowed to provide leases for.<br>
    MacDeny: TStringDynArray;
    // The domain search list to provide via DHCP.<br>
    Domainsearchlist: TStringDynArray;
    // The default DHCP lease validity period (in seconds). This is used for clients
    // that do not ask for a specific expiration time.<br>
    Defaultleasetime: integer;
    // The maximum DHCP lease validity period (in seconds) a client can request.<br>
    Maxleasetime: integer;
    // The gateway IPv4 address to provide via DHCP. This is only necessary if you
    // are not using the interface's IP as the gateway. Specify `none` for no gateway
    // assignment.<br>
    Gateway: string;
    // The DNS servers to provide via DHCP. Leave empty to default to system nameservers.<br>
    Dnsserver: TStringDynArray;
    // The WINS servers to provide via DHCP.<br>
    Winsserver: TStringDynArray;
    // The NTP servers to provide via DHCP.<br>
    Ntpserver: TStringDynArray;
    // Assign static ARP entries for DHCP leases provided by this server.<br>
    Staticarp: boolean;
    // Force this DHCP server to ignore BOOTP queries.<br>
    Ignorebootp: boolean;
    // Prevent recording a unique identifier (UID) in client lease data if present
    // in the client DHCP request. This option may be useful when a client can dual
    // boot using different client identifiers but the same hardware (MAC) address.
    // Note that the resulting server behavior violates the official DHCP specification.<br>
    Ignoreclientuids: boolean;
    // Ignore denied clients rather than reject. This option is not compatible with
    // failover and cannot be enabled when a Failover Peer IP address is configured.<br>
    Nonak: boolean;
    // Prevent the DHCP server from sending a ping to the address being assigned,
    // where if no response has been heard, it assigns the address.<br>
    Disablepingcheck: boolean;
    // Display the DHCP lease times in local time instead of UTC.<br>
    Dhcpleaseinlocaltime: boolean;
    // Enable adding DHCP lease statistics to the pfSense Monitoring graphs.<br>
    Statsgraph: boolean;
    // Define how to handle unknown clients requesting DHCP leases. When set to `null`,
    // any DHCP client will get an IP address within this scope/range on this interface.
    // If set to `enabled`, any DHCP client with a MAC address listed in a static
    // mapping on any scope(s)/interface(s) will get an IP address. If set to `class`,
    // only MAC addresses listed in static mappings on this interface will get an
    // IP address within this scope/range.<br>
    Denyunknown: TEnumPfopenapi47;
    // Additional address pools applied to this DHCP server.<br>
    Pool: variant;
    // The custom DHCP options to apply to this DHCP server.<br>
    Numberoptions: variant;
    // Static mappings applied to this DHCP server.<br>
    Staticmap: variant;
  end;
  PDHCPServer = ^TDHCPServer;

  TDHCPServerStaticMapping = packed record
    // The MAC address of the client this mapping is for.<br>
    Mac: string;
    // The IP address to assign this client via DHCP.<br>
    Ipaddr: string;
    // The client identifier of the client this mapping is for.<br>
    Cid: string;
    // The hostname to assign this client via DHCP.<br>
    Hostname: string;
    // The domain to be assigned via DHCP.<br>
    Domain: string;
    // The domain search list to provide via DHCP.<br>
    Domainsearchlist: TStringDynArray;
    // The default DHCP lease validity period (in seconds). This is used for clients
    // that do not ask for a specific expiration time.<br>
    Defaultleasetime: integer;
    // The maximum DHCP lease validity period (in seconds) this client can request.<br>
    Maxleasetime: integer;
    // The gateway IPv4 address to provide via DHCP. This is only necessary if you
    // are not using the interface's IP as the gateway. Specify `none` for no gateway
    // assignment.<br>
    Gateway: string;
    // The DNS servers to provide via DHCP. Leave empty to default to system nameservers.<br>
    Dnsserver: TStringDynArray;
    // The WINS servers to provide via DHCP.<br>
    Winsserver: TStringDynArray;
    // The NTP servers to provide via DHCP.<br>
    Ntpserver: TStringDynArray;
    // Assign a static ARP entry for this static mapping.<br>
    ArpTableStaticEntry: boolean;
    // The description of this static mapping.<br>
    Descr: string;
  end;
  PDHCPServerStaticMapping = ^TDHCPServerStaticMapping;

  TDNSForwarderApply = packed record
    // Displays `true` when all DNS Forwarder changes are applied and there are no
    // pending changes left.Displays `false` when there are pending DNS Forwarder
    // changes that have not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PDNSForwarderApply = ^TDNSForwarderApply;

  TDNSForwarderHostOverrideAlias = packed record
    // The hostname of this override alias.<br>
    Host: string;
    // The domain of this override alias.<br>
    Domain: string;
    // The description of this override alias.<br>
    Description: string;
  end;
  PDNSForwarderHostOverrideAlias = ^TDNSForwarderHostOverrideAlias;

  TDNSForwarderHostOverride = packed record
    // The hostname of this override.<br>
    Host: string;
    // The domain of this override.<br>
    Domain: string;
    // The IP address of this override.<br>
    Ip: string;
    // The description for this override.<br>
    Descr: string;
    // The aliases for this override.<br>
    Aliases: variant;
  end;
  PDNSForwarderHostOverride = ^TDNSForwarderHostOverride;

  TDNSResolverAccessList = packed record
    // The name of this access list.<br>
    Name: string;
    // The action to take when an access list match is found.<br>
    Action: TEnumPfopenapi50;
    // A description for this access list.<br>
    Description: string;
    // The DNS Resolver access list network entries to include in this access list.<br>
    Networks: variant;
  end;
  PDNSResolverAccessList = ^TDNSResolverAccessList;

  TDNSResolverAccessListNetwork = packed record
    // The network address of this access list entry.<br>
    Network: string;
    // The subnet mask of this access list entry's network.<br>
    Mask: integer;
    // A description for this access list entry.<br>
    Description: string;
  end;
  PDNSResolverAccessListNetwork = ^TDNSResolverAccessListNetwork;

  TDNSResolverApply = packed record
    // Displays `true` when all DNS Resolver changes are applied and there are no
    // pending changes left.Displays `false` when there are pending DNS Resolver changes
    // that have not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PDNSResolverApply = ^TDNSResolverApply;

  TDNSResolverDomainOverride = packed record
    // The domain to override.<br>
    Domain: string;
    // The IP address to which the domain should resolve.<br>
    Ip: string;
    // The description for this domain override.<br>
    Descr: string;
    // Enables or disables forwarding DNS queries to the upstream DNS server using
    // TLS.<br>
    ForwardTlsUpstream: boolean;
    // The hostname to use for the TLS connection to the upstream DNS server.<br><br>This
    // field is only available when the following conditions are met:<br>- `forward_tls_upstream`
    // must be equal to `true`<br>
    TlsHostname: string;
  end;
  PDNSResolverDomainOverride = ^TDNSResolverDomainOverride;

  TDNSResolverHostOverrideAlias = packed record
    // The hostname portion of the host override alias.<br>
    Host: string;
    // The hostname portion of the host override alias.<br>
    Domain: string;
    // A detailed description for this host override alias.<br>
    Descr: string;
  end;
  PDNSResolverHostOverrideAlias = ^TDNSResolverHostOverrideAlias;

  TDNSResolverHostOverride = packed record
    // The hostname portion of the host override.<br>
    Host: string;
    // The hostname portion of the host override.<br>
    Domain: string;
    // The IP addresses this host override will resolve.<br>
    Ip: TStringDynArray;
    // A detailed description for this host override.<br>
    Descr: string;
    // Additional alias hostnames that should resolve the same IP(s).<br>
    Aliases: variant;
  end;
  PDNSResolverHostOverride = ^TDNSResolverHostOverride;

  TDNSResolverSettings = packed record
    // Enables or disables the DNS Resolver service.<br>
    Enable: boolean;
    // The port on which the DNS Resolver service listens. Valid options are: a TCP/UDP
    // port number<br>
    Port: string;
    // Enables or disables SSL/TLS for the DNS Resolver service.<br>
    Enablessl: boolean;
    // The SSL/TLS certificate to use for the DNS Resolver service.<br><br>This field
    // is only available when the following conditions are met:<br>- `enablessl` must
    // be equal to `true`<br>
    Sslcertref: string;
    // The port on which the DNS Resolver service listens for SSL/TLS connections.
    // Valid options are: a TCP/UDP port number<br><br>This field is only available
    // when the following conditions are met:<br>- `enablessl` must be equal to `true`<br>
    Tlsport: string;
    // The interface on which the DNS Resolver service listens for DNS queries. Set
    // empty value ".
    // "to listen on all interfaces.<br>
    ActiveInterface: TStringDynArray;
    // The interface on which the DNS Resolver service sends outgoing DNS queries.
    // Set empty value ".
    // "to use any interface.<br>
    OutgoingInterface: TStringDynArray;
    // Enables or disables sending recursive queries if none of the selected Outgoing
    // Network ".
    // "Interfaces are available.<br>
    Strictout: boolean;
    // The type of local zone used for the system domain.<br>
    SystemDomainLocalZoneType: TEnumPfopenapi51;
    // Enables or disables DNSSEC validation.<br>
    Dnssec: boolean;
    // Enables or disables the Python module.<br>
    Python: boolean;
    // The order in which the Python module is loaded.<br><br>This field is only available
    // when the following conditions are met:<br>- `python` must be equal to `true`<br>
    PythonOrder: TEnumPfopenapi52;
    // The Python module to utilize.<br><br>This field is only available when the
    // following conditions are met:<br>- `python` must be equal to `true`<br>
    PythonScript: string;
    // Enables or disables DNS Resolver forwarding mode.<br>
    Forwarding: boolean;
    // Enables or disables registering DHCP leases in the DNS Resolver service.<br>
    Regdhcp: boolean;
    // Enables or disables registering static DHCP mappings in the DNS Resolver service.<br>
    Regdhcpstatic: boolean;
    // Enables or disables registering OpenVPN clients in the DNS Resolver service.<br>
    Regovpnclients: boolean;
    // Custom options to add to the DNS Resolver configuration.<br>
    CustomOptions: string;
  end;
  PDNSResolverSettings = ^TDNSResolverSettings;

  THAProxyApply = packed record
    // Indicates whether all HAProxy configuration changes have been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PHAProxyApply = ^THAProxyApply;

  THAProxyBackendACL = packed record
    // The unique name for this backend ACL.<br>
    Name: string;
    // The expression to use to determine the match for this ACL.<br>
    Expression: TEnumPfopenapi53;
    // The value which indicates a match for this ACL.<br>
    Value: string;
    // Enables or disables case-sensitive matching for this ACL.<br>
    Casesensitive: boolean;
    // Enables or disables inverting the context of this ACL.<br>
    _Not: boolean;
  end;
  PHAProxyBackendACL = ^THAProxyBackendACL;

  THAProxyBackendAction = packed record
    // The action to take when an ACL match is found.<br>
    Action: TEnumPfopenapi54;
    // The name of the backend ACL this action is associated with.<br>
    Acl: string;
    // The backend server to use when an ACL match is found.<br><br>This field is
    // only available when the following conditions are met:<br>- `action` must be
    // equal to `'use_server'`<br>
    Server: string;
    // The custom action to take when an ACL match is found.<br><br>This field is
    // only available when the following conditions are met:<br>- `action` must be
    // equal to `'custom'`<br>
    Customaction: string;
    // The deny status to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_deny, http-request_tarpit ]<br>
    DenyStatus: string;
    // The authentication realm to use when an ACL match is found.<br><br>This field
    // is only available when the following conditions are met:<br>- `action` must
    // be equal to `'http-request_auth'`<br>
    Realm: string;
    // The redirect rule to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be equal
    // to `'http-request_redirect'`<br>
    Rule: string;
    // The Lua function to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_lua, http-request_use-service, http-response_lua, tcp-request_content_lua,
    // tcp-request_content_use-service, tcp-response_content_lua ]<br>
    LuaFunction: string;
    // The name to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-request_add-header,
    // http-request_set-header, http-request_del-header, http-request_replace-header,
    // http-request_replace-value, http-response_add-header, http-response_set-header,
    // http-response_del-header, http-response_replace-header, http-response_replace-value,
    // http-after-response_add-header, http-after-response_set-header, http-after-response_del-header,
    // http-after-response_replace-header, http-after-response_replace-value ]<br>
    Name: string;
    // The fmt value to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_add-header, http-request_set-header, http-request_set-method,
    // http-request_set-path, http-request_set-query, http-request_set-uri, http-response_add-header,
    // http-response_set-header, http-after-response_add-header, http-after-response_set-header
    // ]<br>
    Fmt: string;
    // The value to find when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-request_replace-header,
    // http-request_replace-value, http-response_replace-header, http-request_replace-path,
    // http-response_replace-value, http-after-response_replace-header, http-after-response_replace-value
    // ]<br>
    Find: string;
    // The value to replace with when an ACL match is found.<br><br>This field is
    // only available when the following conditions are met:<br>- `action` must be
    // one of [ http-request_replace-header, http-request_replace-value, http-request_replace-path,
    // http-response_replace-header, http-response_replace-value, http-after-response_replace-header,
    // http-after-response_replace-value ]<br>
    Replace: string;
    // The path to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be equal to `'http-request_replace-path'`<br>
    Path: string;
    // The status to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-response_set-status,
    // http-after-response_set-status ]<br>
    Status: string;
    // The status reason to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-response_set-status, http-after-response_set-status ]<br>
    Reason: string;
  end;
  PHAProxyBackendAction = ^THAProxyBackendAction;

  THAProxyBackend = packed record
    // The unique name for this backend.<br>
    Name: string;
    // The pool of servers this backend will use.<br>
    Servers: variant;
    // The load balancing option to use for servers assigned to this backend.<br>
    Balance: TEnumPfopenapi55;
    // The number of URI characters the algorithm should consider when hashing.<br><br>This
    // field is only available when the following conditions are met:<br>- `balance`
    // must be equal to `'uri'`<br>
    BalanceUrilen: integer;
    // The maximum directory depth to be used to compute the hash. One level is counted
    // for each slash in the request.<br><br>This field is only available when the
    // following conditions are met:<br>- `balance` must be equal to `'uri'`<br>
    BalanceUridepth: integer;
    // Enables or disables allowing the use of whole URIs, including URL parameters.<br><br>This
    // field is only available when the following conditions are met:<br>- `balance`
    // must be equal to `'uri'`<br>
    BalanceUriwhole: boolean;
    // The ACLs to apply to this backend.<br>
    Acls: variant;
    // The actions to apply to this backend.<br>
    Actions: variant;
    // The amount of time (in milliseconds) to wait before giving up on connections.<br>
    ConnectionTimeout: integer;
    // The amount of time (in milliseconds) to wait for data transferred to or from
    // the server.<br>
    ServerTimeout: integer;
    // The number of retry attempts to allow after a connection failure to the server.<br>
    Retries: integer;
    // The health check method to use when checking the health of backend servers.<br>
    CheckType: TEnumPfopenapi56;
    // The interval (in milliseconds) in which health checks will be performed.<br><br>This
    // field is only available when the following conditions are met:<br>- `check_type`
    // must not be equal to `'none'`<br>
    Checkinter: integer;
    // Enables or disables logging changes to the health check status<br><br>This
    // field is only available when the following conditions are met:<br>- `check_type`
    // must not be equal to `'none'`<br>
    LogHealthChecks: boolean;
    // The HTTP method to use for HTTP health checks.<br><br>This field is only available
    // when the following conditions are met:<br>- `check_type` must be equal to `'HTTP'`<br>
    HttpcheckMethod: TEnumPfopenapi57;
    // The URL to use for HTTP health checks.<br><br>This field is only available
    // when the following conditions are met:<br>- `check_type` must be equal to `'HTTP'`<br>
    MonitorUri: string;
    // The HTTP version to use for HTTP health checks.<br><br>This field is only available
    // when the following conditions are met:<br>- `check_type` must be equal to `'HTTP'`<br>
    MonitorHttpversion: string;
    // The username to use for MySQL or PostgreSQL health checks.<br><br>This field
    // is only available when the following conditions are met:<br>- `check_type`
    // must be one of [ MySQL, PostgreSQL ]<br>
    MonitorUsername: string;
    // The domain to use for SMTP or ESMTP health checks.<br><br>This field is only
    // available when the following conditions are met:<br>- `check_type` must be
    // one of [ SMTP, ESMTP ]<br>
    MonitorDomain: string;
    // Enables or disables using a TCP connection to read an ASCII string of the form.<br>
    AgentChecks: boolean;
    // Valid options are: a TCP/UDP port number<br><br>This field is only available
    // when the following conditions are met:<br>- `agent_checks` must be equal to
    // `true`<br>
    AgentPort: string;
    // The interval (in milliseconds) between agent checks.<br><br>This field is only
    // available when the following conditions are met:<br>- `agent_checks` must be
    // equal to `true`<br>
    AgentInter: integer;
    // Enables or disables cookie based persistence.<br>
    PersistCookieEnabled: boolean;
    // The string name to track in Set-Cookie and Cookie HTTP headers.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    PersistCookieName: string;
    // The mode HAProxy uses to insert/prefix/replace or examine cookie and set-cookie
    // headers.<br><br>This field is only available when the following conditions
    // are met:<br>- `persist_cookie_enabled` must be equal to `true`<br>
    PersistCookieMode: TEnumPfopenapi58;
    // Enables or disables allowing shared caches to cache the server response.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    PersistCookieCachable: boolean;
    // Enables or disables only inserting cookies on POST requests.<br><br>This field
    // is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    PersistCookiePostonly: boolean;
    // Enables or disables preventing the use of cookies with non-HTTP components.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    PersistCookieHttponly: boolean;
    // Enables or disables prevention of cookie usage over non-secure channels.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    PersistCookieSecure: boolean;
    // The max-idle time to allow. This option only applies to insert mode cookies.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    HaproxyCookieMaxidle: integer;
    // The max-life time to allow. This option only applies to insert mode cookies.<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_cookie_enabled`
    // must be equal to `true`<br>
    HaproxyCookieMaxlife: integer;
    // The domains to set the cookies for.<br><br>This field is only available when
    // the following conditions are met:<br>- `persist_cookie_enabled` must be equal
    // to `true`<br>
    HaproxyCookieDomains: TStringDynArray;
    // The dynamic cookie secret key. This is will be used to generate dynamic cookies
    // for this backend.<br><br>This field is only available when the following conditions
    // are met:<br>- `persist_cookie_enabled` must be equal to `true`<br>
    HaproxyCookieDynamicCookieKey: string;
    // The sticky table mode to use for this backend. These options are used to make
    // sure subsequent requests from a single client go to the same backend.<br>
    PersistStickyType: TEnumPfopenapi59;
    // The maximum duration of an entry in the stick-table since it was last created,
    // refreshed or matched.<br><br>This field is only available when the following
    // conditions are met:<br>- `persist_sticky_type` must not be equal to `'none'`<br>
    PersistStickExpire: string;
    // The maximum number of entries allowed in the table. This value directly impacts
    // memory usage.<br><br>This field is only available when the following conditions
    // are met:<br>- `persist_sticky_type` must not be equal to `'none'`<br>
    PersistStickTablesize: string;
    // The cookie name to use for stick table.<br><br>This field is only available
    // when the following conditions are met:<br>- `persist_sticky_type` must be one
    // of [ stick_cookie_value, stick_rdp_cookie ]<br>
    PersistStickCookiename: string;
    // The maximum number of characters allowed in a string type stick table<br><br>This
    // field is only available when the following conditions are met:<br>- `persist_sticky_type`
    // must be one of [ stick_cookie_value, stick_rdp_cookie ]<br>
    PersistStickLength: integer;
    // The maximum log level to send emails for. Leave empty to disable sending email
    // alerts. If left empty, the value set in the global settings will be used.<br>
    EmailLevel: TEnumPfopenapi60;
    // The email address to send emails to. If left empty, the value set in the global
    // settings will be used.<br>
    EmailTo: string;
    // Enables or disables the HAProxy statistics page for this backend.<br>
    StatsEnabled: boolean;
    // The statistics URL for this backend.<br><br>This field is only available when
    // the following conditions are met:<br>- `stats_enabled` must be equal to `true`<br>
    StatsUri: string;
    // The frontends and backends stats to be shown, leave empty to show all.<br><br>This
    // field is only available when the following conditions are met:<br>- `stats_enabled`
    // must be equal to `true`<br>
    StatsScope: TStringDynArray;
    // The realm that is shown when authentication is requested by HAProxy.<br><br>This
    // field is only available when the following conditions are met:<br>- `stats_enabled`
    // must be equal to `true`<br>
    StatsRealm: string;
    // The stats page username<br><br>This field is only available when the following
    // conditions are met:<br>- `stats_enabled` must be equal to `true`<br>
    StatsUsername: string;
    // The stats page password.<br><br>This field is only available when the following
    // conditions are met:<br>- `stats_enabled` must be equal to `true`<br>
    StatsPassword: string;
    // The admin to make use of the options disable/enable/softstop/softstart/killsessions
    // from the stats page.<br><br>This field is only available when the following
    // conditions are met:<br>- `stats_enabled` must be equal to `true`<br>
    StatsAdmin: string;
    // The short name displayed in stats and helps differentiate which server in the
    // cluster is actually serving clients.<br><br>This field is only available when
    // the following conditions are met:<br>- `stats_enabled` must be equal to `true`<br>
    StatsNode: string;
    // The verbose description for this node.<br><br>This field is only available
    // when the following conditions are met:<br>- `stats_enabled` must be equal to
    // `true`<br>
    StatsDesc: string;
    // The interval (in seconds) in which the stats page is refreshed.<br><br>This
    // field is only available when the following conditions are met:<br>- `stats_enabled`
    // must be equal to `true`<br>
    StatsRefresh: integer;
    // The HSTS validity period for this backend. Leave empty to disable HSTS.<br>
    StrictTransportSecurity: integer;
    // The HAProxy error file mappings to use for this backend.<br>
    Errorfiles: variant;
    // Enables or disables assigning the secure attributes on cookies for this backend.<br>
    CookieAttributeSecure: boolean;
    // The per server pass thru to apply to each server line.<br>
    Advanced: string;
    // The backend pass thru to apply to the backend section.<br>
    AdvancedBackend: string;
    // Enables or disables using the client-IP to connect to backend servers.<br>
    TransparentClientip: boolean;
    // The interface that will connect to the backend server.<br><br>This field is
    // only available when the following conditions are met:<br>- `transparent_clientip`
    // must be equal to `true`<br>
    TransparentInterface: string;
  end;
  PHAProxyBackend = ^THAProxyBackend;

  THAProxyBackendErrorFile = packed record
    // The HTTP status code that will trigger this error file to be used.<br>
    Errorcode: integer;
    // The HAProxy error file object that should be used for the assigned HTTP status
    // code.<br>
    Errorfile: string;
  end;
  PHAProxyBackendErrorFile = ^THAProxyBackendErrorFile;

  THAProxyBackendServer = packed record
    // The unique name for this backend server.<br>
    Name: string;
    // The eligibility status for this backend server.<br>
    Status: TEnumPfopenapi61;
    // The hostname or IP address of this backend server. Hostname values are only
    // resolved at service startup.<br>
    Address: string;
    // The port to forward to for this backend server. Valid options are: a TCP/UDP
    // port number<br>
    Port: string;
    // The weight of this backend server when load balancing.<br>
    Weight: integer;
    // Enables or disables using SSL/TLS when forwarding to this backend server.<br>
    Ssl: boolean;
    // Enables or disables verifying the SSL/TLS certificate when forwarding to this
    // backend server.<br>
    Sslserververify: boolean;
    // The unique ID for this backend server. This value is set by the system for
    // internal use and cannot be changed.<br>
    Serverid: integer;
  end;
  PHAProxyBackendServer = ^THAProxyBackendServer;

  THAProxyFile = packed record
    // The unique name for this file.<br>
    Name: string;
    // The type of file. Use `null` to assume an Errorfile.<br>
    _Type: TEnumPfopenapi62;
    // The content of this file.<br>
    Content: string;
  end;
  PHAProxyFile = ^THAProxyFile;

  THAProxyFrontendACL = packed record
    // The unique name for this frontend ACL.<br>
    Name: string;
    // The expression to use to determine the match for this ACL.<br>
    Expression: TEnumPfopenapi53;
    // The value which indicates a match for this ACL.<br>
    Value: string;
    // Enables or disables case-sensitive matching for this ACL.<br>
    Casesensitive: boolean;
    // Enables or disables inverting the context of this ACL.<br>
    _Not: boolean;
  end;
  PHAProxyFrontendACL = ^THAProxyFrontendACL;

  THAProxyFrontendAction = packed record
    // The action to take when an ACL match is found.<br>
    Action: TEnumPfopenapi63;
    // The name of the frontend ACL this action is associated with.<br>
    Acl: string;
    // The backend to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be equal to `'use_backend'`<br>
    Backend: string;
    // The custom action to take when an ACL match is found.<br><br>This field is
    // only available when the following conditions are met:<br>- `action` must be
    // equal to `'custom'`<br>
    Customaction: string;
    // The deny status to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_deny, http-request_tarpit ]<br>
    DenyStatus: string;
    // The authentication realm to use when an ACL match is found.<br><br>This field
    // is only available when the following conditions are met:<br>- `action` must
    // be equal to `'http-request_auth'`<br>
    Realm: string;
    // The redirect rule to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be equal
    // to `'http-request_redirect'`<br>
    Rule: string;
    // The Lua function to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_lua, http-request_use-service, http-response_lua, tcp-request_content_lua,
    // tcp-request_content_use-service, tcp-response_content_lua ]<br>
    LuaFunction: string;
    // The name to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-request_add-header,
    // http-request_set-header, http-request_del-header, http-request_replace-header,
    // http-request_replace-value, http-response_add-header, http-response_set-header,
    // http-response_del-header, http-response_replace-header, http-response_replace-value,
    // http-after-response_add-header, http-after-response_set-header, http-after-response_del-header,
    // http-after-response_replace-header, http-after-response_replace-value ]<br>
    Name: string;
    // The fmt value to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-request_add-header, http-request_set-header, http-request_set-method,
    // http-request_set-path, http-request_set-query, http-request_set-uri, http-response_add-header,
    // http-response_set-header, http-after-response_add-header, http-after-response_set-header
    // ]<br>
    Fmt: string;
    // The value to find when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-request_replace-header,
    // http-request_replace-value, http-response_replace-header, http-request_replace-path,
    // http-response_replace-value, http-after-response_replace-header, http-after-response_replace-value
    // ]<br>
    Find: string;
    // The value to replace with when an ACL match is found.<br><br>This field is
    // only available when the following conditions are met:<br>- `action` must be
    // one of [ http-request_replace-header, http-request_replace-value, http-request_replace-path,
    // http-response_replace-header, http-response_replace-value, http-after-response_replace-header,
    // http-after-response_replace-value ]<br>
    Replace: string;
    // The path to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be equal to `'http-request_replace-path'`<br>
    Path: string;
    // The status to use when an ACL match is found.<br><br>This field is only available
    // when the following conditions are met:<br>- `action` must be one of [ http-response_set-status,
    // http-after-response_set-status ]<br>
    Status: string;
    // The status reason to use when an ACL match is found.<br><br>This field is only
    // available when the following conditions are met:<br>- `action` must be one
    // of [ http-response_set-status, http-after-response_set-status ]<br>
    Reason: string;
  end;
  PHAProxyFrontendAction = ^THAProxyFrontendAction;

  THAProxyFrontendAddress = packed record
    // The external address to use.<br>
    Extaddr: TEnumPfopenapi64;
    // The custom IPv4 or IPv6 address to use as the external address.<br><br>This
    // field is only available when the following conditions are met:<br>- `extaddr`
    // must be equal to `'custom'`<br>
    ExtaddrCustom: string;
    // The port to bind to for this address. Valid options are: a TCP/UDP port number<br>
    ExtaddrPort: string;
    // Enables or disables using SSL/TLS for this address.<br>
    ExtaddrSsl: boolean;
    // The advanced configuration to apply to this address.<br>
    ExaddrAdvanced: string;
  end;
  PHAProxyFrontendAddress = ^THAProxyFrontendAddress;

  THAProxyFrontend = packed record
    // The unique name for this HAProxy frontend.<br>
    Name: string;
    // The description for this HAProxy frontend.<br>
    Descr: string;
    // The activation status for this HAProxy frontend.<br>
    Status: TEnumPfopenapi33;
    // The external addresses assigned to this frontend.<br>
    AExtaddr: variant;
    // The maximum number of connections allowed by this frontend.<br>
    MaxConnections: integer;
    // The processing type for this frontend.<br>
    _Type: TEnumPfopenapi65;
    // The ACLs to apply to this frontend.<br>
    HaAcls: variant;
    // The actions to take when an ACL match is found.<br>
    AActionitems: variant;
    // The default backend to use for this frontend.<br>
    BackendServerpool: string;
    // Enables or disables collecting and providing separate statistics for each socket.<br>
    SocketStats: boolean;
    // Enables or disables logging connections with no data transferred.<br>
    Dontlognull: boolean;
    // Enables or disables only logging anomalous (not normal) connection.<br>
    DontlogNormal: boolean;
    // Enables or disables changing the log level from info to err on potentially
    // interesting info.<br>
    LogSeparateErrors: boolean;
    // Enables or disables more detailed logging.<br>
    LogDetailed: boolean;
    // The custom error files to use for this frontend.<br>
    AErrorfiles: variant;
    // The amount of time (in milliseconds) to wait for data from the client.<br>
    ClientTimeout: integer;
    // Enables or disables the HTTP X-Forwarded-For header which contains the client's
    // IP address.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'http'`<br>
    Forwardfor: boolean;
    // The `httpclose` option this frontend will operate.<br>
    Httpclose: TEnumPfopenapi66;
    // Custom value to pass behind each bind option.<br>
    AdvancedBind: string;
    // Custom configuration to pass to this frontend.<br>
    Advanced: string;
  end;
  PHAProxyFrontend = ^THAProxyFrontend;

  THAProxyFrontendErrorFile = packed record
    // The HTTP status code that will trigger this error file to be used.<br>
    Errorcode: integer;
    // The HAProxy error file object that should be used for the assigned HTTP status
    // code.<br>
    Errorfile: string;
  end;
  PHAProxyFrontendErrorFile = ^THAProxyFrontendErrorFile;

  THAProxyDNSResolver = packed record
    // The descriptive name for this DNS server.<br>
    Name: string;
    // The IP or hostname of the DNS server.<br>
    Server: string;
    // The port used by this DNS server. Valid options are: a TCP/UDP port number<br>
    Port: string;
  end;
  PHAProxyDNSResolver = ^THAProxyDNSResolver;

  THAProxyEmailMailer = packed record
    // The descriptive name for this mail server.<br>
    Name: string;
    // The IP or hostname of the mail server.<br>
    Mailserver: string;
    // The port used by this mail server. Valid options are: a TCP/UDP port number<br>
    Mailserverport: string;
  end;
  PHAProxyEmailMailer = ^THAProxyEmailMailer;

  THAProxySettings = packed record
    // Enables or disable HAProxy on the system.<br>
    Enable: boolean;
    // The maximum per-process number of concurrent connections<br>
    Maxconn: integer;
    // The number of threads to start per process. This setting is experimental.<br>
    Nbthread: integer;
    // Enables or disables an immediate stop of old process on reload. (closes existing
    // connections)<br>
    TerminateOnReload: boolean;
    // The maximum time allowed to perform a clean soft-stop. This can be represented
    // as different time values such as 30s, 15m, 3h or 1d.<br>
    HardStopAfter: string;
    // The CARP interface IP to monitor. HAProxy will only run on the firewall whose
    // interface is MASTER.<br>
    Carpdev: string;
    // The internal port to be used for the stats tab. Set to null to disable local
    // stats. Valid options are: a TCP/UDP port number<br>
    Localstatsport: string;
    // The internal (in seconds) in which local stats will be refreshed.<br>
    LocalstatsRefreshtime: integer;
    // The internal (in seconds) in which the sticktable stats will be refreshed.<br>
    LocalstatsSticktableRefreshtime: integer;
    // The IP address or hostname of the remote syslog server to send logs to. Use
    // `/var/run/log` to to log to the local pfSense system log.<br>
    Remotesyslog: string;
    // The logging facility to log to.<br>
    Logfacility: TEnumPfopenapi67;
    // The log level to begin logging events. Only events of this level or higher
    // will be logged.<br>
    Loglevel: TEnumPfopenapi68;
    // The hostname field to include in the syslog header. Leave empty to use the
    // system hostname.<br>
    LogSendHostname: string;
    // The DNS resolvers HAProxy will use for DNS queries.<br>
    DnsResolvers: variant;
    // The number of queries to send to resolve a server name before giving up.<br>
    ResolverRetries: integer;
    // The time between two DNS queries, when no response have been received.<br>
    ResolverTimeoutretry: string;
    // The interval between two successive name resolution when the last answer was
    // valid.<br>
    ResolverHoldvalid: string;
    // The email servers HAProxy will use to send SMTP alerts.<br>
    EmailMailers: variant;
    // The maximum log level to send emails for. Leave empty to disable sending email
    // alerts.<br>
    EmailLevel: TEnumPfopenapi69;
    // The hostname to use as the origin of the email.<br>
    EmailMyhostname: string;
    // The email address to be used as the sender of the emails.<br>
    EmailFrom: string;
    // The email address to send emails to.<br>
    EmailTo: string;
    // The SSL/TLS compatibility mode which determines the cipher suites and TLS versions
    // supported.<br>
    Sslcompatibilitymode: TEnumPfopenapi70;
    // The maximum size of the Diffie-Hellman parameters used for generating the ephemeral/temporary
    // Diffie-Hellman key in case of DHE key exchange<br>
    Ssldefaultdhparam: integer;
    // Additional HAProxy options to include in the global settings area.<br>
    Advanced: string;
    // Enables or disables including HAProxy configurations in HA sync if configured.<br>
    Enablesync: boolean;
  end;
  PHAProxySettings = ^THAProxySettings;

  TNTPSettings = packed record
    // Enables or disabled the NTP server.<br>
    Enable: boolean;
    // The interfaces the NTP server will listen on.<br>
    _Interface: TStringDynArray;
    // The maximum number of candidate peers in the NTP pool.<br>
    Ntpmaxpeers: integer;
    // The orphan mode stratum to set. Orphan mode allows the system clock to be used
    // when no other clocks are available. The number here specifies the stratum reported
    // during orphan mode and should normally be set to a number high enough to ensure
    // that any other servers available to clients are preferred over this server<br>
    Orphan: integer;
    // The minimum poll interval for NTP messages. Use empty string to assume system
    // default, and `omit` to not set this value.<br>
    Ntpminpoll: TEnumPfopenapi71;
    // The maximum poll interval for NTP messages. Use empty string to assume system
    // default, and `omit` to not set this value. This value must be greater than
    // the `ntpminpoll`.<br>
    Ntpmaxpoll: TEnumPfopenapi71;
    // The IP protocol peers are forced to use for DNS resolution.<br>
    Dnsresolv: TEnumPfopenapi72;
    // Enable or disable logging peer messages.<br>
    Logpeer: boolean;
    // Enable or disable logging system messages.<br>
    Logsys: boolean;
    // Enable or disable logging reference clock statistics.<br>
    Clockstats: boolean;
    // Enable or disable logging clock discipline statistics.<br>
    Loopstats: boolean;
    // Enable or disable logging peer statistics.<br>
    Peerstats: boolean;
    // Enable or disable RRD graphs for NTP statistics.<br>
    Statsgraph: boolean;
    // The Leap second configuration as text.<br>
    Leapsec: string;
    // Enable or disable NTPv3 server authentication. (RFC 1305)<br>
    Serverauth: boolean;
    // The NTP server authentication key.<br><br>This field is only available when
    // the following conditions are met:<br>- `serverauth` must be equal to `true`<br>
    Serverauthkey: string;
    // The digest algorithm for the server authentication key.<br>
    Serverauthalgo: TEnumPfopenapi73;
  end;
  PNTPSettings = ^TNTPSettings;

  TNTPTimeServer = packed record
    // The IP or hostname of the remote NTP time server, pool or peer.<br>
    Timeserver: string;
    // The type of this timeserver. Use `server` is `timeserver` is a standalone NTP
    // server, use `pool` if `timeserver` represents an NTP pool, or `peer` if `timeserver`
    // is an NTP peer. Note: If the `timeserver` value ends with the `pool.ntp.org`
    // suffix, this field will be forced to use `pool`.<br>
    _Type: TEnumPfopenapi74;
    // Enable NTP favoring the use of this server more than all others.<br>
    Prefer: boolean;
    // Prevent NTP from using this timeserver, but continue collecting stats.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must not be equal to `'pool'`<br>
    Noselect: boolean;
  end;
  PNTPTimeServer = ^TNTPTimeServer;

  TSSH = packed record
    // Enable the SSH server on this system.<br>
    Enable: boolean;
    // The TCP port the SSH server will listen on. Valid options are: a TCP/UDP port
    // number<br>
    Port: string;
    // The SSH authentication mode to use. Use `enabled` to require public key authentication,
    // use both to require both a public key AND a password, or use `null` to allow
    // a password OR a public key.<br>
    Sshdkeyonly: TEnumPfopenapi75;
    // Enable support for ssh-agent forwarding.<br>
    Sshdagentforwarding: boolean;
  end;
  PSSH = ^TSSH;

  TServiceWatchdog = packed record
    // The name of the service to be watched.<br>
    Name: string;
    // The description for the service being watched.<br>
    Description: string;
    // Enable or disable notifications being sent when Service Watchdogs finds this
    // service stopped.<br>
    Notify: boolean;
    // Indicates if this Service Watchdog is enabled or disabled. This value is unused.<br>
    Enabled: boolean;
  end;
  PServiceWatchdog = ^TServiceWatchdog;

  TWakeOnLANSend = packed record
    // The interface the host to be woken up is connected to.<br>
    _Interface: string;
    // The MAC address of the host to be awoken.<br>
    MacAddr: string;
  end;
  PWakeOnLANSend = ^TWakeOnLANSend;

  TCARP = packed record
    // Enables or disables CARP on this system.<br>
    Enable: boolean;
    // Enables or disables CARP maintenance mode on this system.<br>
    MaintenanceMode: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PCARP = ^TCARP;

  TDHCPServerLease = packed record
    // The IP address of the lease.<br>
    Ip: string;
    // The MAC address of the lease.<br>
    Mac: string;
    // The hostname of the lease.<br>
    Hostname: string;
    // The interface the lease was registered on.<br>
    _If: string;
    // The start time of the lease.<br>
    Starts: string;
    // The end time of the lease.<br>
    Ends: string;
    // The active status of the lease.<br>
    ActiveStatus: string;
    // The online status of the lease.<br>
    OnlineStatus: string;
    // The description of the lease.<br>
    Descr: string;
  end;
  PDHCPServerLease = ^TDHCPServerLease;

  TRoutingGatewayStatus = packed record
    // The name of the gateway this status corresponds to.<br>
    Name: string;
    // The current source IP being used to send monitoring probes to this gateway.<br>
    Srcip: string;
    // The current IP being monitored for this gateway.<br>
    Monitorip: string;
    // The current latency (in milliseconds) for this gateway.<br>
    Delay: single;
    // The standard deviation in latency (in milliseconds) for this gateway.<br>
    Stddev: single;
    // The current amount of packet loss (in percentage) for this gateway. This uses
    // a whole percentage (0.0-100.0).<br>
    Loss: single;
    // The current status of this gateway. Typically, this will indicate if the gateway
    // is consider online or offline.<br>
    Status: string;
    // The current sub-status of this gateway. Typically, this provide details into
    // problems this gateway is seeing such as latency or packet loss.<br>
    Substatus: string;
  end;
  PRoutingGatewayStatus = ^TRoutingGatewayStatus;

  TIPsecChildSAStatus = packed record
    // The name of the connection ID for the child SA.<br>
    Name: string;
    // The unique ID of the child SA.<br>
    Uniqueid: integer;
    // The request ID of the child SA.<br>
    Reqid: integer;
    // The current state of the child SA.<br>
    State: string;
    // The mode of the child SA.<br>
    Mode: string;
    // The protocol of the child SA.<br>
    Protocol: string;
    // Whether encapsulation is used for the child SA.<br>
    Encap: boolean;
    // The incoming SPI of the child SA.<br>
    SpiIn: string;
    // The outgoing SPI of the child SA.<br>
    SpiOut: string;
    // The encryption algorithm used by the child SA.<br>
    EncrAlg: string;
    // The encryption key size used by the child SA.<br>
    EncrKeysize: integer;
    // The integrity algorithm used by the child SA.<br>
    IntegAlg: string;
    // The Diffie-Hellman group used by the child SA.<br>
    DhGroup: string;
    // The number of bytes received by the child SA.<br>
    BytesIn: integer;
    // The number of bytes sent by the child SA.<br>
    BytesOut: integer;
    // The number of packets received by the child SA.<br>
    PacketsIn: integer;
    // The number of packets sent by the child SA.<br>
    PacketsOut: integer;
    // The number of times the child SA has been used to receive data.<br>
    UseIn: integer;
    // The number of times the child SA has been used to send data.<br>
    UseOut: integer;
    // The time at which the child SA will be rekeyed.<br>
    RekeyTime: integer;
    // The time at which the child SA will expire.<br>
    LifeTime: integer;
    // The time at which the child SA was installed.<br>
    InstallTime: integer;
    // The local traffic selector of the child SA.<br>
    LocalTs: TStringDynArray;
    // The remote traffic selector of the child SA.<br>
    RemoteTs: TStringDynArray;
  end;
  PIPsecChildSAStatus = ^TIPsecChildSAStatus;

  TIPsecSAStatus = packed record
    // The connection ID of the tunnel.<br>
    ConId: string;
    // The unique ID of the tunnel.<br>
    Uniqueid: integer;
    // The IKE version used by the tunnel.<br>
    Version: integer;
    // The current state of the tunnel.<br>
    State: string;
    // The local host for the tunnel.<br>
    LocalHost: string;
    // The local port for the tunnel. Valid options are: a TCP/UDP port number<br>
    LocalPort: string;
    // The local ID for the tunnel.<br>
    LocalId: string;
    // The remote host for the tunnel.<br>
    RemoteHost: string;
    // The remote port for the tunnel. Valid options are: a TCP/UDP port number<br>
    RemotePort: string;
    // The remote ID for the tunnel.<br>
    RemoteId: string;
    // The initiator SPI for the tunnel.<br>
    InitiatorSpi: string;
    // The responder SPI for the tunnel.<br>
    ResponderSpi: string;
    // Whether the remote host is behind NAT.<br>
    NatRemote: boolean;
    // Whether the remote host is behind any NAT.<br>
    NatAny: boolean;
    // The encryption algorithm used by the tunnel.<br>
    EncrAlg: string;
    // The encryption key size used by the tunnel.<br>
    EncrKeysize: integer;
    // The integrity algorithm used by the tunnel.<br>
    IntegAlg: string;
    // The pseudo-random function algorithm used by the tunnel.<br>
    PrfAlg: string;
    // The Diffie-Hellman group used by the tunnel.<br>
    DhGroup: string;
    // The amount of time the tunnel has been established.<br>
    Established: integer;
    // The amount of time until the tunnel rekeys.<br>
    RekeyTime: integer;
    // The child SAs of the tunnel.<br>
    ChildSas: variant;
  end;
  PIPsecSAStatus = ^TIPsecSAStatus;

  TInterfaceStats = packed record
    // The name of the interface.<br>
    Name: string;
    // The description of the interface.<br>
    Descr: string;
    // The hardware interface name of the interface.<br>
    Hwif: string;
    // The MAC address of the interface.<br>
    Macaddr: string;
    // The MTU of the interface.<br>
    Mtu: string;
    // Whether the interface is enabled.<br>
    Enable: boolean;
    // The status of the interface.<br>
    Status: string;
    // The IPv4 address of the interface.<br>
    Ipaddr: string;
    // The IPv4 subnet of the interface.<br>
    Subnet: string;
    // The IPv6 link-local address of the interface.<br>
    Linklocal: string;
    // The IPv6 address of the interface.<br>
    Ipaddrv6: string;
    // The IPv6 subnet of the interface.<br>
    Subnetv6: string;
    // The number of inbound errors on the interface.<br>
    Inerrs: integer;
    // The number of outbound errors on the interface.<br>
    Outerrs: integer;
    // The number of collisions on the interface.<br>
    Collisions: integer;
    // The number of inbound bytes on the interface.<br>
    Inbytes: integer;
    // The number of inbound bytes passed on the interface.<br>
    Inbytespass: integer;
    // The number of outbound bytes on the interface.<br>
    Outbytes: integer;
    // The number of outbound bytes passed on the interface.<br>
    Outbytespass: integer;
    // The number of inbound packets on the interface.<br>
    Inpkts: integer;
    // The number of inbound packets passed on the interface.<br>
    Inpktspass: integer;
    // The number of outbound packets on the interface.<br>
    Outpkts: integer;
    // The number of outbound packets passed on the interface.<br>
    Outpktspass: integer;
    // The DHCP link status of the interface.<br>
    Dhcplink: string;
    // The speed/duplex of the interface.<br>
    Media: string;
    // The IPv4 gateway of the interface.<br>
    Gateway: string;
    // The IPv6 gateway of the interface.<br>
    Gatewayv6: string;
  end;
  PInterfaceStats = ^TInterfaceStats;

  TDHCPLog = packed record
    // The raw text of the DHCP log entry.<br>
    Text: string;
  end;
  PDHCPLog = ^TDHCPLog;

  TFirewallLog = packed record
    // The raw text of the firewall log entry.<br>
    Text: string;
  end;
  PFirewallLog = ^TFirewallLog;

  TLogSettings = packed record
    // The format of the log entries.<br>
    Format: TEnumPfopenapi76;
    // Reverse the order of log entries.<br>
    Reverseorder: boolean;
    // The number of log entries to display in the UI.<br>
    Nentries: integer;
    // Do not log packets that are blocked by the implicit default block rule.<br>
    Nologdefaultblock: boolean;
    // Do not log packets that are allowed by the implicit default pass rule.<br>
    Nologdefaultpass: boolean;
    // Log packets blocked by Block Bogon Networks rules.<br>
    Nologbogons: boolean;
    // Log packets blocked by Block Private Networks rules.<br>
    Nologprivatenets: boolean;
    // Do not Log errors from the web server process.<br>
    Nolognginx: boolean;
    // Display logs in the UI as they are generated by the packet filter, without
    // any formatting.<br>
    Rawfilter: boolean;
    // Disable writing log entries to the local disk. WARNING: This will also disable
    // Login Protection!<br>
    Disablelocallogging: boolean;
    // Log changes made to the pfSense configuration.<br>
    Logconfigchanges: boolean;
    // Display filter descriptions in the log entries Use `0` to not load descriptions,
    // `1` to display descriptions in their own column, or `2` to display the description
    // in a second row.<br>
    Filterdescriptions: integer;
    // The maximum size of the log file in kilobytes.<br>
    Logfilesize: integer;
    // The number of log file rotations to keep.<br>
    Rotatecount: integer;
    // The type of compression to use for log files.<br>
    Logcompressiontype: TEnumPfopenapi77;
    // Enable remote logging.<br>
    Enableremotelogging: boolean;
    // The IP protocol to use for remote logging.<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>
    Ipprotocol: TEnumPfopenapi78;
    // The interface to use as the source IP address for remote logging.<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>
    Sourceip: string;
    // The first remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>
    Remoteserver: string;
    // The second remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `remoteserver` must not be equal to `NULL`<br>
    Remoteserver2: string;
    // The third remote syslog server to send log entries to.<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `remoteserver` must not be equal to `NULL`<br>-
    // `remoteserver2` must not be equal to `NULL`<br>
    Remoteserver3: string;
    // Log everything to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>
    Logall: boolean;
    // Log filter events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Filter: boolean;
    // Log DHCP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Dhcp: boolean;
    // Log authentication events to the remote syslog server(s).<br><br>This field
    // is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Auth: boolean;
    // Log captive portal authentication events to the remote syslog server(s).<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Portalauth: boolean;
    // Log VPN events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Vpn: boolean;
    // Log gateway monitoring events to the remote syslog server(s).<br><br>This field
    // is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Dpinger: boolean;
    // Log wireless authentication events to the remote syslog server(s).<br><br>This
    // field is only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Hostapd: boolean;
    // Log system events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    System: boolean;
    // Log DNS resolver events to the remote syslog server(s).<br><br>This field is
    // only available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Resolver: boolean;
    // Log PPP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Ppp: boolean;
    // Log routing events to the remote syslog server(s).<br><br>This field is only
    // available when the following conditions are met:<br>- `enableremotelogging`
    // must be equal to `true`<br>- `logall` must not be equal to `true`<br>
    Routing: boolean;
    // Log NTP events to the remote syslog server(s).<br><br>This field is only available
    // when the following conditions are met:<br>- `enableremotelogging` must be equal
    // to `true`<br>- `logall` must not be equal to `true`<br>
    Ntpd: boolean;
  end;
  PLogSettings = ^TLogSettings;

  TSystemLog = packed record
    // The raw text of the system log entry.<br>
    Text: string;
  end;
  PSystemLog = ^TSystemLog;

  TOpenVPNClientStatus = packed record
    // The name of the OpenVPN client.<br>
    Name: string;
    // The port number of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    Port: string;
    // The VPN ID of the OpenVPN client this status corresponds to.<br>
    Vpnid: integer;
    // The management interface of the OpenVPN client.<br>
    Mgmt: string;
    // The current status of the OpenVPN client.<br>
    Status: string;
    // The current state of the OpenVPN client.<br>
    State: string;
    // The details for the current state of the OpenVPN client.<br>
    StateDetail: string;
    // The connection time of the OpenVPN client.<br>
    ConnectTime: string;
    // The virtual address of the OpenVPN client.<br>
    VirtualAddr: string;
    // The virtual address 6 of the OpenVPN client.<br>
    VirtualAddr6: string;
    // The remote host of the OpenVPN client.<br>
    RemoteHost: string;
    // The remote port of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    RemotePort: string;
    // The local host of the OpenVPN client.<br>
    LocalHost: string;
    // The local port of the OpenVPN client. Valid options are: a TCP/UDP port number<br>
    LocalPort: string;
  end;
  POpenVPNClientStatus = ^TOpenVPNClientStatus;

  TOpenVPNServerConnectionStatus = packed record
    // The common name of the OpenVPN server connection.<br>
    CommonName: string;
    // The remote host of the OpenVPN server connection.<br>
    RemoteHost: string;
    // The virtual address of the OpenVPN server connection.<br>
    VirtualAddr: string;
    // The virtual IPv6 address of the OpenVPN server connection.<br>
    VirtualAddr6: string;
    // The number of bytes received by the OpenVPN server connection.<br>
    BytesRecv: integer;
    // The number of bytes sent by the OpenVPN server connection.<br>
    BytesSent: integer;
    // The connection time of the OpenVPN server connection.<br>
    ConnectTime: string;
    // The connection time of the OpenVPN server connection in Unix time.<br>
    ConnectTimeUnix: integer;
    // The user name of the OpenVPN server connection.<br>
    UserName: string;
    // The client ID of the OpenVPN server connection.<br>
    ClientId: integer;
    // The peer ID of the OpenVPN server connection.<br>
    PeerId: integer;
    // The cipher of the OpenVPN server connection.<br>
    Cipher: string;
  end;
  POpenVPNServerConnectionStatus = ^TOpenVPNServerConnectionStatus;

  TOpenVPNServerRouteStatus = packed record
    // The common name of the OpenVPN server connection.<br>
    CommonName: string;
    // The remote host of the OpenVPN server connection.<br>
    RemoteHost: string;
    // The virtual address of the OpenVPN server connection.<br>
    VirtualAddr: string;
    // The last time of the route was used.<br>
    LastTime: string;
  end;
  POpenVPNServerRouteStatus = ^TOpenVPNServerRouteStatus;

  TOpenVPNServerStatus = packed record
    // The name of the OpenVPN server.<br>
    Name: string;
    // The mode of the OpenVPN server.<br>
    Mode: string;
    // The port number of the OpenVPN server. Valid options are: a TCP/UDP port number<br>
    Port: string;
    // The VPN ID of the OpenVPN server this status corresponds to.<br>
    Vpnid: integer;
    // The management interface of the OpenVPN server.<br>
    Mgmt: string;
    // The current connections to the OpenVPN server.<br>
    Conns: variant;
    // The current routes of the OpenVPN server.<br>
    Routes: variant;
  end;
  POpenVPNServerStatus = ^TOpenVPNServerStatus;

  TService = packed record
    // The internal name of the service.<br>
    Name: string;
    // The action to perform against this service.<br>
    Action: TEnumPfopenapi79;
    // The full descriptive name of the service.<br>
    Description: string;
    // Indicates if the service is enabled.<br>
    Enabled: boolean;
    // Indicates if the service is actively running.<br>
    Status: boolean;
  end;
  PService = ^TService;

  TSystemStatus = packed record
    // The verbose name of this system's platform.<br>
    Platform: string;
    // The system's unique serial number/ID.<br>
    Serial: string;
    // The unique ID issued for this pfSense instance by Netgate.<br>
    NetgateId: string;
    // The amount of time this system has been up since the last reboot.<br>
    Uptime: string;
    // The name of the BIOS vendor.<br>
    BiosVendor: string;
    // The BIOS version installed on this system.<br>
    BiosVersion: string;
    // The build date of the BIOS version.<br>
    BiosDate: string;
    // Indicates whether kernel PTI is enabled or not.<br>
    KernelPti: boolean;
    // Indicates whether MDS mitigation is enabled or not.<br>
    MdsMitigation: string;
    // The current system temperature in celsius.<br>
    TempC: single;
    // The current system temperature in fahrenheit.<br>
    TempF: single;
    // The model of CPU installed in this system and other CPU info.<br>
    CpuModel: string;
    // The CPU load averages. The first value represents the load average for the
    // last minute, the second value represents the load average for the last 5 minutes,
    // and the third value represents the load average for the last 15 minutes.<br>
    CpuLoadAvg: TSingleDynArray;
    // The total number of CPUs cores available on this system.<br>
    CpuCount: integer;
    // The current CPU usage as a whole percentage. Note: This is an approximate usage
    // based on the last minute load average and total number of CPU cores. This may
    // not represent exact CPU usage.<br>
    CpuUsage: single;
    // The current MBUF usage as a whole percentage.<br>
    MbufUsage: single;
    // The current memory usage as a whole percentage.<br>
    MemUsage: single;
    // The current swap usage as a whole percentage.<br>
    SwapUsage: single;
    // The current disk usage as a whole percentage.<br>
    DiskUsage: single;
  end;
  PSystemStatus = ^TSystemStatus;

  TCertificateRevocationList = packed record
    // The unique ID for this CRL. This is automatically generated by the system and
    // cannot be changed.<br>
    Refid: string;
    // The unique ID of the CA that this CRL is associated with.<br>
    Caref: string;
    // The unique name/description for this CRL.<br>
    Descr: string;
    // The method used to generate this CRL.<br>
    Method: TEnumPfopenapi80;
    // The lifetime of this CRL in days.<br><br>This field is only available when
    // the following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Lifetime: integer;
    // The serial number of the CRL.<br><br>This field is only available when the
    // following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Serial: integer;
    // The raw x509 CRL data.<br><br>This field is only available when the following
    // conditions are met:<br>- `method` must be equal to `'existing'`<br>
    Text: string;
    // The list of revoked certificates in this CRL.<br><br>This field is only available
    // when the following conditions are met:<br>- `method` must be equal to `'internal'`<br>
    Cert: variant;
  end;
  PCertificateRevocationList = ^TCertificateRevocationList;

  TCertificateRevocationListRevokedCertificate = packed record
    // The reference ID of the certificate to be revoked<br><br>This field is only
    // available when the following conditions are met:<br>- `serial` must be equal
    // to `NULL`<br>
    Certref: string;
    // The serial number of the certificate to be revoked.<br>
    Serial: string;
    // The CRL reason for revocation code.<br>
    Reason: integer;
    // The unix timestamp of when the certificate was revoked.<br>
    RevokeTime: integer;
    // The unique ID of the CA that signed the revoked certificate.<br>
    Caref: string;
    // The unique name/description for this CRL.<br>
    Descr: string;
    // The type of the certificate to be revoked.<br>
    _Type: string;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificateRevocationListRevokedCertificate = ^TCertificateRevocationListRevokedCertificate;

  TCertificateAuthority = packed record
    // The descriptive name for this certificate authority.<br>
    Descr: string;
    // The unique ID assigned to this certificate authority for internal system use.
    // This value is generated by this system and cannot be changed.<br>
    Refid: string;
    // Adds or removes this certificate authority from the operating system's trust
    // stored.<br>
    Trust: boolean;
    // Enables or disables the randomization of serial numbers for certificates signed
    // by this CA.<br>
    Randomserial: boolean;
    // The decimal number to be used as a sequential serial number for the next certificate
    // to be signed by this CA. This value is ignored when Randomize Serial is checked.<br>
    Serial: integer;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificateAuthority = ^TCertificateAuthority;

  TCertificateAuthorityGenerate = packed record
    // The descriptive name for this certificate authority.<br>
    Descr: string;
    // The unique ID assigned to this certificate authority for internal system use.
    // This value is generated by this system and cannot be changed.<br>
    Refid: string;
    // Adds or removes this certificate authority from the operating system's trust
    // stored.<br>
    Trust: boolean;
    // Enables or disables the randomization of serial numbers for certificates signed
    // by this CA.<br>
    Randomserial: boolean;
    // The decimal number to be used as a sequential serial number for the next certificate
    // to be signed by this CA. This value is ignored when Randomize Serial is checked.<br>
    Serial: integer;
    // Indicates if this certificate authority is an intermediate certificate authority.<br>
    IsIntermediate: boolean;
    // The certificate authority to use as the parent for this intermediate certificate
    // authority.<br><br>This field is only available when the following conditions
    // are met:<br>- `is_intermediate` must be equal to `true`<br>
    Caref: string;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfopenapi81;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: string;
    // The digest algorithm to use when signing certificates.<br>
    DigestAlg: string;
    // The number of days the certificate authority is valid for.<br>
    Lifetime: integer;
    // The common name for the certificate authority.<br>
    DnCommonname: string;
    // The country for the certificate authority.<br>
    DnCountry: string;
    // The state for the certificate authority.<br>
    DnState: string;
    // The city for the certificate authority.<br>
    DnCity: string;
    // The organization for the certificate authority.<br>
    DnOrganization: string;
    // The organizational unit for the certificate authority.<br>
    DnOrganizationalunit: string;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificateAuthorityGenerate = ^TCertificateAuthorityGenerate;

  TCertificateAuthorityRenew = packed record
    // The Certificate Authority to renew.<br>
    Caref: string;
    // Reuses the existing private key when renewing the certificate authority.<br>
    Reusekey: boolean;
    // Reuses the existing serial number when renewing the certificate authority.<br>
    Reuseserial: boolean;
    // Enforces strict security measures when renewing the certificate authority.<br>
    Strictsecurity: boolean;
    // The old serial number of the Certificate Authority before the renewal.<br>
    Oldserial: string;
    // The new serial number of the Certificate Authority after the renewal.<br>
    Newserial: string;
  end;
  PCertificateAuthorityRenew = ^TCertificateAuthorityRenew;

  TCertificate = packed record
    // The descriptive name for this certificate.<br>
    Descr: string;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: string;
    // The unique ID of the existing pfSense Certificate Authority that signed this
    // certificate.This value is assigned by this system and cannot be changed.<br>
    Caref: string;
    // The certificate type. Use `server` when this certificate is to be used by one
    // or more services on this system. Use `user` when this certificate is intended
    // to be assigned to a user for authentication purposes.<br>
    _Type: TEnumPfopenapi82;
    // The X509 certificate signing request string if this certificate is pending
    // an external signature.<br>
    Csr: string;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificate = ^TCertificate;

  TCertificateGenerate = packed record
    // The descriptive name for this certificate.<br>
    Descr: string;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: string;
    // The certificate authority to use as the parent for this certificate.<br>
    Caref: string;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfopenapi81;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: string;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: string;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The common name of the certificate.<br>
    DnCommonname: string;
    // The country of the certificate.<br>
    DnCountry: string;
    // The state/province of the certificate.<br>
    DnState: string;
    // The city of the certificate.<br>
    DnCity: string;
    // The organization of the certificate.<br>
    DnOrganization: string;
    // The organizational unit of the certificate.<br>
    DnOrganizationalunit: string;
    // The type of certificate to generate.<br>
    _Type: TEnumPfopenapi82;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TStringDynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TStringDynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TStringDynArray;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TStringDynArray;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificateGenerate = ^TCertificateGenerate;

  TCertificatePKCS12Export = packed record
    // The Certificate to export as a PKCS12 file.<br>
    Certref: string;
    // The level of encryption to use when exporting the PKCS#12 archive.<br>
    Encryption: TEnumPfopenapi83;
    // The passphrase to use when exporting the PKCS#12 archive. Leave empty for no
    // passphrase.<br>
    Passphrase: string;
    // The filename used when exporting the PKCS#12 archive. This value cannot be
    // changed and will always be certificate refid with the .p12 extension.<br>
    Filename: string;
    // The PKCS#12 archive binary data. This value cannot be changed.<br>
    BinaryData: string;
  end;
  PCertificatePKCS12Export = ^TCertificatePKCS12Export;

  TCertificateRenew = packed record
    // The `refid` of the Certificate to renew.<br>
    Certref: string;
    // Reuses the existing private key when renewing the certificate.<br>
    Reusekey: boolean;
    // Reuses the existing serial number when renewing the certificate.<br>
    Reuseserial: boolean;
    // Enforces strict security measures when renewing the certificate.<br>
    Strictsecurity: boolean;
    // The old serial number of the Certificate before the renewal.<br>
    Oldserial: string;
    // The new serial number of the Certificate after the renewal.<br>
    Newserial: string;
  end;
  PCertificateRenew = ^TCertificateRenew;

  TCertificateSigningRequest = packed record
    // The descriptive name for this certificate.<br>
    Descr: string;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: string;
    // The type of key pair to generate.<br>
    Keytype: TEnumPfopenapi81;
    // The length of the RSA key pair to generate.<br><br>This field is only available
    // when the following conditions are met:<br>- `keytype` must be equal to `'RSA'`<br>
    Keylen: integer;
    // The name of the elliptic curve to use for the ECDSA key pair.<br><br>This field
    // is only available when the following conditions are met:<br>- `keytype` must
    // be equal to `'ECDSA'`<br>
    Ecname: string;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: string;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The common name of the certificate.<br>
    DnCommonname: string;
    // The country of the certificate.<br>
    DnCountry: string;
    // The state/province of the certificate.<br>
    DnState: string;
    // The city of the certificate.<br>
    DnCity: string;
    // The organization of the certificate.<br>
    DnOrganization: string;
    // The organizational unit of the certificate.<br>
    DnOrganizationalunit: string;
    // The type of certificate to generate.<br>
    _Type: TEnumPfopenapi82;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TStringDynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TStringDynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TStringDynArray;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TStringDynArray;
    // The X509 certificate signing request string. You will need to provide this
    // to a certificate authority to sign the certificate.<br>
    Csr: string;
    // The X509 private key string.<br>
    Prv: string;
  end;
  PCertificateSigningRequest = ^TCertificateSigningRequest;

  TCertificateSigningRequestSign = packed record
    // The descriptive name for this certificate.<br>
    Descr: string;
    // The unique ID assigned to this certificate for internal system use. This value
    // is generated by this system and cannot be changed.<br>
    Refid: string;
    // The certificate authority to sign the certificate with.<br>
    Caref: string;
    // The X509 certificate signing request to sign.<br>
    Csr: string;
    // The X509 certificate string.<br>
    Crt: string;
    // The X509 private key string.<br>
    Prv: string;
    // The digest method used when the certificate is signed.<br>
    DigestAlg: string;
    // The number of days the certificate is valid for.<br>
    Lifetime: integer;
    // The type of certificate to generate.<br>
    _Type: TEnumPfopenapi82;
    // The DNS Subject Alternative Names (SANs) for the certificate.<br>
    DnDnsSans: TStringDynArray;
    // The Email Subject Alternative Names (SANs) for the certificate.<br>
    DnEmailSans: TStringDynArray;
    // The IP Subject Alternative Names (SANs) for the certificate.<br>
    DnIpSans: TStringDynArray;
    // The URI Subject Alternative Names (SANs) for the certificate.<br>
    DnUriSans: TStringDynArray;
  end;
  PCertificateSigningRequestSign = ^TCertificateSigningRequestSign;

  TSystemConsole = packed record
    // Enables or disables password protecting the console.<br>
    PasswdProtectConsole: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PSystemConsole = ^TSystemConsole;

  TSystemDNS = packed record
    // Allow DNS servers to be overwritten by DHCP on WAN interfaces.<br>
    Dnsallowoverride: boolean;
    // Use local DNS server (DNS Resover or DNS Forwarder) as the primary DNS, or
    // use only remote DNS servers specified in `dnsserver`. Set to `null` to use
    // local DNS server as the primary and remote DNS servers as backup.<br>
    Dnslocalhost: TEnumPfopenapi84;
    // The remote DNS server IPv4 or IPv6 addresses.<br>
    Dnsserver: TStringDynArray;
  end;
  PSystemDNS = ^TSystemDNS;

  TSystemHostname = packed record
    // The hostname portion of the FQDN to assign to this system.<br>
    Hostname: string;
    // The domain portion of the FQDN to assign to this system.<br>
    Domain: string;
  end;
  PSystemHostname = ^TSystemHostname;

  TEmailNotificationSettings = packed record
    // Disables SMTP notifications.<br>
    Disable: boolean;
    // The IP address or hostname of the SMTP server.<br>
    Ipaddress: string;
    // The port number of the SMTP server. Valid options are: a TCP/UDP port number<br>
    Port: string;
    // The timeout (in seconds) for the SMTP connection.<br>
    Timeout: integer;
    // Enables or disables SSL/TLS for the SMTP connection.<br>
    Ssl: boolean;
    // Enables or disables SSL/TLS certificate validation for the SMTP connection.<br>
    Sslvalidate: boolean;
    // The email address to use as the "From" address in notifications.<br>
    Fromaddress: string;
    // The email address to send notifications to.<br>
    Notifyemailaddress: string;
    // The authentication mechanism to use for the SMTP connection.<br>
    AuthenticationMechanism: TEnumPfopenapi85;
    // The username to use for SMTP authentication.<br><br>This field is only available
    // when the following conditions are met:<br>- `authentication_mechanism` must
    // be equal to `'LOGIN'`<br>
    Username: string;
    // The password to use for SMTP authentication.<br><br>This field is only available
    // when the following conditions are met:<br>- `authentication_mechanism` must
    // be equal to `'LOGIN'`<br>
    Password: string;
  end;
  PEmailNotificationSettings = ^TEmailNotificationSettings;

  TAvailablePackage = packed record
    // The name of the pfSense package.<br>
    Name: string;
    // The package's shortname.<br>
    Shortname: string;
    // The package's description.<br>
    Descr: string;
    // The latest version available for this package.<br>
    Version: string;
    // Indicates whether the package is currently installed or not.<br>
    Installed: boolean;
    // Dependencies for this package that are also installed when this package is
    // installed.<br>
    Deps: TStringDynArray;
  end;
  PAvailablePackage = ^TAvailablePackage;

  TPackage = packed record
    // The name of the pfSense package.<br>
    Name: string;
    // The package's shortname.<br>
    Shortname: string;
    // The package's description.<br>
    Descr: string;
    // The version of the package currently installed.<br>
    InstalledVersion: string;
    // The latest version available for this package.<br>
    LatestVersion: string;
    // Indicates whether the installed package has an update available.<br>
    UpdateAvailable: boolean;
  end;
  PPackage = ^TPackage;

  TRESTAPIAccessListEntry = packed record
    // The type of access this entry provides. "allow" entries permit access to the
    // REST API from the specified networks. "deny" entries block access to the REST
    // API from the specified networks.<br>
    _Type: TEnumPfopenapi86;
    // The weight of this entry. Entries with lower weights are evaluated first. If
    // multiple entries match a request, the entry with the lowest weight will be
    // applied.<br>
    Weight: integer;
    // The network (in CIDR notation) that this entry applies to. Clients interacting
    // with the REST API from this network will be affected by this entry.<br>
    Network: string;
    // The users that this entry applies to. Only users in this list will be affected
    // by this entry.<br>
    Users: TStringDynArray;
    // The firewall schedule that this entry will use. This entry will only be active
    // during the
    // times specified in the schedule. Leave empty to apply this entry at all times.<br>
    Sched: string;
    // A description of this access list entry. This field is optional.<br>
    Descr: string;
  end;
  PRESTAPIAccessListEntry = ^TRESTAPIAccessListEntry;

  TRESTAPISettings = packed record
    // Enables or disables the API. If set to `false`, the API will no longer respond
    // to API requests
    // and can only be re-enabled via webConfigurator.<br>
    Enabled: boolean;
    // Enables or disables read-only API access. If enabled, the API will only respond
    // to GET requests
    // and can only be disabled via webConfigurator.<br>
    ReadOnly: boolean;
    // Enables or disables keeping a persistent backup of the API configuration that
    // can be used
    // to restore the API configuration after package and systems updates.<br>
    KeepBackup: boolean;
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
    // Enables or disables logging of API authentication attempts that are successful.
    // By default, only
    // failed API authentication attempts are logged to prevent flooding the authentication
    // logs. This field is
    // only applicable when the API `login_protection` setting is enabled.<br>
    LogSuccessfulAuth: boolean;
    // Enables or disables displaying pre-releases in available API updates. Pre-releases
    // contain fixes
    // and features that are currently under development and may not be fully stable.
    // Use of pre-release versions
    // is at your own risk.<br>
    AllowPreReleases: boolean;
    // Enables or disables HATEOAS. Enabling HATEOAS will allow the API to include
    // links to related resources in API responses. This is primarily useful for frontend
    // web applications and self-navigating client scripts that integrate with HAL
    // standards. Enabling HATEOAS may increase API response times, especially on
    // systems with large configurations.<br>
    Hateoas: boolean;
    // Enables or disables exposing sensitive fields in API responses. When enabled,
    // sensitive fields such as passwords, private keys, and other sensitive data
    // will be included in API responses.<br>
    ExposeSensitiveFields: boolean;
    // Specifies a list of fields (formatted as ModelName:FieldName) that should have
    // their sensitive attribute overridden. Fields selected here will not be considered
    // sensitive and will be included in API responses regardless of the `expose_sensitive_fields`
    // setting.<br><br>This field is only available when the following conditions
    // are met:<br>- `expose_sensitive_fields` must be equal to `false`<br>
    OverrideSensitiveFields: TStringDynArray;
    // Sets the interfaces allowed to accept incoming API calls.<br>
    AllowedInterfaces: TStringDynArray;
    // Specifies how the API should represent interface names. Use `descr` to represent
    // interface objects by their description name, use `id` to represent interface
    // objects by their
    // internal pfSense ID (e.g. wan, lan, opt1), or use `if` to represent interface
    // objects by their
    // real interface name (e.g. em0, igb1, bxe3).<br>
    RepresentInterfacesAs: TEnumPfopenapi87;
    // Sets the API authentication methods allowed to authenticate API calls.<br>
    AuthMethods: TStringDynArray;
    // Sets the amount of time (in seconds) JWTs are valid for.<br>
    JwtExp: integer;
    // Enables or disables syncing API settings to HA peers. When enabled, API settings
    // from this
    // host will automatically be synced to any hosts defined in `ha_sync_hosts`.<br>
    HaSync: boolean;
    // Enables or disables certificate validation when syncing API configurations
    // to HA sync peers. If
    // enabled, all hosts defined in `ha_sync_hosts` must have their webConfigurator
    // configured with a certificate
    // trusted by this system. It is strongly recommended this be enabled at all times
    // to help mitigate
    // Man-in-the-Middle attacks.<br>
    HaSyncValidateCerts: boolean;
    // Set a list of IP addresses or hostnames to sync API settings to.<br>
    HaSyncHosts: TStringDynArray;
    // Sets the username to use when authenticating for HA sync processes. This user
    // must be the present
    // on all hosts defined in `ha_sync_hosts`.<br>
    HaSyncUsername: string;
    // Sets the password to use when authenticating for HA sync processes. This must
    // be the password
    // for the user defined in `ha_sync_username` and must be the same on all hosts
    // defined in `ha_sync_hosts`.<br>
    HaSyncPassword: string;
  end;
  PRESTAPISettings = ^TRESTAPISettings;

  TRESTAPISettingsSync = packed record
    // The serialized REST API settings data to be synced.<br>
    SyncData: string;
  end;
  PRESTAPISettingsSync = ^TRESTAPISettingsSync;

  TRESTAPIVersion = packed record
    // The current API version installed on this system.<br>
    CurrentVersion: string;
    // The latest API version available to this system.<br>
    LatestVersion: string;
    // The latest API version's release date.<br>
    LatestVersionReleaseDate: string;
    // Indicates if an API update is available for this system.<br>
    UpdateAvailable: boolean;
    // Set the API version to update or rollback to.<br>
    InstallVersion: string;
    // All available versions of the REST API package for this system.<br>
    AvailableVersions: TStringDynArray;
  end;
  PRESTAPIVersion = ^TRESTAPIVersion;

  TSystemTunable = packed record
    // The name of the tunable to set.<br>
    Tunable: string;
    // The value to assign this tunable.<br>
    Value: string;
    // A description for this tunable.<br>
    Descr: string;
  end;
  PSystemTunable = ^TSystemTunable;

  TSystemVersion = packed record
    // The official pfSense version release name. (e.g. X.X.X-RELEASE)<br>
    Version: string;
    // The base pfSense version. For pfSense CE, this will be the major and minor
    // version but not the patch. For pfSense Plus, this will be the version year
    // and month but not the patch.<br>
    Base: string;
    // The pfSense build's patch version.<br>
    Patch: string;
    // The datetime string of when the pfSense version was initially built.<br>
    Buildtime: string;
  end;
  PSystemVersion = ^TSystemVersion;

  TWebGUISettings = packed record
    // The protocol to use for the web GUI.<br>
    Protocol: TEnumPfopenapi43;
    // The port on which the web GUI listens. Valid options are: a TCP/UDP port number<br>
    Port: string;
    // The SSL/TLS certificate to use for the web GUI.<br>
    Sslcertref: string;
  end;
  PWebGUISettings = ^TWebGUISettings;

  TAuthServer = packed record
    // The unique reference ID for this authentication server. This value is only
    // used internally and cannot be manually set or changed.<br>
    Refid: string;
    // The type of this authentication server.<br>
    _Type: TEnumPfopenapi88;
    // The descriptive name for this authentication server.<br>
    Name: string;
    // The remote IP address or hostname of the authentication server.<br>
    Host: string;
    // The LDAP port to connect to on this LDAP authentication server. Valid options
    // are: a TCP/UDP port number<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapPort: string;
    // The encryption mode to use when connecting to this authentication server. Use
    // `Standard TCP` for unencrypted LDAP connections, use `STARTTLS Encrypt` to
    // start an encrypted connection via STARTTLS if it's available, or `SSL/TLS Encrypted`
    // to only use LDAPS encrypted connections.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapUrltype: TEnumPfopenapi89;
    // The LDAP protocol version to use for connections to this LDAP authentication
    // server.<br><br>This field is only available when the following conditions are
    // met:<br>- `type` must be equal to `'ldap'`<br>
    LdapProtver: integer;
    // The timeout (in seconds) for connections to the LDAP authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>
    LdapTimeout: integer;
    // The certificate authority used to validate the LDAP server certificate.<br><br>This
    // field is only available when the following conditions are met:<br>- `ldap_urltype`
    // must be one of [ starttls, encrypted ]<br>
    LdapCaref: string;
    // The LDAP search scope. Use `one` to limit the scope to a single level, or `subtree`
    // to allow the entire subtree to be searched.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapScope: TEnumPfopenapi90;
    // The root for LDAP searches on this authentication server.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapBasedn: string;
    // The LDAP authentication container.<br><br>This field is only available when
    // the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAuthcn: string;
    // Enable LDAP extended queries.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapExtendedEnabled: boolean;
    // The extended LDAP query to make during LDAP searches.<br><br>This field is
    // only available when the following conditions are met:<br>- `type` must be equal
    // to `'ldap'`<br>- `ldap_extended_enabled` must be equal to `true`<br>
    LdapExtendedQuery: string;
    // The DN to use when binding to this authentication server. Set to `null` to
    // bind anonymously.<br><br>This field is only available when the following conditions
    // are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapBinddn: string;
    // The password to use when binding to this authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>- `ldap_binddn` must not be equal to `NULL`<br>
    LdapBindpw: string;
    // The LDAP user attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrUser: string;
    // The LDAP group attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrGroup: string;
    // The LDAP member attribute.<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapAttrMember: string;
    // Enables or disable RFC2307 LDAP options.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapRfc2307: boolean;
    // Enables or disable the use of DNs for username searches.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>- `ldap_rfc2307` must be equal to `true`<br>
    LdapRfc2307Userdn: boolean;
    // The group object class for groups in RFC2307 mode.<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be equal
    // to `'ldap'`<br>- `ldap_rfc2307` must be equal to `true`<br>
    LdapAttrGroupobj: string;
    // The group DN to use for shell authentication. Users must be a member of this
    // group and have valid posixAccount attributes to sign in.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapPamGroupdn: string;
    // Enables or disables UTF-8 encoding LDAP parameters before sending them to this
    // authentication server<br><br>This field is only available when the following
    // conditions are met:<br>- `type` must be equal to `'ldap'`<br>
    LdapUtf8: boolean;
    // Do not strip away parts of the username after the @ symbol.<br><br>This field
    // is only available when the following conditions are met:<br>- `type` must be
    // equal to `'ldap'`<br>
    LdapNostripAt: boolean;
    // Enables or disables unauthenticated binding. Unauthenticated binds are bind
    // with an existing login but with an empty password. Some LDAP servers (Microsoft
    // AD) allow this type of bind without any possibility to disable it.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'ldap'`<br>
    LdapAllowUnauthenticated: boolean;
    // The shared secret to use when authenticating to this RADIUS server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusSecret: string;
    // The port used by RADIUS for authentication. Set to `null` to disable use of
    // authentication services. Valid options are: a TCP/UDP port number<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusAuthPort: string;
    // The port used by RADIUS for accounting. Set to `null` to disable use of accounting
    // services. Valid options are: a TCP/UDP port number<br><br>This field is only
    // available when the following conditions are met:<br>- `type` must be equal
    // to `'radius'`<br>
    RadiusAcctPort: string;
    // The RADIUS protocol to use when authenticating.<br><br>This field is only available
    // when the following conditions are met:<br>- `type` must be equal to `'radius'`<br>
    RadiusProtocol: TEnumPfopenapi91;
    // The timeout (in seconds) for connections to this RADIUS authentication server.<br><br>This
    // field is only available when the following conditions are met:<br>- `type`
    // must be equal to `'radius'`<br>
    RadiusTimeout: integer;
    // The interface whose IP will be used as the 'NAS-IP-Address' attribute during
    // RADIUS Access-Requests. This choice will not change the interface used for
    // contacting the RADIUS server.<br><br>This field is only available when the
    // following conditions are met:<br>- `type` must be equal to `'radius'`<br>
    RadiusNasipAttribute: string;
  end;
  PAuthServer = ^TAuthServer;

  TUser = packed record
    // The username of this local user.<br>
    Name: string;
    // The password of this local user.<br>
    Password: string;
    // The UID of this local user. This value is automatically assigned and cannot
    // be changed.<br>
    Uid: integer;
    // The scope of this local user. This value is automatically assigned and cannot
    // be changed.<br>
    Scope: string;
    // The privileges assigned to this local user.<br>
    Priv: TStringDynArray;
    // Disable this local user.<br>
    Disabled: boolean;
    // The full descriptive name for this local user.<br>
    Descr: string;
    // The expiration date for this user in mm/dd/YYYY format. Use empty string for
    // no expiration<br>
    Expires: string;
    // The user certificates to assign this user. Items must be existing certificate
    // `refid`s.<br>
    Cert: TStringDynArray;
    // The SSH authorized keys to assign this user.<br>
    Authorizedkeys: string;
    // The IPsec pre-shared key to assign this user.<br>
    Ipsecpsk: string;
  end;
  PUser = ^TUser;

  TUserGroup = packed record
    // The name for this user group.<br>
    Name: string;
    // The GID of this user group. This value is automatically assigned and cannot
    // be changed.<br>
    Gid: integer;
    // The scope of this user group. Use `local` for user groups that only apply to
    // this system. use `remote` for groups that also apply to remote authentication
    // servers.<br>
    Scope: TEnumPfopenapi84;
    // The description to assign to this user group.<br>
    Description: string;
    // The local user names to assign to this user group.<br>
    Member: TStringDynArray;
    // The privileges to assign to this user group.<br>
    Priv: TStringDynArray;
  end;
  PUserGroup = ^TUserGroup;

  TIPsecApply = packed record
    // Displays `true` when all IPsec changes are applied and there are no pending
    // changes left.Displays `false` when there are pending IPsec changes that have
    // not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PIPsecApply = ^TIPsecApply;

  TIPsecPhase1Encryption = packed record
    // The name of the encryption algorithm to use for this P1 encryption item.<br>
    EncryptionAlgorithmName: TEnumPfopenapi92;
    // The key length for the encryption algorithm.<br><br>This field is only available
    // when the following conditions are met:<br>- `encryption_algorithm_name` must
    // be one of [ aes, aes128gcm, aes192gcm, aes256gcm ]<br>
    EncryptionAlgorithmKeylen: integer;
    // The hash algorithm to use for this P1 encryption item.<br>
    HashAlgorithm: TEnumPfopenapi93;
    // The Diffie-Hellman (DH) group to use for this P1 encryption item.<br>
    Dhgroup: integer;
    // The PRF algorithm to use for this P1 encryption item. This value has no affect
    // unless the P1 entry has PRF enabled.<br>
    PrfAlgorithm: TEnumPfopenapi93;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PIPsecPhase1Encryption = ^TIPsecPhase1Encryption;

  TIPsecPhase1 = packed record
    // The unique IKE ID for this phase 1 entry. This value is dynamically set and
    // cannot be set or changed by users.<br>
    Ikeid: integer;
    // A description for this IPsec phase 1 entry.<br>
    Descr: string;
    // Disables this IPsec phase 1 entry.<br>
    Disabled: boolean;
    // The IKE protocol version this phase 1 entry will use.<br>
    Iketype: TEnumPfopenapi94;
    // The IKEv1 negotiation mode this phase 1 entry will use.<br><br>This field is
    // only available when the following conditions are met:<br>- `iketype` must be
    // one of [ ikev1, auto ]<br>
    Mode: TEnumPfopenapi95;
    // The IP version this phase 1 entry will use.<br>
    Protocol: TEnumPfopenapi96;
    // The interface for the local endpoint of this phase 1 entry. This should be
    // an interface that is reachable by the remote peer.<br>
    _Interface: string;
    // The IP address or hostname of the remote gateway.<br>
    RemoteGateway: string;
    // The IPsec authentication method this tunnel will use.<br>
    AuthenticationMethod: TEnumPfopenapi97;
    // The identifier type used by the local end of the tunnel.<br>
    MyidType: TEnumPfopenapi98;
    // The identifier value used by the local end of the tunnel. This must be a value
    // that corresponds with the current `myid_type` value.<br><br>This field is only
    // available when the following conditions are met:<br>- `myid_type` must not
    // be equal to `'myaddress'`<br>
    MyidData: string;
    // The identifier type used by the remote end of the tunnel.<br>
    PeeridType: TEnumPfopenapi99;
    // The identifier value used by the remote end of the tunnel. This must be a value
    // that corresponds with the current `peerid_type` value.<br><br>This field is
    // only available when the following conditions are met:<br>- `peerid_type` must
    // not be one of [ any, peeraddress ]<br>
    PeeridData: string;
    // The Pre-Shared Key (PSK) value. This key must match on both peers and should
    // be long and random to protect the tunnel and its contents. A weak Pre-Shared
    // Key can lead to a tunnel compromise.<br><br>This field is only available when
    // the following conditions are met:<br>- `authentication_method` must be equal
    // to `'pre_shared_key'`<br>
    PreSharedKey: string;
    // The certificate which identifies this system. The certificate must have at
    // least one non-wildcard SAN.<br><br>This field is only available when the following
    // conditions are met:<br>- `authentication_method` must be equal to `'cert'`<br>
    Certref: string;
    // The certificate authority to use when validating the peer certificate.<br><br>This
    // field is only available when the following conditions are met:<br>- `authentication_method`
    // must be equal to `'cert'`<br>
    Caref: string;
    // The amount of time (in seconds) before an child SA establishes new keys.<br>
    RekeyTime: integer;
    // The amount of time (in seconds) before an child SA is torn down and recreated
    // from scratch, including authentication.<br>
    ReauthTime: integer;
    // A random value up to this amount will be subtracted from the `rekey_time` to
    // avoid simultaneous renegotiation.<br>
    RandTime: integer;
    // The hard child SA lifetime (in seconds) after which the child SA will be expired.<br>
    Lifetime: integer;
    // The option used to force specific initiation/responder behavior for child SA
    // (P2) entries.<br>
    Startaction: TEnumPfopenapi100;
    // The option used to control the behavior when the remote peer unexpectedly closes
    // a child SA (P2)<br>
    Closeaction: TEnumPfopenapi100;
    // The option used to enable the use of NAT-T (i.e. the encapsulation of ESP in
    // UDP packets) if needed, which can help with clients that are behind restrictive
    // firewalls.<br>
    NatTraversal: TEnumPfopenapi101;
    // Enables or disables the allowance of multiple phase 1 configurations with the
    // same remote gateway endpoint.<br>
    GwDuplicates: boolean;
    // Enables or disables the use of MOBIKE for this tunnel.<br>
    Mobike: boolean;
    // Enables or disables the use split connection entries with multiple phase 2
    // configurations. Required for remote endpoints that support only a single traffic
    // selector per child SA.<br>
    Splitconn: boolean;
    // Enables or disables manual Pseudo-Random Function (PRF) selection.<br>
    PrfselectEnable: boolean;
    // The UDP port for IKE on the remote gateway. Valid options are: a TCP/UDP port
    // number<br>
    Ikeport: string;
    // The UDP port for NAT-T on the remote gateway. Valid options are: a TCP/UDP
    // port number<br>
    Nattport: string;
    // The delay (in seconds) between sending peer acknowledgement messages.<br>
    DpdDelay: integer;
    // The number of consecutive failures allowed before disconnecting.<br>
    DpdMaxfail: integer;
    // The encryption algorithms supported by this P1 encryption.<br>
    Encryption: variant;
  end;
  PIPsecPhase1 = ^TIPsecPhase1;

  TIPsecPhase2Encryption = packed record
    // The name of the encryption algorithm to use for this P2 encryption item.<br>
    Name: TEnumPfopenapi92;
    // The key length for the encryption algorithm.<br><br>This field is only available
    // when the following conditions are met:<br>- `name` must be one of [ aes, aes128gcm,
    // aes192gcm, aes256gcm ]<br>
    Keylen: integer;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PIPsecPhase2Encryption = ^TIPsecPhase2Encryption;

  TIPsecPhase2 = packed record
    // A unique ID used to identify this IPsec phase2 entry internally. This value
    // is automatically set by the system and cannot be changed.<br>
    Uniqid: string;
    // A unique ID used to identify this IPsec phase2 entry internally. This value
    // is automatically set by the system and cannot be changed.<br>
    Reqid: integer;
    // The `ikeid` of the parent IPsec phase 1 entry this IPsec phase 2 entry belongs
    // to.<br>
    Ikeid: integer;
    // A description for this IPsec phase 2 entry.<br>
    Descr: string;
    // Disables this IPsec phase 2 entry.<br>
    Disabled: boolean;
    // The IPsec phase 2 mode this entry will use.<br>
    Mode: TEnumPfopenapi102;
    // The local ID type to use for this phase 2 entry. Valid value options are: an
    // existing interface, `address`, `network`. For interface values, the `:ip` 
    // modifier can be appended to the value to use the interface's IP address instead
    // of its entire subnet.<br><br>This field is only available when the following
    // conditions are met:<br>- `mode` must not be equal to `'transport'`<br>
    LocalidType: string;
    // The local network IP component of this IPsec security association.<br><br>This
    // field is only available when the following conditions are met:<br>- `localid_type`
    // must be one of [ address, network ]<br>
    LocalidAddress: string;
    // The subnet bits of the `localid_address` network.<br><br>This field is only
    // available when the following conditions are met:<br>- `localid_type` must be
    // equal to `'network'`<br>
    LocalidNetbits: integer;
    // The NAT/BINAT translation type for this IPsec phase 2 entry. Leave as `null`
    // if NAT/BINAT is not needed. Valid value options are: an existing interface,
    // `address`, `network`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br><br>This
    // field is only available when the following conditions are met:<br>- `mode`
    // must not be one of [ transport, vti ]<br>
    NatlocalidType: string;
    // The NAT/BINAT local network IP component of this IPsec security association.<br><br>This
    // field is only available when the following conditions are met:<br>- `natlocalid_type`
    // must be one of [ address, network ]<br>
    NatlocalidAddress: string;
    // The subnet bits of the `natlocalid_address` network.<br><br>This field is only
    // available when the following conditions are met:<br>- `natlocalid_type` must
    // be equal to `'network'`<br>
    NatlocalidNetbits: integer;
    // The remote ID type to use for this phase 2 entry. Valid value options are:
    // `address`, `network`. For interface values, the `:ip`  modifier can be appended
    // to the value to use the interface's IP address instead of its entire subnet.<br><br>This
    // field is only available when the following conditions are met:<br>- `mode`
    // must not be equal to `'transport'`<br>
    RemoteidType: string;
    // The remote network IP component of this IPsec security association.<br><br>This
    // field is only available when the following conditions are met:<br>- `remoteid_type`
    // must be one of [ address, network ]<br>
    RemoteidAddress: string;
    // The subnet bits of the `remoteid_address` network.<br><br>This field is only
    // available when the following conditions are met:<br>- `remoteid_type` must
    // be equal to `'network'`<br>
    RemoteidNetbits: integer;
    // the IPsec phase 2 proposal protocol for this entry. Encapsulating Security
    // Payload (`esp`) performs encryption and authentication, Authentication Header
    // (`ah`) is authentication only.<br>
    Protocol: TEnumPfopenapi103;
    // The encryption algorithms to be used by this phase 2 entry.<br><br>This field
    // is only available when the following conditions are met:<br>- `protocol` must
    // be equal to `'esp'`<br>
    EncryptionAlgorithmOption: variant;
    // The hashing algorithms used by this IPsec phase 2 entry. Note: Hash is ignored
    // with GCM algorithms. SHA1 provides weak security and should be avoided.<br>
    HashAlgorithmOption: TEnumPfopenapi104Set;
    // The PFS key group this IPsec phase 2 entry should use. Note: Groups 1, 2, 5,
    // 22, 23, and 24 provide weak security and should be avoided.<br>
    Pfsgroup: integer;
    // The amount of time (in seconds) before an IKE SA establishes new keys.<br>
    RekeyTime: integer;
    // A random value up to this amount will be subtracted from the `rekey_time` and
    // `reauth_time` to avoid simultaneous renegotiation.<br>
    RandTime: integer;
    // The hard IKE SA lifetime (in seconds) after which the IKE SA will be expired.<br>
    Lifetime: integer;
    // The IP address to send an ICMP echo request to inside the tunnel. Can trigger
    // initiation of a tunnel mode P2, but does not trigger initiation of a VTI mode
    // P2.<br>
    Pinghost: string;
    // Enables or disables checking this P2 and initiating if disconnected; does not
    // send traffic inside the tunnel. This check ignores the P1 option 'Child SA
    // Start Action' and works for both VTI and tunnel mode P2s. For IKEv2 without
    // split connections, this only needs to be enabled on one P2.<br>
    Keepalive: boolean;
  end;
  PIPsecPhase2 = ^TIPsecPhase2;

  TOpenVPNClientSpecificOverride = packed record
    // The X.509 common name for the client certificate, or the username for VPNs
    // utilizing password authentication.<br>
    CommonName: string;
    // Disables this client specific override.<br>
    Disable: boolean;
    // Enables or disables the client from connecting to this server. Do not use this
    // option to permanently disable a client due to a compromised key or password.
    // Use a CRL instead.<br>
    Block: boolean;
    // The description for this client specific override.<br>
    Description: string;
    // The OpenVPN servers that will utilize this override. When no servers are specified,
    // the override will apply to all servers.<br>
    ServerList: TStringDynArray;
    // The IPv4 virtual network used for private communications between the server
    // and client hosts.<br>
    TunnelNetwork: string;
    // The IPv6 virtual network used for private communications between the server
    // and client hosts.<br>
    TunnelNetworkv6: string;
    // The IPv4 server-side networks that will be accessible from this particular
    // client.<br>
    LocalNetwork: TStringDynArray;
    // the IPv6 server-side networks that will be accessible from this particular
    // client.<br>
    LocalNetworkv6: TStringDynArray;
    // The IPv4 client-side networks that will be routed to this client specifically
    // using iroute, so that a site-to-site VPN can be established.<br>
    RemoteNetwork: TStringDynArray;
    // The IPv6 client-side networks that will be routed to this client specifically
    // using iroute, so that a site-to-site VPN can be established.<br>
    RemoteNetworkv6: TStringDynArray;
    // Enable forcing all client-generated traffic through the tunnel.<br>
    Gwredir: boolean;
    // Enables or disables preventing this client from receiving any server-defined
    // client settings.<br>
    PushReset: boolean;
    // Enables or disables preventing this client from receiving any server-defined
    // routes without removing any other options.<br>
    RemoveRoute: boolean;
    // The default domain to provide to the client.<br>
    DnsDomain: string;
    // The primary DNS server to provide to the client.<br>
    DnsServer1: string;
    // The secondary DNS server to provide to the client.<br>
    DnsServer2: string;
    // The tertiary DNS server to provide to the client.<br>
    DnsServer3: string;
    // The quaternary DNS server to provide to the client.<br>
    DnsServer4: string;
    // The primary NTP server to provide to the client.<br>
    NtpServer1: string;
    // The secondary NTP server to provide to the client.<br>
    NtpServer2: string;
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
    NetbiosScope: string;
    // The primary WINS server to provide to the client.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    WinsServer1: string;
    // The secondary WINS server to provide to the client.<br><br>This field is only
    // available when the following conditions are met:<br>- `netbios_enable` must
    // be equal to `true`<br>
    WinsServer2: string;
    // Additional OpenVPN options to add for this client.<br>
    CustomOptions: TStringDynArray;
  end;
  POpenVPNClientSpecificOverride = ^TOpenVPNClientSpecificOverride;

  TOpenVPNClient = packed record
    // The unique ID for this OpenVPN client. This value is assigned by the system
    // and cannot be changed.<br>
    Vpnid: integer;
    // The VPN interface name for this OpenVPN client. This value is assigned by the
    // system and cannot be changed.<br>
    Vpnif: string;
    // The description for this OpenVPN client.<br>
    Description: string;
    // Disables this OpenVPN client.<br>
    Disable: boolean;
    // The OpenVPN client mode.<br>
    Mode: TEnumPfopenapi105;
    // The carrier mode for this OpenVPN client. `tun` mode carries IPv4 and IPv6
    // (layer 3) and is the most common and compatible mode across all platforms.
    // `tap` mode is capable of carrying 802.3 (layer 2).<br>
    DevMode: TEnumPfopenapi106;
    // The protocol used by this OpenVPN client.<br>
    Protocol: TEnumPfopenapi107;
    // The interface used by the firewall to originate this OpenVPN client connection.<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must not be one of [ UDP, TCP ]<br>
    _Interface: string;
    // The IP address or hostname of the OpenVPN server this client will connect to.<br>
    ServerAddr: string;
    // The port used by the server to receive client connections. Valid options are:
    // a TCP/UDP port number<br>
    ServerPort: string;
    // The port binding used by OpenVPN for client connections. Valid options are:
    // a TCP/UDP port number<br>
    LocalPort: string;
    // The address for an HTTP Proxy this client can use to connect to a remote server.<br>
    ProxyAddr: string;
    // The port used by the HTTP Proxy. Valid options are: a TCP/UDP port number<br>
    ProxyPort: string;
    // The type of authentication used by the proxy server.<br>
    ProxyAuthtype: TEnumPfopenapi108;
    // The username to use for authentication to the remote proxy.<br><br>This field
    // is only available when the following conditions are met:<br>- `proxy_authtype`
    // must not be equal to `'none'`<br>
    ProxyUser: string;
    // The username to use for authentication to the remote proxy.<br><br>This field
    // is only available when the following conditions are met:<br>- `proxy_authtype`
    // must not be equal to `'none'`<br>
    ProxyPasswd: string;
    // The username used to authenticate with the OpenVPN server.<br>
    AuthUser: string;
    // The password used to authenticate with the OpenVPN server.<br><br>This field
    // is only available when the following conditions are met:<br>- `auth_user` must
    // not be equal to `NULL`<br>
    AuthPass: string;
    // Disables retrying authentication if an authentication failed error is received
    // from the server<br>
    AuthRetryNone: boolean;
    // The TLS key this OpenVPN client will use to sign control channel packets with
    // an HMAC signature for authentication when establishing the tunnel.<br>
    Tls: string;
    // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
    // for the control channel, protecting the peers from unauthorized connections.
    // The `crypt` mode encrypts the control channel communication in addition to
    // providing authentication, providing more privacy and traffic control channel
    // obfuscation.<br><br>This field is only available when the following conditions
    // are met:<br>- `tls` must not be equal to `NULL`<br>
    TlsType: TEnumPfopenapi109;
    // The TLS key direction. This must be set to complementary values on the client
    // and client. For example, if the client is set to 0, the client must be set
    // to 1. Both may be set to omit the direction, in which case the TLS Key will
    // be used bidirectionally.<br><br>This field is only available when the following
    // conditions are met:<br>- `tls` must not be equal to `NULL`<br>
    TlsauthKeydir: TEnumPfopenapi110;
    // The `refid` of the CA object to assume as the peer CA.<br>
    Caref: string;
    // The `refid` of the certificate object to assume as the OpenVPN client certificate.<br>
    Certref: string;
    // The encryption algorithms/ciphers allowed by this OpenVPN client.<br>
    DataCiphers: TStringDynArray;
    // The fallback encryption algorithm/cipher used for data channel packets when
    // communicating with clients that do not support data encryption algorithm negotiation
    // (e.g. Shared Key).<br>
    DataCiphersFallback: string;
    // The algorithm used to authenticate data channel packets, and control channel
    // packets if a TLS Key is present.<br>
    Digest: string;
    // Enables or disables requiring hosts to have a client certificate to connect.<br>
    RemoteCertTls: boolean;
    // The IPv4 virtual network used for private communications between this client
    // and client hosts.<br>
    TunnelNetwork: string;
    // The IPv6 virtual network used for private communications between this client
    // and client hosts.<br>
    TunnelNetworkv6: string;
    // IPv4 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetwork: TStringDynArray;
    // IPv6 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetworkv6: TStringDynArray;
    // Maximum outgoing bandwidth (in bytes per second) for this tunnel. Use `null`
    // no limit.<br>
    UseShaper: integer;
    // The compression mode allowed by this OpenVPN client. Compression can potentially
    // increase throughput but may allow an attacker to extract secrets if they can
    // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
    AllowCompression: TEnumPfopenapi111;
    // Enables or disables setting the TOS IP header value of tunnel packets to match
    // the encapsulated packet value.<br>
    Passtos: boolean;
    // Enables or disables the servers ability to add routes to the client's routing
    // table.<br>
    RouteNoPull: boolean;
    // Enables or disables adding/removing routes automatically.<br>
    RouteNoExec: boolean;
    // Enables or disables using the DNS server(s) provided by the OpenVPN server.<br>
    DnsAdd: boolean;
    // The method used to supply a virtual adapter IP address to clients when using
    // TUN mode on IPv4.<br><br>This field is only available when the following conditions
    // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
    Topology: TEnumPfopenapi112;
    // The amount of time (in seconds) until a client connection is closed for inactivity.<br>
    InactiveSeconds: integer;
    // The method used to define ping configuration.<br>
    PingMethod: TEnumPfopenapi113;
    // The keepalive interval parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveInterval: integer;
    // The keepalive timeout parameter.<br><br>This field is only available when the
    // following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveTimeout: integer;
    // The number of seconds to accept no packets before sending a ping to the remote
    // peer over the TCP/UDP control channel.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingSeconds: integer;
    // The action to take after a ping to the remote peer times-out.<br><br>This field
    // is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingAction: TEnumPfopenapi114;
    // The number of seconds that must elapse before the ping is considered a timeout
    // and the configured `ping_action` is performed.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingActionSeconds: integer;
    // Additional options to add to the OpenVPN client configuration.<br>
    CustomOptions: TStringDynArray;
    // Enables or disables fast I/O operations with UDP writes to tun/tap (Experimental).<br>
    UdpFastIo: boolean;
    // The number of times this client will attempt to send an exit notifications.<br>
    ExitNotify: TEnumPfopenapi115;
    // The send and receive buffer size for OpenVPN. Set to null to use the system
    // default.<br>
    Sndrcvbuf: integer;
    // The gateway type(s) that will be created when a virtual interface is assigned
    // to this OpenVPN server<br>
    CreateGw: TEnumPfopenapi116;
    // The OpenVPN logging verbosity level.<br>
    VerbosityLevel: integer;
  end;
  POpenVPNClient = ^TOpenVPNClient;

  TOpenVPNServer = packed record
    // The unique ID for this OpenVPN server. This value is assigned by the system
    // and cannot be changed.<br>
    Vpnid: integer;
    // The VPN interface name for this OpenVPN server. This value is assigned by the
    // system and cannot be changed.<br>
    Vpnif: string;
    // The description for this OpenVPN server.<br>
    Description: string;
    // Disables this OpenVPN server.<br>
    Disable: boolean;
    // The OpenVPN server mode.<br>
    Mode: TEnumPfopenapi117;
    // The name of the authentication server to use as the authentication backend
    // for this OpenVPN server<br><br>This field is only available when the following
    // conditions are met:<br>- `mode` must be one of [ server_user, server_tls_user
    // ]<br>
    Authmode: TStringDynArray;
    // The carrier mode for this OpenVPN server. `tun` mode carries IPv4 and IPv6
    // (layer 3) and is the most common and compatible mode across all platforms.
    // `tap` mode is capable of carrying 802.3 (layer 2).<br>
    DevMode: TEnumPfopenapi106;
    // The protocol used by this OpenVPN server.<br>
    Protocol: TEnumPfopenapi107;
    // The interface or Virtual IP address where OpenVPN will receive client connections.<br><br>This
    // field is only available when the following conditions are met:<br>- `protocol`
    // must not be one of [ UDP, TCP ]<br>
    _Interface: string;
    // The port used by OpenVPN to receive client connections. Valid options are:
    // a TCP/UDP port number<br>
    LocalPort: string;
    // Enables or disables the use of a TLS key for this OpenVPN server.<br>
    UseTls: boolean;
    // The TLS key this OpenVPN server will use to sign control channel packets with
    // an HMAC signature for authentication when establishing the tunnel.<br><br>This
    // field is only available when the following conditions are met:<br>- `use_tls`
    // must be equal to `true`<br>
    Tls: string;
    // The TLS key usage type. In `auth` mode, the TLS key is used only as HMAC authentication
    // for the control channel, protecting the peers from unauthorized connections.
    // The `crypt` mode encrypts the control channel communication in addition to
    // providing authentication, providing more privacy and traffic control channel
    // obfuscation.<br><br>This field is only available when the following conditions
    // are met:<br>- `use_tls` must be equal to `true`<br>
    TlsType: TEnumPfopenapi109;
    // The TLS key direction. This must be set to complementary values on the client
    // and server. For example, if the server is set to 0, the client must be set
    // to 1. Both may be set to omit the direction, in which case the TLS Key will
    // be used bidirectionally.<br><br>This field is only available when the following
    // conditions are met:<br>- `use_tls` must be equal to `true`<br>
    TlsauthKeydir: TEnumPfopenapi110;
    // The `refid` of the CA object to assume as the peer CA.<br>
    Caref: string;
    // The `refid` of the certificate object to assume as the OpenVPN server certificate.<br>
    Certref: string;
    // The depth of the certificate chain to check when a certificate based client
    // signs in. Certificates below this depth are not accepted. This is useful for
    // denying certificates made with intermediate CAs generated from the same CA
    // as the server. Set to null to use system default.<br>
    CertDepth: integer;
    // The Diffie-Hellman (DH) parameter set used for key exchange.<br>
    DhLength: string;
    // The Elliptic Curve to use for key exchange. The curve from the server certificate
    // is used by default when the server uses an ECDSA certificate. Otherwise, secp384r1
    // is used as a fallback.<br>
    EcdhCurve: string;
    // The encryption algorithms/ciphers allowed by this OpenVPN server.<br>
    DataCiphers: TStringDynArray;
    // The fallback encryption algorithm/cipher used for data channel packets when
    // communicating with clients that do not support data encryption algorithm negotiation
    // (e.g. Shared Key).<br>
    DataCiphersFallback: string;
    // The algorithm used to authenticate data channel packets, and control channel
    // packets if a TLS Key is present.<br>
    Digest: string;
    // Enables or disables enforcing a match between the common name of the client
    // certificate and the username given at login.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    Strictusercn: boolean;
    // Enables or disables requiring hosts to have a client certificate to connect.<br>
    RemoteCertTls: boolean;
    // The IPv4 virtual network used for private communications between this server
    // and client hosts.<br>
    TunnelNetwork: string;
    // The IPv6 virtual network used for private communications between this server
    // and client hosts.<br>
    TunnelNetworkv6: string;
    // Enables or disables clients on the bridge to obtain DHCP.<br><br>This field
    // is only available when the following conditions are met:<br>- `dev_mode` must
    // be equal to `'tap'`<br>
    ServerbridgeDhcp: boolean;
    // The interface to which this TAP instance will be bridged. This is not done
    // automatically. This interface must be assigned and the bridge created separately.
    // This setting controls which existing IP address and subnet mask are used by
    // OpenVPN for the bridge.<br><br>This field is only available when the following
    // conditions are met:<br>- `serverbridge_dhcp` must be equal to `true`<br>
    ServerbridgeInterface: string;
    // Enables or disables pushing the bridge interface's IPv4 address to connecting
    // clients as a route gateway.<br><br>This field is only available when the following
    // conditions are met:<br>- `serverbridge_dhcp` must be equal to `true`<br>
    ServerbridgeRoutegateway: boolean;
    // The bridge DHCP range's start address.<br><br>This field is only available
    // when the following conditions are met:<br>- `serverbridge_dhcp` must be equal
    // to `true`<br>
    ServerbridgeDhcpStart: string;
    // The bridge DHCP range's end address.<br><br>This field is only available when
    // the following conditions are met:<br>- `serverbridge_dhcp` must be equal to
    // `true`<br>
    ServerbridgeDhcpEnd: string;
    // Enable forcing all client-generated IPv4 traffic through the tunnel.<br>
    Gwredir: boolean;
    // Enable forcing all client-generated IPv6 traffic through the tunnel.<br>
    Gwredir6: boolean;
    // The IPv4 networks that will be accessible from the remote endpoint. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. This may
    // be left blank if not adding a route to the local network through this tunnel
    // on the remote machine. This is generally set to the LAN network.<br><br>This
    // field is only available when the following conditions are met:<br>- `gwredir`
    // must be equal to `false`<br>
    LocalNetwork: TStringDynArray;
    // The IPv6 networks that will be accessible from the remote endpoint. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. This may
    // be left blank if not adding a route to the local network through this tunnel
    // on the remote machine. This is generally set to the LAN network.<br><br>This
    // field is only available when the following conditions are met:<br>- `gwredir6`
    // must be equal to `false`<br>
    LocalNetworkv6: TStringDynArray;
    // IPv4 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetwork: TStringDynArray;
    // IPv6 networks that will be routed through the tunnel, so that a site-to-site
    // VPN can be established without manually changing the routing tables. Expressed
    // as a list of one or more CIDR ranges or host/network type aliases. If this
    // is a site-to-site VPN, enter the remote LAN/s here. May be left empty for non
    // site-to-site VPN.<br>
    RemoteNetworkv6: TStringDynArray;
    // The maximum number of clients allowed to concurrently connect to this server.<br>
    Maxclients: integer;
    // The compression mode allowed by this OpenVPN server. Compression can potentially
    // increase throughput but may allow an attacker to extract secrets if they can
    // control compressed plaintext traversing the VPN (e.g. HTTP)<br>
    AllowCompression: TEnumPfopenapi111;
    // Enables or disables setting the TOS IP header value of tunnel packets to match
    // the encapsulated packet value.<br>
    Passtos: boolean;
    // Enables or disables allowing communication between clients connected to this
    // server.<br>
    Client2client: boolean;
    // Enables or disable allowing the same user to connect multiple times.<br>
    DuplicateCn: boolean;
    // The number of concurrent connections a single user can have.<br><br>This field
    // is only available when the following conditions are met:<br>- `duplicate_cn`
    // must be equal to `true`<br>
    Connlimit: integer;
    // Enables or disables allowing connected clients to retain their connections
    // if their IP address changes.<br>
    DynamicIp: boolean;
    // The method used to supply a virtual adapter IP address to clients when using
    // TUN mode on IPv4.<br><br>This field is only available when the following conditions
    // are met:<br>- `dev_mode` must be equal to `'tun'`<br>
    Topology: TEnumPfopenapi112;
    // The amount of time (in seconds) until a client connection is closed for inactivity.<br>
    InactiveSeconds: integer;
    // The method used to define ping configuration.<br>
    PingMethod: TEnumPfopenapi113;
    // The keepalive interval parameter.<br><br>This field is only available when
    // the following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveInterval: integer;
    // The keepalive timeout parameter.<br><br>This field is only available when the
    // following conditions are met:<br>- `ping_method` must be equal to `'keepalive'`<br>
    KeepaliveTimeout: integer;
    // The number of seconds to accept no packets before sending a ping to the remote
    // peer over the TCP/UDP control channel.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingSeconds: integer;
    // Enables or disables push ping to the VPN client.<br><br>This field is only
    // available when the following conditions are met:<br>- `ping_method` must be
    // equal to `'ping'`<br>
    PingPush: boolean;
    // The action to take after a ping to the remote peer times-out.<br><br>This field
    // is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingAction: TEnumPfopenapi114;
    // The number of seconds that must elapse before the ping is considered a timeout
    // and the configured `ping_action` is performed.<br><br>This field is only available
    // when the following conditions are met:<br>- `ping_method` must be equal to
    // `'ping'`<br>
    PingActionSeconds: integer;
    // Enables or disables pushing the ping action to the VPN client.<br><br>This
    // field is only available when the following conditions are met:<br>- `ping_method`
    // must be equal to `'ping'`<br>
    PingActionPush: boolean;
    // The default domain to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsDomain: string;
    // The primary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer1: string;
    // The secondary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer2: string;
    // The tertiary DNS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    DnsServer3: string;
    // The quaternary DNS server to provide to clients.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be one of
    // [ server_user, server_tls_user ]<br>
    DnsServer4: string;
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
    // The primary NTP server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    NtpServer1: string;
    // The secondary NTP server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    NtpServer2: string;
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
    NetbiosScope: string;
    // The primary WINS server to provide to clients.<br><br>This field is only available
    // when the following conditions are met:<br>- `mode` must be one of [ server_user,
    // server_tls_user ]<br>
    WinsServer1: string;
    // The secondary WINS server to provide to clients.<br><br>This field is only
    // available when the following conditions are met:<br>- `mode` must be one of
    // [ server_user, server_tls_user ]<br>
    WinsServer2: string;
    // Additional options to add to the OpenVPN server configuration.<br>
    CustomOptions: TStringDynArray;
    // Enables or disable the username of the client being used in place of the certificate
    // common name for purposes such as determining Client Specific Overrides.<br><br>This
    // field is only available when the following conditions are met:<br>- `mode`
    // must be one of [ server_user, server_tls_user ]<br>
    UsernameAsCommonName: boolean;
    // The send and receive buffer size for OpenVPN. Set to null to use the system
    // default.<br>
    Sndrcvbuf: integer;
    // The gateway type(s) that will be created when a virtual interface is assigned
    // to this OpenVPN server<br>
    CreateGw: TEnumPfopenapi116;
    // The OpenVPN logging verbosity level.<br>
    VerbosityLevel: integer;
  end;
  POpenVPNServer = ^TOpenVPNServer;

  TWireGuardApply = packed record
    // Displays `true` when all WireGuard changes are applied and there are no pending
    // changes left.Displays `false` when there are pending WireGuard changes that
    // have not been applied.<br>
    Applied: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PWireGuardApply = ^TWireGuardApply;

  TWireGuardPeerAllowedIP = packed record
    // The IPv4 or IPv6 address for this peer IP.<br>
    Address: string;
    // The subnet mask for this peer IP.<br>
    Mask: integer;
    // A description for this allowed peer IP.<br>
    Descr: string;
  end;
  PWireGuardPeerAllowedIP = ^TWireGuardPeerAllowedIP;

  TWireGuardPeer = packed record
    // Enables or disables this WireGuard peer.<br>
    Enabled: boolean;
    // The WireGuard tunnel for this peer.<br>
    Tun: string;
    // The IP address or hostname of the remote peer. Set to `null` to make this a
    // dynamic endpoint.<br>
    Endpoint: string;
    // The port used by the remote peer. Valid options are: a TCP/UDP port number<br><br>This
    // field is only available when the following conditions are met:<br>- `endpoint`
    // must not be equal to `NULL`<br>
    Port: string;
    // The description for this peer.<br>
    Descr: string;
    // The interval (in seconds) for Keep Alive packets sent to this peer. Set to
    // `null` to disable.<br>
    Persistentkeepalive: integer;
    // The public key for this peer.<br>
    Publickey: string;
    // The pre-shared key for this tunnel.<br>
    Presharedkey: string;
    // The allowed IP/subnets for this WireGuard peer.<br>
    Allowedips: variant;
  end;
  PWireGuardPeer = ^TWireGuardPeer;

  TWireGuardSettings = packed record
    // Enables or disables WireGuard on this system. WireGuard cannot be disabled
    // when one or more tunnels is assigned to a pfSense interface.<br>
    Enable: boolean;
    // Enables or disables keeping the WireGuard configuration when the package is
    // uninstalled/reinstalled.<br>
    KeepConf: boolean;
    // Enables or disables tracking the 'Aliases Hostnames Resolve Interval' value
    // as the `resolve_internal` value instead of specifying a value directly.<br>
    ResolveIntervalTrack: boolean;
    // The interval (in seconds) for re-resolving endpoint host/domain names.<br><br>This
    // field is only available when the following conditions are met:<br>- `resolve_interval_track`
    // must be equal to `false`<br>
    ResolveInterval: integer;
    // Configures which WireGuard tunnels are members of the WireGuard interface group.<br>
    InterfaceGroup: TEnumPfopenapi118;
    // Enables or disables hiding all secrets (private and pre-shared keys) in the
    // user interface.<br>
    HideSecrets: boolean;
    // Enables or disables initially hiding all peers in the user interface.<br>
    HidePeers: boolean;
    // for Delphi 7-2009 compatibility
    dummy_: RawUtf8;
  end;
  PWireGuardSettings = ^TWireGuardSettings;

  TWireGuardTunnelAddress = packed record
    // The IPv4 or IPv6 address for this WireGuard tunnel.<br>
    Address: string;
    // The subnet mask for this WireGuard tunnel.<br>
    Mask: integer;
    // A description for this WireGuard tunnel address entry.<br>
    Descr: string;
  end;
  PWireGuardTunnelAddress = ^TWireGuardTunnelAddress;

  TWireGuardTunnel = packed record
    // The name of the WireGuard interface. This value is automatically assigned by
    // the system and cannot be changed.<br>
    Name: string;
    // Enables or disables this tunnels and any associated peers.<br>
    Enabled: boolean;
    // The port WireGuard will listen on for this tunnel. Valid options are: a TCP/UDP
    // port number<br>
    Listenport: string;
    // The public key for this tunnel. This value is automatically derived from the
    // `privatekey` value and cannot be set manually.<br>
    Publickey: string;
    // The private key for this tunnel.<br>
    Privatekey: string;
    // The MTU for this WireGuard tunnel interface. This value is ignored if this
    // tunnel is assigned as a pfSense interface.<br>
    Mtu: integer;
    // The IPv4 or IPv6 addresses to assign this WireGuard tunnel interface. This
    // field is ignored if this tunnel interface is assigned to an existing pfSense
    // interface object.<br>
    Addresses: variant;
  end;
  PWireGuardTunnel = ^TWireGuardTunnel;



const
  // define how enums/sets are actually transmitted as JSON array of string
  ENUMPFOPENAPI1_TXT: array[TEnumPfopenapi1] of RawUtf8 = (
    '', 'sha256', 'sha384', 'sha512');
  ENUMPFOPENAPI2_TXT: array[TEnumPfopenapi2] of RawUtf8 = (
    '', 'host', 'network', 'port');
  ENUMPFOPENAPI3_TXT: array[TEnumPfopenapi3] of RawUtf8 = (
    '', 'disable', 'enable');
  ENUMPFOPENAPI4_TXT: array[TEnumPfopenapi4] of RawUtf8 = (
    '', 'inet', 'inet6');
  ENUMPFOPENAPI5_TXT: array[TEnumPfopenapi5] of RawUtf8 = (
    '', 'ah', 'esp', 'gre', 'icmp', 'igmp', 'ipv6', 'ospf', 'pim', 'tcp',
    'tcp/udp', 'udp');
  ENUMPFOPENAPI6_TXT: array[TEnumPfopenapi6] of RawUtf8 = (
    '', 'bitmask', 'random', 'random sticky-address', 'round-robin', 'round-robin sticky-address',
    'source-hash');
  ENUMPFOPENAPI7_TXT: array[TEnumPfopenapi7] of RawUtf8 = (
    '', 'advanced', 'automatic', 'disabled', 'hybrid');
  ENUMPFOPENAPI8_TXT: array[TEnumPfopenapi8] of RawUtf8 = (
    '', 'inet', 'inet46', 'inet6');
  ENUMPFOPENAPI9_TXT: array[TEnumPfopenapi9] of RawUtf8 = (
    '', 'disable', 'enable', 'purenat');
  ENUMPFOPENAPI10_TXT: array[TEnumPfopenapi10] of RawUtf8 = (
    '', 'block', 'pass', 'reject');
  ENUMPFOPENAPI11_TXT: array[TEnumPfopenapi11] of RawUtf8 = (
    '', 'ah', 'carp', 'esp', 'gre', 'icmp', 'igmp', 'ipv6', 'ospf', 'pfsync',
    'pim', 'tcp', 'tcp/udp', 'udp');
  ENUMPFOPENAPI12_TXT: array[TEnumPfopenapi12] of RawUtf8 = (
    '', 'althost', 'any', 'dataconv', 'echorep', 'echoreq', 'inforep',
    'inforeq', 'ipv6-here', 'ipv6-where', 'maskrep', 'maskreq', 'mobredir',
    'mobregrep', 'mobregreq', 'paramprob', 'photuris', 'redir', 'routeradv',
    'routersol', 'skip', 'squench', 'timerep', 'timereq', 'timex', 'trace',
    'unreach');
  ENUMPFOPENAPI13_TXT: array[TEnumPfopenapi13] of RawUtf8 = (
    '', 'keep state', 'none', 'sloppy state', 'synproxy state');
  ENUMPFOPENAPI14_TXT: array[TEnumPfopenapi14] of RawUtf8 = (
    '', 'ack', 'cwr', 'ece', 'fin', 'psh', 'rst', 'syn', 'urg');
  ENUMPFOPENAPI15_TXT: array[TEnumPfopenapi15] of RawUtf8 = (
    '', 'any', 'in', 'out');
  ENUMPFOPENAPI16_TXT: array[TEnumPfopenapi16] of RawUtf8 = (
    '', 'CBQ', 'CODELQ', 'FAIRQ', 'HFSC', 'PRIQ');
  ENUMPFOPENAPI17_TXT: array[TEnumPfopenapi17] of RawUtf8 = (
    '', '%', 'Gb', 'Kb', 'Mb', 'b');
  ENUMPFOPENAPI18_TXT: array[TEnumPfopenapi18] of RawUtf8 = (
    '', 'Kb', 'Mb', 'b');
  ENUMPFOPENAPI19_TXT: array[TEnumPfopenapi19] of RawUtf8 = (
    '', 'dstaddress', 'none', 'srcaddress');
  ENUMPFOPENAPI20_TXT: array[TEnumPfopenapi20] of RawUtf8 = (
    '', 'codel', 'droptail', 'gred', 'pie', 'red');
  ENUMPFOPENAPI21_TXT: array[TEnumPfopenapi21] of RawUtf8 = (
    '', 'fifo', 'fq_codel', 'fq_pie', 'prio', 'qfq', 'rr', 'wf2q+');
  ENUMPFOPENAPI22_TXT: array[TEnumPfopenapi22] of RawUtf8 = (
    '', 'carp', 'ipalias', 'other', 'proxyarp');
  ENUMPFOPENAPI23_TXT: array[TEnumPfopenapi23] of RawUtf8 = (
    '', 'network', 'single');
  ENUMPFOPENAPI24_TXT: array[TEnumPfopenapi24] of RawUtf8 = (
    '', 'mcast', 'ucast');
  ENUMPFOPENAPI25_TXT: array[TEnumPfopenapi25] of RawUtf8 = (
    '', 'failover', 'lacp', 'loadbalance', 'none', 'roundrobin');
  ENUMPFOPENAPI26_TXT: array[TEnumPfopenapi26] of RawUtf8 = (
    '', 'fast', 'slow');
  ENUMPFOPENAPI27_TXT: array[TEnumPfopenapi27] of RawUtf8 = (
    '', 'l2', 'l2,l3', 'l2,l3,l4', 'l2,l4', 'l3', 'l3,l4', 'l4');
  ENUMPFOPENAPI28_TXT: array[TEnumPfopenapi28] of RawUtf8 = (
    '', 'dhcp', 'none', 'static');
  ENUMPFOPENAPI29_TXT: array[TEnumPfopenapi29] of RawUtf8 = (
    '', 'SavedCfg');
  ENUMPFOPENAPI30_TXT: array[TEnumPfopenapi30] of RawUtf8 = (
    '', '6rd', '6to4', 'dhcp6', 'none', 'slaac', 'staticv6', 'track6');
  ENUMPFOPENAPI31_TXT: array[TEnumPfopenapi31] of RawUtf8 = (
    '', '', 'down', 'none');
  ENUMPFOPENAPI32_TXT: array[TEnumPfopenapi32] of RawUtf8 = (
    '', 'down', 'downlatency', 'downloss', 'downlosslatency');
  ENUMPFOPENAPI33_TXT: array[TEnumPfopenapi33] of RawUtf8 = (
    '', 'active', 'disabled');
  ENUMPFOPENAPI34_TXT: array[TEnumPfopenapi34] of RawUtf8 = (
    '', 'php_command', 'servicerestart', 'shellcommand', 'xmlrpcservicerestart');
  ENUMPFOPENAPI35_TXT: array[TEnumPfopenapi35] of RawUtf8 = (
    '', '', '157', '161', '162', '163', '164', '165');
  ENUMPFOPENAPI36_TXT: array[TEnumPfopenapi36] of RawUtf8 = (
    '', '', 'https:\/\/core.thermo.io', 'https:\/\/my.futurehosting.com',
    'https:\/\/portal.nexcess.net');
  ENUMPFOPENAPI37_TXT: array[TEnumPfopenapi37] of RawUtf8 = (
    '', '', 'kimsufi-ca', 'kimsufi-eu', 'ovh-ca', 'ovh-eu', 'runabove-ca',
    'soyoustart-ca', 'soyoustart-eu');
  ENUMPFOPENAPI38_TXT: array[TEnumPfopenapi38] of RawUtf8 = (
    '', '2048', '3072', '4096', 'custom', 'ec-256', 'ec-384');
  ENUMPFOPENAPI39_TXT: array[TEnumPfopenapi39] of RawUtf8 = (
    '', '', '-4', '-6');
  ENUMPFOPENAPI40_TXT: array[TEnumPfopenapi40] of RawUtf8 = (
    '', 'critical', 'debug 1', 'debug 3', 'debug 5', 'dynamic', 'error',
    'info', 'notice', 'warning');
  ENUMPFOPENAPI41_TXT: array[TEnumPfopenapi41] of RawUtf8 = (
    '', 'client', 'config', 'database', 'default', 'dispatch', 'dnssec',
    'general', 'lame-servers', 'network', 'notify', 'queries', 'resolver',
    'security', 'unmatched', 'update', 'xfer-in', 'xfer-out');
  ENUMPFOPENAPI42_TXT: array[TEnumPfopenapi42] of RawUtf8 = (
    '', 'auto', 'off', 'on');
  ENUMPFOPENAPI43_TXT: array[TEnumPfopenapi43] of RawUtf8 = (
    '', 'http', 'https');
  ENUMPFOPENAPI44_TXT: array[TEnumPfopenapi44] of RawUtf8 = (
    '', 'auto', 'disabled', 'manual');
  ENUMPFOPENAPI45_TXT: array[TEnumPfopenapi45] of RawUtf8 = (
    '', 'forward', 'master', 'redirect', 'slave');
  ENUMPFOPENAPI46_TXT: array[TEnumPfopenapi46] of RawUtf8 = (
    '', 'A', 'AAAA', 'CNAME', 'LOC', 'MX', 'NS', 'PTR', 'SPF', 'SRV', 'TXT');
  ENUMPFOPENAPI47_TXT: array[TEnumPfopenapi47] of RawUtf8 = (
    '', 'class', 'enabled');
  ENUMPFOPENAPI48_TXT: array[TEnumPfopenapi48] of RawUtf8 = (
    '', 'isc', 'kea');
  ENUMPFOPENAPI49_TXT: array[TEnumPfopenapi49] of RawUtf8 = (
    '', 'boolean', 'ip-address', 'signed integer 16', 'signed integer 32',
    'signed integer 8', 'string', 'text', 'unsigned integer 16', 'unsigned integer 32',
    'unsigned integer 8');
  ENUMPFOPENAPI50_TXT: array[TEnumPfopenapi50] of RawUtf8 = (
    '', 'allow', 'allow snoop', 'deny', 'deny nonlocal', 'refuse', 'refuse nonlocal');
  ENUMPFOPENAPI51_TXT: array[TEnumPfopenapi51] of RawUtf8 = (
    '', 'deny', 'inform', 'inform_deny', 'nodefault', 'redirect', 'refuse',
    'static', 'transparent', 'typetransparent');
  ENUMPFOPENAPI52_TXT: array[TEnumPfopenapi52] of RawUtf8 = (
    '', 'post_validator', 'pre_validator');
  ENUMPFOPENAPI53_TXT: array[TEnumPfopenapi53] of RawUtf8 = (
    '', 'backendservercount', 'custom', 'host_contains', 'host_ends_with',
    'host_matches', 'host_regex', 'host_starts_with', 'path_contains',
    'path_dir', 'path_ends_with', 'path_matches', 'path_regex', 'path_starts_with',
    'source_ip', 'ssl_c_ca_commonname', 'ssl_c_verify', 'ssl_c_verify_code',
    'ssl_sni_contains', 'ssl_sni_ends_with', 'ssl_sni_matches', 'ssl_sni_regex',
    'ssl_sni_starts_with', 'traffic_is_http', 'traffic_is_ssl', 'url_parameter');
  ENUMPFOPENAPI54_TXT: array[TEnumPfopenapi54] of RawUtf8 = (
    '', 'custom', 'http-after-response_add-header', 'http-after-response_del-header',
    'http-after-response_replace-header', 'http-after-response_replace-value',
    'http-after-response_set-header', 'http-after-response_set-status',
    'http-request_add-header', 'http-request_allow', 'http-request_auth',
    'http-request_del-header', 'http-request_deny', 'http-request_lua',
    'http-request_redirect', 'http-request_replace-header', 'http-request_replace-path',
    'http-request_replace-value', 'http-request_set-header', 'http-request_set-method',
    'http-request_set-path', 'http-request_set-query', 'http-request_set-uri',
    'http-request_tarpit', 'http-request_use-service', 'http-response_add-header',
    'http-response_allow', 'http-response_del-header', 'http-response_deny',
    'http-response_lua', 'http-response_replace-header', 'http-response_replace-value',
    'http-response_set-header', 'http-response_set-status', 'tcp-request_connection_accept',
    'tcp-request_connection_reject', 'tcp-request_content_accept', 'tcp-request_content_lua',
    'tcp-request_content_reject', 'tcp-request_content_use-service', 'tcp-response_content_accept',
    'tcp-response_content_close', 'tcp-response_content_lua', 'tcp-response_content_reject',
    'use_server');
  ENUMPFOPENAPI55_TXT: array[TEnumPfopenapi55] of RawUtf8 = (
    '', '', 'leastconn', 'roundrobin', 'source', 'static-rr', 'uri');
  ENUMPFOPENAPI56_TXT: array[TEnumPfopenapi56] of RawUtf8 = (
    '', 'Basic', 'ESMTP', 'HTTP', 'LDAP', 'MySQL', 'PostgreSQL', 'Redis',
    'SMTP', 'SSL', 'none');
  ENUMPFOPENAPI57_TXT: array[TEnumPfopenapi57] of RawUtf8 = (
    '', 'DELETE', 'GET', 'HEAD', 'OPTIONS', 'POST', 'PUT', 'TRACE');
  ENUMPFOPENAPI58_TXT: array[TEnumPfopenapi58] of RawUtf8 = (
    '', 'insert-only', 'insert-only-silent', 'passive', 'passive-session-prefix',
    'passive-silent', 'reset', 'session-prefix', 'set', 'set-silent');
  ENUMPFOPENAPI59_TXT: array[TEnumPfopenapi59] of RawUtf8 = (
    '', 'none', 'stick_cookie_value', 'stick_rdp_cookie', 'stick_sourceipv4',
    'stick_sourceipv6', 'stick_sslsessionid');
  ENUMPFOPENAPI60_TXT: array[TEnumPfopenapi60] of RawUtf8 = (
    '', '', 'alert', 'crit', 'debug', 'dontlog', 'emerg', 'err', 'info',
    'notice', 'warning');
  ENUMPFOPENAPI61_TXT: array[TEnumPfopenapi61] of RawUtf8 = (
    '', 'active', 'backup', 'disabled', 'inactive');
  ENUMPFOPENAPI62_TXT: array[TEnumPfopenapi62] of RawUtf8 = (
    '', 'luascript', 'writetodisk');
  ENUMPFOPENAPI63_TXT: array[TEnumPfopenapi63] of RawUtf8 = (
    '', 'custom', 'http-after-response_add-header', 'http-after-response_del-header',
    'http-after-response_replace-header', 'http-after-response_replace-value',
    'http-after-response_set-header', 'http-after-response_set-status',
    'http-request_add-header', 'http-request_allow', 'http-request_auth',
    'http-request_del-header', 'http-request_deny', 'http-request_lua',
    'http-request_redirect', 'http-request_replace-header', 'http-request_replace-path',
    'http-request_replace-value', 'http-request_set-header', 'http-request_set-method',
    'http-request_set-path', 'http-request_set-query', 'http-request_set-uri',
    'http-request_tarpit', 'http-request_use-service', 'http-response_add-header',
    'http-response_allow', 'http-response_del-header', 'http-response_deny',
    'http-response_lua', 'http-response_replace-header', 'http-response_replace-value',
    'http-response_set-header', 'http-response_set-status', 'tcp-request_connection_accept',
    'tcp-request_connection_reject', 'tcp-request_content_accept', 'tcp-request_content_lua',
    'tcp-request_content_reject', 'tcp-request_content_use-service', 'tcp-response_content_accept',
    'tcp-response_content_close', 'tcp-response_content_lua', 'tcp-response_content_reject',
    'use_backend');
  ENUMPFOPENAPI64_TXT: array[TEnumPfopenapi64] of RawUtf8 = (
    '', 'any_ipv4', 'any_ipv6', 'custom', 'localhost_ipv4', 'localhost_ipv6');
  ENUMPFOPENAPI65_TXT: array[TEnumPfopenapi65] of RawUtf8 = (
    '', 'http', 'https', 'tcp');
  ENUMPFOPENAPI66_TXT: array[TEnumPfopenapi66] of RawUtf8 = (
    '', 'forceclose', 'http-keep-alive', 'http-server-close', 'http-tunnel',
    'httpclose');
  ENUMPFOPENAPI67_TXT: array[TEnumPfopenapi67] of RawUtf8 = (
    '', 'audit', 'auth', 'auth2', 'cron', 'cron2', 'daemon', 'ftp', 'kern',
    'local0', 'local1', 'local2', 'local3', 'local4', 'local5', 'local6',
    'local7', 'lpr', 'mail', 'news', 'ntp', 'syslog', 'user', 'uucp');
  ENUMPFOPENAPI68_TXT: array[TEnumPfopenapi68] of RawUtf8 = (
    '', 'alert', 'crit', 'debug', 'emerg', 'err', 'info', 'notice', 'warning');
  ENUMPFOPENAPI69_TXT: array[TEnumPfopenapi69] of RawUtf8 = (
    '', '', 'alert', 'crit', 'debug', 'emerg', 'err', 'info', 'notice',
    'warning');
  ENUMPFOPENAPI70_TXT: array[TEnumPfopenapi70] of RawUtf8 = (
    '', 'auto', 'intermediate', 'modern', 'old');
  ENUMPFOPENAPI71_TXT: array[TEnumPfopenapi71] of RawUtf8 = (
    '', '', '10', '11', '12', '13', '14', '15', '16', '17', '3', '4', '5',
    '6', '7', '8', '9', 'omit');
  ENUMPFOPENAPI72_TXT: array[TEnumPfopenapi72] of RawUtf8 = (
    '', 'auto', 'inet', 'inet6');
  ENUMPFOPENAPI73_TXT: array[TEnumPfopenapi73] of RawUtf8 = (
    '', 'md5', 'sha1', 'sha256');
  ENUMPFOPENAPI74_TXT: array[TEnumPfopenapi74] of RawUtf8 = (
    '', 'peer', 'pool', 'server');
  ENUMPFOPENAPI75_TXT: array[TEnumPfopenapi75] of RawUtf8 = (
    '', 'both', 'enabled');
  ENUMPFOPENAPI76_TXT: array[TEnumPfopenapi76] of RawUtf8 = (
    '', 'rfc3164', 'rfc5424');
  ENUMPFOPENAPI77_TXT: array[TEnumPfopenapi77] of RawUtf8 = (
    '', 'bzip2', 'gzip', 'none', 'xz', 'zstd');
  ENUMPFOPENAPI78_TXT: array[TEnumPfopenapi78] of RawUtf8 = (
    '', 'ipv4', 'ipv6');
  ENUMPFOPENAPI79_TXT: array[TEnumPfopenapi79] of RawUtf8 = (
    '', 'restart', 'start', 'stop');
  ENUMPFOPENAPI80_TXT: array[TEnumPfopenapi80] of RawUtf8 = (
    '', 'existing', 'internal');
  ENUMPFOPENAPI81_TXT: array[TEnumPfopenapi81] of RawUtf8 = (
    '', 'ECDSA', 'RSA');
  ENUMPFOPENAPI82_TXT: array[TEnumPfopenapi82] of RawUtf8 = (
    '', 'server', 'user');
  ENUMPFOPENAPI83_TXT: array[TEnumPfopenapi83] of RawUtf8 = (
    '', 'high', 'legacy', 'low');
  ENUMPFOPENAPI84_TXT: array[TEnumPfopenapi84] of RawUtf8 = (
    '', 'local', 'remote');
  ENUMPFOPENAPI85_TXT: array[TEnumPfopenapi85] of RawUtf8 = (
    '', 'LOGIN', 'PLAIN');
  ENUMPFOPENAPI86_TXT: array[TEnumPfopenapi86] of RawUtf8 = (
    '', 'allow', 'deny');
  ENUMPFOPENAPI87_TXT: array[TEnumPfopenapi87] of RawUtf8 = (
    '', 'descr', 'id', 'if');
  ENUMPFOPENAPI88_TXT: array[TEnumPfopenapi88] of RawUtf8 = (
    '', 'ldap', 'radius');
  ENUMPFOPENAPI89_TXT: array[TEnumPfopenapi89] of RawUtf8 = (
    '', 'SSL/TLS Encrypted', 'STARTTLS Encrypt', 'Standard TCP');
  ENUMPFOPENAPI90_TXT: array[TEnumPfopenapi90] of RawUtf8 = (
    '', 'one', 'subtree');
  ENUMPFOPENAPI91_TXT: array[TEnumPfopenapi91] of RawUtf8 = (
    '', 'CHAP_MD5', 'MSCHAPv1', 'MSCHAPv2', 'PAP');
  ENUMPFOPENAPI92_TXT: array[TEnumPfopenapi92] of RawUtf8 = (
    '', 'aes', 'aes128gcm', 'aes192gcm', 'aes256gcm', 'chacha20poly1305');
  ENUMPFOPENAPI93_TXT: array[TEnumPfopenapi93] of RawUtf8 = (
    '', 'aesxcbc', 'sha1', 'sha256', 'sha384', 'sha512');
  ENUMPFOPENAPI94_TXT: array[TEnumPfopenapi94] of RawUtf8 = (
    '', 'auto', 'ikev1', 'ikev2');
  ENUMPFOPENAPI95_TXT: array[TEnumPfopenapi95] of RawUtf8 = (
    '', 'aggressive', 'main');
  ENUMPFOPENAPI96_TXT: array[TEnumPfopenapi96] of RawUtf8 = (
    '', 'both', 'inet', 'inet6');
  ENUMPFOPENAPI97_TXT: array[TEnumPfopenapi97] of RawUtf8 = (
    '', 'cert', 'pre_shared_key');
  ENUMPFOPENAPI98_TXT: array[TEnumPfopenapi98] of RawUtf8 = (
    '', 'address', 'asn1dn', 'auto', 'dyn_dns', 'fqdn', 'keyid tag', 'myaddress',
    'user_fqdn');
  ENUMPFOPENAPI99_TXT: array[TEnumPfopenapi99] of RawUtf8 = (
    '', 'address', 'any', 'asn1dn', 'auto', 'dyn_dns', 'fqdn', 'keyid tag',
    'peeraddress', 'user_fqdn');
  ENUMPFOPENAPI100_TXT: array[TEnumPfopenapi100] of RawUtf8 = (
    '', '', 'none', 'start', 'trap');
  ENUMPFOPENAPI101_TXT: array[TEnumPfopenapi101] of RawUtf8 = (
    '', 'force', 'on');
  ENUMPFOPENAPI102_TXT: array[TEnumPfopenapi102] of RawUtf8 = (
    '', 'transport', 'tunnel', 'tunnel6', 'vti');
  ENUMPFOPENAPI103_TXT: array[TEnumPfopenapi103] of RawUtf8 = (
    '', 'ah', 'esp');
  ENUMPFOPENAPI104_TXT: array[TEnumPfopenapi104] of RawUtf8 = (
    '', 'aesxcbc', 'hmac_sha1', 'hmac_sha256', 'hmac_sha384', 'hmac_sha512');
  ENUMPFOPENAPI105_TXT: array[TEnumPfopenapi105] of RawUtf8 = (
    '', 'p2p_tls');
  ENUMPFOPENAPI106_TXT: array[TEnumPfopenapi106] of RawUtf8 = (
    '', 'tap', 'tun');
  ENUMPFOPENAPI107_TXT: array[TEnumPfopenapi107] of RawUtf8 = (
    '', 'TCP', 'TCP4', 'TCP6', 'UDP', 'UDP4', 'UDP6');
  ENUMPFOPENAPI108_TXT: array[TEnumPfopenapi108] of RawUtf8 = (
    '', 'basic', 'none', 'ntlm');
  ENUMPFOPENAPI109_TXT: array[TEnumPfopenapi109] of RawUtf8 = (
    '', 'auth', 'crypt');
  ENUMPFOPENAPI110_TXT: array[TEnumPfopenapi110] of RawUtf8 = (
    '', '0', '1', '2', 'default');
  ENUMPFOPENAPI111_TXT: array[TEnumPfopenapi111] of RawUtf8 = (
    '', 'asym', 'no', 'yes');
  ENUMPFOPENAPI112_TXT: array[TEnumPfopenapi112] of RawUtf8 = (
    '', 'net30', 'subnet');
  ENUMPFOPENAPI113_TXT: array[TEnumPfopenapi113] of RawUtf8 = (
    '', 'keepalive', 'ping');
  ENUMPFOPENAPI114_TXT: array[TEnumPfopenapi114] of RawUtf8 = (
    '', 'ping_exit', 'ping_restart');
  ENUMPFOPENAPI115_TXT: array[TEnumPfopenapi115] of RawUtf8 = (
    '', '1', '2', '3', '4', '5', 'none');
  ENUMPFOPENAPI116_TXT: array[TEnumPfopenapi116] of RawUtf8 = (
    '', 'both', 'v4only', 'v6only');
  ENUMPFOPENAPI117_TXT: array[TEnumPfopenapi117] of RawUtf8 = (
    '', 'p2p_tls', 'server_tls', 'server_tls_user', 'server_user');
  ENUMPFOPENAPI118_TXT: array[TEnumPfopenapi118] of RawUtf8 = (
    '', 'all', 'none', 'unassigned');
  ENUMPFOPENAPI119_TXT: array[TEnumPfopenapi119] of RawUtf8 = (
    '', 'SORT_ASC', 'SORT_DESC');
  ENUMPFOPENAPI120_TXT: array[TEnumPfopenapi120] of RawUtf8 = (
    '', 'SORT_FLAG_CASE', 'SORT_LOCALE_STRING', 'SORT_NATURAL', 'SORT_NUMERIC',
    'SORT_REGULAR', 'SORT_STRING');


implementation

{ ************ Custom RTTI/JSON initialization }

const
  // exact definition of the DTOs expected JSON serialization
  _TAuthenticationError = 'code:integer status:string response_id:string ' +
    'message:string data:variant _links:variant';
  _TConflictError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TFailedDependencyError = 'code:integer status:string response_id:string ' +
    'message:string data:variant _links:variant';
  _TForbiddenError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TDtoPfopenapi2 = 'response_id:string';
  _TDtoPfopenapi3 = 'line:integer column:integer _:RawUtf8';
  _TDtoPfopenapi1 = 'message:string extensions:TDtoPfopenapi2 locations:array of TDtoPfopenapi3 ' +
    'path:TStringDynArray';
  _TGraphQLResponse = 'data:variant errors:array of TDtoPfopenapi1';
  _TMediaTypeError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TMethodNotAllowedError = 'code:integer status:string response_id:string ' +
    'message:string data:variant _links:variant';
  _TNotAcceptableError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TNotFoundError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TServerError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TServiceUnavailableError = 'code:integer status:string response_id:string ' +
    'message:string data:variant _links:variant';
  _TSuccess = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TUnprocessableContentError = 'code:integer status:string response_id:string ' +
    'message:string data:variant _links:variant';
  _TValidationError = 'code:integer status:string response_id:string message:string ' +
    'data:variant _links:variant';
  _TRESTAPIJWT = 'token:string';
  _TRESTAPIKey = 'descr:string username:string hash_algo:TEnumPfopenapi1 ' +
    'length_bytes:integer hash:string key:string';
  _TARPTable = 'hostname:string ip_address:string mac_address:string interface:string ' +
    'type:string permanent:boolean dnsresolve:string expires:string';
  _TCommandPrompt = 'command:string output:string result_code:integer';
  _TConfigHistoryRevision = 'time:integer description:string version:string ' +
    'filesize:integer';
  _TSystemHalt = 'dry_run:boolean _:RawUtf8';
  _TSystemReboot = 'dry_run:boolean _:RawUtf8';
  _TFirewallAdvancedSettings = 'aliasesresolveinterval:integer checkaliasesurlcert:boolean _:RawUtf8';
  _TFirewallAlias = 'name:string type:TEnumPfopenapi2 descr:string address:TStringDynArray ' +
    'detail:TStringDynArray';
  _TFirewallApply = 'applied:boolean pending_subsystems:TStringDynArray';
  _TOneToOneNATMapping = 'interface:string disabled:boolean nobinat:boolean ' +
    'natreflection:TEnumPfopenapi3 ipprotocol:TEnumPfopenapi4 external:string ' +
    'source:string destination:string descr:string';
  _TOutboundNATMapping = 'interface:string protocol:TEnumPfopenapi5 disabled:boolean ' +
    'nonat:boolean nosync:boolean source:string source_port:string destination:string ' +
    'destination_port:string target:string target_subnet:integer nat_port:string ' +
    'static_nat_port:boolean poolopts:TEnumPfopenapi6 source_hash_key:string ' +
    'descr:string';
  _TOutboundNATMode = 'mode:TEnumPfopenapi7 _:RawUtf8';
  _TPortForward = 'interface:string ipprotocol:TEnumPfopenapi8 protocol:TEnumPfopenapi5 ' +
    'source:string source_port:string destination:string destination_port:string ' +
    'target:string local_port:string disabled:boolean nordr:boolean nosync:boolean ' +
    'descr:string natreflection:TEnumPfopenapi9 associated_rule_id:string created_time:integer ' +
    'created_by:string updated_time:integer updated_by:string';
  _TFirewallRule = 'type:TEnumPfopenapi10 interface:TStringDynArray ipprotocol:TEnumPfopenapi8 ' +
    'protocol:TEnumPfopenapi11 icmptype:TEnumPfopenapi12Set source:string source_port:string ' +
    'destination:string destination_port:string descr:string disabled:boolean ' +
    'log:boolean tag:string statetype:TEnumPfopenapi13 tcp_flags_any:boolean ' +
    'tcp_flags_out_of:TEnumPfopenapi14Set tcp_flags_set:TEnumPfopenapi14Set ' +
    'gateway:string sched:string dnpipe:string pdnpipe:string defaultqueue:string ' +
    'ackqueue:string floating:boolean quick:boolean direction:TEnumPfopenapi15 ' +
    'tracker:integer associated_rule_id:string created_time:integer created_by:string ' +
    'updated_time:integer updated_by:string';
  _TFirewallSchedule = 'schedlabel:string name:string descr:string active:boolean ' +
    'timerange:variant';
  _TFirewallScheduleTimeRange = 'position:TIntegerDynArray month:TIntegerDynArray ' +
    'day:TIntegerDynArray hour:string rangedescr:string';
  _TFirewallState = 'interface:string protocol:string direction:string source:string ' +
    'destination:string state:string age:string expires_in:string packets_total:integer ' +
    'packets_in:integer packets_out:integer bytes_total:integer bytes_in:integer ' +
    'bytes_out:integer';
  _TFirewallStatesSize = 'maximumstates:integer defaultmaximumstates:integer ' +
    'currentstates:integer _:RawUtf8';
  _TTrafficShaper = 'enabled:boolean interface:string name:string scheduler:TEnumPfopenapi16 ' +
    'bandwidthtype:TEnumPfopenapi17 bandwidth:integer qlimit:integer tbrconfig:integer ' +
    'queue:variant';
  _TTrafficShaperLimiterBandwidth = 'bw:integer bwscale:TEnumPfopenapi18 ' +
    'bwsched:string';
  _TTrafficShaperLimiter = 'name:string number:integer enabled:boolean mask:TEnumPfopenapi19 ' +
    'maskbits:integer maskbitsv6:integer qlimit:integer ecn:boolean description:string ' +
    'aqm:TEnumPfopenapi20 sched:TEnumPfopenapi21 param_codel_target:integer ' +
    'param_codel_interval:integer param_pie_target:integer param_pie_tupdate:integer ' +
    'param_pie_alpha:integer param_pie_beta:integer param_pie_max_burst:integer ' +
    'param_pie_max_ecnth:integer pie_onoff:boolean pie_capdrop:boolean pie_qdelay:boolean ' +
    'pie_pderand:boolean param_red_w_q:integer param_red_min_th:integer param_red_max_th:integer ' +
    'param_red_max_p:integer param_gred_w_q:integer param_gred_min_th:integer ' +
    'param_gred_max_th:integer param_gred_max_p:integer param_fq_codel_target:integer ' +
    'param_fq_codel_interval:integer param_fq_codel_quantum:integer param_fq_codel_limit:integer ' +
    'param_fq_codel_flows:integer param_fq_pie_target:integer param_fq_pie_tupdate:integer ' +
    'param_fq_pie_alpha:integer param_fq_pie_beta:integer param_fq_pie_max_burst:integer ' +
    'param_fq_pie_max_ecnth:integer param_fq_pie_quantum:integer param_fq_pie_limit:integer ' +
    'param_fq_pie_flows:integer delay:integer plr:single buckets:integer bandwidth:variant ' +
    'queue:variant';
  _TTrafficShaperLimiterQueue = 'name:string number:integer enabled:boolean ' +
    'mask:TEnumPfopenapi19 maskbits:integer maskbitsv6:integer qlimit:integer ' +
    'ecn:boolean description:string aqm:TEnumPfopenapi20 param_codel_target:integer ' +
    'param_codel_interval:integer param_pie_target:integer param_pie_tupdate:integer ' +
    'param_pie_alpha:integer param_pie_beta:integer param_pie_max_burst:integer ' +
    'param_pie_max_ecnth:integer pie_onoff:boolean pie_capdrop:boolean pie_qdelay:boolean ' +
    'pie_pderand:boolean param_red_w_q:integer param_red_min_th:integer param_red_max_th:integer ' +
    'param_red_max_p:integer param_gred_w_q:integer param_gred_min_th:integer ' +
    'param_gred_max_th:integer param_gred_max_p:integer weight:integer plr:single ' +
    'buckets:integer';
  _TTrafficShaperQueue = 'interface:string enabled:boolean name:string priority:integer ' +
    'qlimit:integer description:string default:boolean red:boolean rio:boolean ' +
    'ecn:boolean codel:boolean bandwidthtype:TEnumPfopenapi17 bandwidth:integer ' +
    'buckets:integer hogs:integer borrow:boolean upperlimit:boolean upperlimit_m1:string ' +
    'upperlimit_d:integer upperlimit_m2:string realtime:boolean realtime_m1:string ' +
    'realtime_d:integer realtime_m2:string linkshare:boolean linkshare_m1:string ' +
    'linkshare_d:integer linkshare_m2:string';
  _TVirtualIPApply = 'applied:boolean _:RawUtf8';
  _TVirtualIP = 'uniqid:string mode:TEnumPfopenapi22 interface:string type:TEnumPfopenapi23 ' +
    'subnet:string subnet_bits:integer descr:string noexpand:boolean vhid:integer ' +
    'advbase:integer advskew:integer password:string carp_status:string carp_mode:TEnumPfopenapi24 ' +
    'carp_peer:string';
  _TGraphQL = 'query:string variables:variant';
  _TInterfaceApply = 'applied:boolean pending_interfaces:TStringDynArray';
  _TAvailableInterface = 'if:string mac:string dmesg:string in_use_by:string';
  _TInterfaceBridge = 'members:TStringDynArray descr:string bridgeif:string';
  _TInterfaceGRE = 'if:string greif:string descr:string add_static_route:boolean ' +
    'remote_addr:string tunnel_local_addr:string tunnel_remote_addr:string tunnel_remote_net:integer ' +
    'tunnel_local_addr6:string tunnel_remote_addr6:string tunnel_remote_net6:integer';
  _TInterfaceGroup = 'ifname:string members:TStringDynArray descr:string';
  _TInterfaceLAGG = 'laggif:string descr:string members:TStringDynArray proto:TEnumPfopenapi25 ' +
    'lacptimeout:TEnumPfopenapi26 lagghash:TEnumPfopenapi27 failovermaster:string';
  _TInterfaceVLAN = 'if:string tag:integer vlanif:string pcp:integer descr:string';
  _TNetworkInterface = 'if:string enable:boolean descr:string spoofmac:string ' +
    'mtu:integer mss:integer media:string mediaopt:string blockpriv:boolean ' +
    'blockbogons:boolean typev4:TEnumPfopenapi28 ipaddr:string subnet:integer ' +
    'gateway:string dhcphostname:string alias_address:string alias_subnet:integer ' +
    'dhcprejectfrom:TStringDynArray adv_dhcp_config_advanced:boolean adv_dhcp_pt_values:TEnumPfopenapi29 ' +
    'adv_dhcp_pt_timeout:integer adv_dhcp_pt_retry:integer adv_dhcp_pt_select_timeout:integer ' +
    'adv_dhcp_pt_reboot:integer adv_dhcp_pt_backoff_cutoff:integer adv_dhcp_pt_initial_interval:integer ' +
    'adv_dhcp_send_options:string adv_dhcp_request_options:string adv_dhcp_required_options:string ' +
    'adv_dhcp_option_modifiers:string adv_dhcp_config_file_override:boolean ' +
    'adv_dhcp_config_file_override_path:string typev6:TEnumPfopenapi30 ipaddrv6:string ' +
    'subnetv6:integer gatewayv6:string ipv6usev4iface:boolean slaacusev4iface:boolean ' +
    'prefix_6rd:string gateway_6rd:string prefix_6rd_v4plen:integer track6_interface:string ' +
    'track6_prefix_id_hex:string';
  _TRoutingApply = 'applied:boolean _:RawUtf8';
  _TDefaultGateway = 'defaultgw4:string defaultgw6:string';
  _TRoutingGateway = 'name:string descr:string disabled:boolean ipprotocol:TEnumPfopenapi4 ' +
    'interface:string gateway:string monitor_disable:boolean monitor:string ' +
    'action_disable:boolean force_down:boolean dpinger_dont_add_static_route:boolean ' +
    'gw_down_kill_states:TEnumPfopenapi31 nonlocalgateway:boolean weight:integer ' +
    'data_payload:integer latencylow:integer latencyhigh:integer losslow:integer ' +
    'losshigh:integer interval:integer loss_interval:integer time_period:integer ' +
    'alert_interval:integer';
  _TRoutingGatewayGroup = 'name:string trigger:TEnumPfopenapi32 descr:string ' +
    'ipprotocol:string priorities:variant';
  _TRoutingGatewayGroupPriority = 'gateway:string tier:integer virtual_ip:string';
  _TStaticRoute = 'network:string gateway:string descr:string disabled:boolean';
  _TACMEAccountKey = 'name:string descr:string email:string acmeserver:string ' +
    'accountkey:string';
  _TACMEAccountKeyRegister = 'name:string status:string';
  _TACMECertificateAction = 'status:TEnumPfopenapi33 command:string method:TEnumPfopenapi34';
  _TACMECertificateDomain = 'name:string status:TEnumPfopenapi3 method:string ' +
    'webrootfolder:string webrootftpftpserver:string webrootftpusername:string ' +
    'webrootftppassword:string webrootftpfolder:string standaloneport:string ' +
    'standaloneipv6:boolean standalonetlsport:string nsupdate_server:string ' +
    'nsupdate_keyname:string nsupdate_keyalgo:TEnumPfopenapi35 nsupdate_key:string ' +
    'nsupdate_zone:string one984hosting_username:string one984hosting_password:string ' +
    'acmeproxy_endpoint:string acmeproxy_username:string acmeproxy_password:string ' +
    'acmedns_username:string acmedns_password:string acmedns_subdomain:string ' +
    'acmedns_update_url:string active24_token:string akamai_host:string akamai_access_token:string ' +
    'akamai_client_token:string akamai_client_secret:string ali_key:string ali_secret:string ' +
    'kas_login:string kas_authtype:string kas_authdata:string ad_api_key:string ' +
    'anx_token:string af_api_username:string af_api_password:string arvan_token:string ' +
    'aurora_key:string aurora_secret:string autodns_user:string autodns_password:string ' +
    'autodns_context:string aws_access_key_id:string aws_secret_access_key:string ' +
    'aws_dns_slowrate:string azion_email:string azion_password:string azuredns_subscriptionid:string ' +
    'azuredns_tenantid:string azuredns_appid:string azuredns_clientsecret:string ' +
    'bookmyname_username:string bookmyname_password:string bunny_api_key:string ' +
    'clouddns_email:string clouddns_client_id:string clouddns_password:string ' +
    'cloudns_auth_id:string cloudns_sub_auth_id:string cloudns_auth_password:string ' +
    'cf_key:string cf_email:string cf_token:string cf_account_id:string cf_zone_id:string ' +
    'conoha_username:string conoha_password:string conoha_tenantid:string conoha_identityserviceapi:string ' +
    'constellix_key:string constellix_secret:string cpanel_username:string cpanel_apitoken:string ' +
    'cpanel_hostname:string cn_user:string cn_password:string curanet_authclientid:string ' +
    'curanet_authsecret:string cy_username:string cy_password:string ddnss_token:string ' +
    'dedyn_token:string dedyn_name:string do_api_key:string da_api:string da_api_insecure:string ' +
    'dnsexit_api_key:string dnsexit_auth_user:string dnsexit_auth_pass:string ' +
    'dnshome_subdomain:string dnshome_subdomainpassword:string dnsimple_oauth_token:string ' +
    'me_key:string me_secret:string dnsservices_username:string dnsservices_password:string ' +
    'do_letoken:string do_pid:string do_pw:string domeneshop_token:string domeneshop_secret:string ' +
    'dp_id:string dp_key:string dpi_id:string dpi_key:string dh_api_key:string ' +
    'duckdns_token:string dd_api_user:string dd_api_key:string dyn_customer:string ' +
    'dyn_username:string dyn_password:string df_user:string df_password:string ' +
    'dynu_clientid:string dynu_secret:string easydns_key:string easydns_token:string ' +
    'euserv_username:string euserv_password:string exoscale_api_key:string exoscale_secret_key:string ' +
    'fornex_api_key:string freedns_user:string freedns_password:string gandi_livedns_key:string ' +
    'gcore_key:string geoscaling_username:string geoscaling_password:string ' +
    'gd_key:string gd_secret:string googledomains_access_token:string googledomains_zone:string ' +
    'hetzner_token:string hexonet_login:string hexonet_password:string huaweicloud_username:string ' +
    'huaweicloud_password:string huaweicloud_domainname:string he_username:string ' +
    'he_password:string hostingde_apikey:string hostingde_endpoint:string infoblox_creds:string ' +
    'infoblox_server:string infoblox_view:string infomaniak_api_token:string ' +
    'default_infomaniak_api_url:string infomaniak_ttl:string ionos_prefix:string ' +
    'ionos_secret:string ipv64_token:string internetbs_api_key:string internetbs_api_password:string ' +
    'inwx_username:string inwx_password:string inwx_shared_secret:string ispc_user:string ' +
    'ispc_password:string ispc_api:string ispc_api_insecure:string jd_access_key_id:string ' +
    'jd_access_key_secret:string jd_region:string joker_username:string joker_password:string ' +
    'kappernetdns_key:string kappernetdns_secret:string kinghost_username:string ' +
    'kinghost_password:string knot_server:string knot_key:string la_id:string ' +
    'la_key:string lsw_key:string limacity_apikey:string linode_api_key:string ' +
    'linode_v4_api_key:string loopia_user:string loopia_password:string lua_key:string ' +
    'lua_email:string miab_username:string miab_password:string miab_server:string ' +
    'misaka_key:string mydnsjp_masterid:string mydnsjp_password:string mb_ak:string ' +
    'mb_as:string namecom_username:string namecom_token:string namecheap_api_key:string ' +
    'namecheap_username:string nm_user:string nm_sha256:string nanelo_token:string ' +
    'nederhost_key:string namesilo_key:string neodigit_api_token:string nc_apikey:string ' +
    'nc_apipw:string nc_cid:string netlify_access_token:string nic_clientid:string ' +
    'nic_clientsecret:string nic_username:string nic_password:string ns1_key:string ' +
    'nw_api_token:string nw_api_endpoint:TEnumPfopenapi36 onecom_user:string ' +
    'onecom_password:string online_api_key:string oci_cli_tenancy:string oci_cli_user:string ' +
    'oci_cli_region:string oci_cli_key:string openprovider_user:string openprovider_passwordhash:string ' +
    'ovh_ak:string ovh_as:string ovh_ck:string ovh_end_point:TEnumPfopenapi37 ' +
    'pleskxml_user:string pleskxml_pass:string pleskxml_uri:string pointhq_key:string ' +
    'pointhq_email:string porkbun_api_key:string porkbun_secret_api_key:string ' +
    'pdns_url:string pdns_serverid:string pdns_token:string pdns_ttl:string ' +
    'rackcorp_apiuuid:string rackcorp_apisecret:string rackspace_username:string ' +
    'rackspace_apikey:string rage4_username:string rage4_token:string rcode0_api_token:string ' +
    'rcode0_url:string rcode0_ttl:string regru_api_username:string regru_api_password:string ' +
    'scaleway_api_token:string schlundtech_user:string schlundtech_password:string ' +
    'sl_key:string selfhostdns_username:string selfhostdns_password:string selfhostdns_map:string ' +
    'servercow_api_username:string servercow_api_password:string simply_accountname:string ' +
    'simply_apikey:string simply_api:string tele3_key:string tele3_secret:string ' +
    'tencent_secretid:string tencent_secretkey:string udr_user:string udr_pass:string ' +
    'ultra_usr:string ULTRA_PWD:string uno_user:string uno_key:string variomedia_api_token:string ' +
    'veesp_user:string veesp_password:string vercel_token:string vscale_api_key:string ' +
    'vultr_api_key:string ws_apikey:string ws_apisecret:string west_username:string ' +
    'west_key:string world4you_username:string world4you_password:string pdd_token:string ' +
    'yc_zone_id:string yc_folder_id:string yc_sa_id:string yc_sa_key_id:string ' +
    'yc_sa_key_file_pem_b64:string zm_key:string zone_username:string zone_key:string ' +
    'zilore_key:string anydnschallengealias:string anydnschallengedomain:boolean';
  _TACMECertificate = 'name:string descr:string status:TEnumPfopenapi33 acmeaccount:string ' +
    'keylength:TEnumPfopenapi38 keypaste:string preferredchain:string oscpstaple:boolean ' +
    'dnssleep:integer renewafter:integer a_domainlist:variant a_actionlist:variant';
  _TACMECertificateIssue = 'certificate:string status:string last_updated:integer ' +
    'result_log:string';
  _TACMECertificateRenew = 'certificate:string status:string last_updated:integer ' +
    'result_log:string';
  _TACMESettings = 'enable:boolean writecerts:boolean _:RawUtf8';
  _TBINDAccessList = 'name:string description:string entries:variant';
  _TBINDAccessListEntry = 'value:string description:string';
  _TBINDSettings = 'enable_bind:boolean bind_ip_version:TEnumPfopenapi39 ' +
    'listenon:TStringDynArray bind_notify:boolean bind_hide_version:boolean ' +
    'bind_ram_limit:string bind_logging:boolean log_severity:TEnumPfopenapi40 ' +
    'log_options:TEnumPfopenapi41Set rate_enabled:boolean rate_limit:integer ' +
    'log_only:boolean bind_forwarder:boolean bind_forwarder_ips:TStringDynArray ' +
    'bind_dnssec_validation:TEnumPfopenapi42 listenport:string controlport:string ' +
    'bind_custom_options:string bind_global_settings:string';
  _TBINDSyncRemoteHost = 'syncdestinenable:boolean syncprotocol:TEnumPfopenapi43 ' +
    'ipaddress:string syncport:string username:string password:string';
  _TBINDSyncSettings = 'synconchanges:TEnumPfopenapi44 synctimeout:integer ' +
    'masterip:string';
  _TBINDView = 'name:string descr:string recursion:boolean match_clients:TStringDynArray ' +
    'allow_recursion:TStringDynArray bind_custom_options:string';
  _TBINDZone = 'disabled:boolean name:string description:string type:TEnumPfopenapi45 ' +
    'view:TStringDynArray reversev4:boolean reversev6:boolean rpz:boolean custom:string ' +
    'dnssec:boolean backupkeys:boolean slaveip:string forwarders:TStringDynArray ' +
    'ttl:integer baseip:string nameserver:string mail:string serial:integer ' +
    'refresh:integer retry:integer expire:integer minimum:integer enable_updatepolicy:boolean ' +
    'updatepolicy:string allowupdate:TStringDynArray allowtransfer:TStringDynArray ' +
    'allowquery:TStringDynArray regdhcpstatic:boolean customzonerecords:string ' +
    'records:variant';
  _TBINDZoneRecord = 'name:string type:TEnumPfopenapi46 rdata:string priority:integer';
  _TCronJob = 'minute:string hour:string mday:string month:string wday:string ' +
    'who:string command:string';
  _TDHCPServerAddressPool = 'range_from:string range_to:string domain:string ' +
    'mac_allow:TStringDynArray mac_deny:TStringDynArray domainsearchlist:TStringDynArray ' +
    'defaultleasetime:integer maxleasetime:integer gateway:string dnsserver:TStringDynArray ' +
    'winsserver:TStringDynArray ntpserver:TStringDynArray ignorebootp:boolean ' +
    'ignoreclientuids:boolean denyunknown:TEnumPfopenapi47';
  _TDHCPServerApply = 'applied:boolean _:RawUtf8';
  _TDHCPServerBackend = 'dhcpbackend:TEnumPfopenapi48 _:RawUtf8';
  _TDHCPServerCustomOption = 'number:integer type:TEnumPfopenapi49 value:string';
  _TDHCPServer = 'interface:string enable:boolean range_from:string range_to:string ' +
    'domain:string failover_peerip:string mac_allow:TStringDynArray mac_deny:TStringDynArray ' +
    'domainsearchlist:TStringDynArray defaultleasetime:integer maxleasetime:integer ' +
    'gateway:string dnsserver:TStringDynArray winsserver:TStringDynArray ntpserver:TStringDynArray ' +
    'staticarp:boolean ignorebootp:boolean ignoreclientuids:boolean nonak:boolean ' +
    'disablepingcheck:boolean dhcpleaseinlocaltime:boolean statsgraph:boolean ' +
    'denyunknown:TEnumPfopenapi47 pool:variant numberoptions:variant staticmap:variant';
  _TDHCPServerStaticMapping = 'mac:string ipaddr:string cid:string hostname:string ' +
    'domain:string domainsearchlist:TStringDynArray defaultleasetime:integer ' +
    'maxleasetime:integer gateway:string dnsserver:TStringDynArray winsserver:TStringDynArray ' +
    'ntpserver:TStringDynArray arp_table_static_entry:boolean descr:string';
  _TDNSForwarderApply = 'applied:boolean _:RawUtf8';
  _TDNSForwarderHostOverrideAlias = 'host:string domain:string description:string';
  _TDNSForwarderHostOverride = 'host:string domain:string ip:string descr:string ' +
    'aliases:variant';
  _TDNSResolverAccessList = 'name:string action:TEnumPfopenapi50 description:string ' +
    'networks:variant';
  _TDNSResolverAccessListNetwork = 'network:string mask:integer description:string';
  _TDNSResolverApply = 'applied:boolean _:RawUtf8';
  _TDNSResolverDomainOverride = 'domain:string ip:string descr:string forward_tls_upstream:boolean ' +
    'tls_hostname:string';
  _TDNSResolverHostOverrideAlias = 'host:string domain:string descr:string';
  _TDNSResolverHostOverride = 'host:string domain:string ip:TStringDynArray ' +
    'descr:string aliases:variant';
  _TDNSResolverSettings = 'enable:boolean port:string enablessl:boolean sslcertref:string ' +
    'tlsport:string active_interface:TStringDynArray outgoing_interface:TStringDynArray ' +
    'strictout:boolean system_domain_local_zone_type:TEnumPfopenapi51 dnssec:boolean ' +
    'python:boolean python_order:TEnumPfopenapi52 python_script:string forwarding:boolean ' +
    'regdhcp:boolean regdhcpstatic:boolean regovpnclients:boolean custom_options:string';
  _THAProxyApply = 'applied:boolean _:RawUtf8';
  _THAProxyBackendACL = 'name:string expression:TEnumPfopenapi53 value:string ' +
    'casesensitive:boolean not:boolean';
  _THAProxyBackendAction = 'action:TEnumPfopenapi54 acl:string server:string ' +
    'customaction:string deny_status:string realm:string rule:string lua_function:string ' +
    'name:string fmt:string find:string replace:string path:string status:string ' +
    'reason:string';
  _THAProxyBackend = 'name:string servers:variant balance:TEnumPfopenapi55 ' +
    'balance_urilen:integer balance_uridepth:integer balance_uriwhole:boolean ' +
    'acls:variant actions:variant connection_timeout:integer server_timeout:integer ' +
    'retries:integer check_type:TEnumPfopenapi56 checkinter:integer log_health_checks:boolean ' +
    'httpcheck_method:TEnumPfopenapi57 monitor_uri:string monitor_httpversion:string ' +
    'monitor_username:string monitor_domain:string agent_checks:boolean agent_port:string ' +
    'agent_inter:integer persist_cookie_enabled:boolean persist_cookie_name:string ' +
    'persist_cookie_mode:TEnumPfopenapi58 persist_cookie_cachable:boolean persist_cookie_postonly:boolean ' +
    'persist_cookie_httponly:boolean persist_cookie_secure:boolean haproxy_cookie_maxidle:integer ' +
    'haproxy_cookie_maxlife:integer haproxy_cookie_domains:TStringDynArray haproxy_cookie_dynamic_cookie_key:string ' +
    'persist_sticky_type:TEnumPfopenapi59 persist_stick_expire:string persist_stick_tablesize:string ' +
    'persist_stick_cookiename:string persist_stick_length:integer email_level:TEnumPfopenapi60 ' +
    'email_to:string stats_enabled:boolean stats_uri:string stats_scope:TStringDynArray ' +
    'stats_realm:string stats_username:string stats_password:string stats_admin:string ' +
    'stats_node:string stats_desc:string stats_refresh:integer strict_transport_security:integer ' +
    'errorfiles:variant cookie_attribute_secure:boolean advanced:string advanced_backend:string ' +
    'transparent_clientip:boolean transparent_interface:string';
  _THAProxyBackendErrorFile = 'errorcode:integer errorfile:string';
  _THAProxyBackendServer = 'name:string status:TEnumPfopenapi61 address:string ' +
    'port:string weight:integer ssl:boolean sslserververify:boolean serverid:integer';
  _THAProxyFile = 'name:string type:TEnumPfopenapi62 content:string';
  _THAProxyFrontendACL = 'name:string expression:TEnumPfopenapi53 value:string ' +
    'casesensitive:boolean not:boolean';
  _THAProxyFrontendAction = 'action:TEnumPfopenapi63 acl:string backend:string ' +
    'customaction:string deny_status:string realm:string rule:string lua_function:string ' +
    'name:string fmt:string find:string replace:string path:string status:string ' +
    'reason:string';
  _THAProxyFrontendAddress = 'extaddr:TEnumPfopenapi64 extaddr_custom:string ' +
    'extaddr_port:string extaddr_ssl:boolean exaddr_advanced:string';
  _THAProxyFrontend = 'name:string descr:string status:TEnumPfopenapi33 a_extaddr:variant ' +
    'max_connections:integer type:TEnumPfopenapi65 ha_acls:variant a_actionitems:variant ' +
    'backend_serverpool:string socket_stats:boolean dontlognull:boolean dontlog_normal:boolean ' +
    'log_separate_errors:boolean log_detailed:boolean a_errorfiles:variant client_timeout:integer ' +
    'forwardfor:boolean httpclose:TEnumPfopenapi66 advanced_bind:string advanced:string';
  _THAProxyFrontendErrorFile = 'errorcode:integer errorfile:string';
  _THAProxyDNSResolver = 'name:string server:string port:string';
  _THAProxyEmailMailer = 'name:string mailserver:string mailserverport:string';
  _THAProxySettings = 'enable:boolean maxconn:integer nbthread:integer terminate_on_reload:boolean ' +
    'hard_stop_after:string carpdev:string localstatsport:string localstats_refreshtime:integer ' +
    'localstats_sticktable_refreshtime:integer remotesyslog:string logfacility:TEnumPfopenapi67 ' +
    'loglevel:TEnumPfopenapi68 log_send_hostname:string dns_resolvers:variant ' +
    'resolver_retries:integer resolver_timeoutretry:string resolver_holdvalid:string ' +
    'email_mailers:variant email_level:TEnumPfopenapi69 email_myhostname:string ' +
    'email_from:string email_to:string sslcompatibilitymode:TEnumPfopenapi70 ' +
    'ssldefaultdhparam:integer advanced:string enablesync:boolean';
  _TNTPSettings = 'enable:boolean interface:TStringDynArray ntpmaxpeers:integer ' +
    'orphan:integer ntpminpoll:TEnumPfopenapi71 ntpmaxpoll:TEnumPfopenapi71 ' +
    'dnsresolv:TEnumPfopenapi72 logpeer:boolean logsys:boolean clockstats:boolean ' +
    'loopstats:boolean peerstats:boolean statsgraph:boolean leapsec:string serverauth:boolean ' +
    'serverauthkey:string serverauthalgo:TEnumPfopenapi73';
  _TNTPTimeServer = 'timeserver:string type:TEnumPfopenapi74 prefer:boolean ' +
    'noselect:boolean';
  _TSSH = 'enable:boolean port:string sshdkeyonly:TEnumPfopenapi75 sshdagentforwarding:boolean';
  _TServiceWatchdog = 'name:string description:string notify:boolean enabled:boolean';
  _TWakeOnLANSend = 'interface:string mac_addr:string';
  _TCARP = 'enable:boolean maintenance_mode:boolean _:RawUtf8';
  _TDHCPServerLease = 'ip:string mac:string hostname:string if:string starts:string ' +
    'ends:string active_status:string online_status:string descr:string';
  _TRoutingGatewayStatus = 'name:string srcip:string monitorip:string delay:single ' +
    'stddev:single loss:single status:string substatus:string';
  _TIPsecChildSAStatus = 'name:string uniqueid:integer reqid:integer state:string ' +
    'mode:string protocol:string encap:boolean spi_in:string spi_out:string ' +
    'encr_alg:string encr_keysize:integer integ_alg:string dh_group:string bytes_in:integer ' +
    'bytes_out:integer packets_in:integer packets_out:integer use_in:integer ' +
    'use_out:integer rekey_time:integer life_time:integer install_time:integer ' +
    'local_ts:TStringDynArray remote_ts:TStringDynArray';
  _TIPsecSAStatus = 'con_id:string uniqueid:integer version:integer state:string ' +
    'local_host:string local_port:string local_id:string remote_host:string ' +
    'remote_port:string remote_id:string initiator_spi:string responder_spi:string ' +
    'nat_remote:boolean nat_any:boolean encr_alg:string encr_keysize:integer ' +
    'integ_alg:string prf_alg:string dh_group:string established:integer rekey_time:integer ' +
    'child_sas:variant';
  _TInterfaceStats = 'name:string descr:string hwif:string macaddr:string ' +
    'mtu:string enable:boolean status:string ipaddr:string subnet:string linklocal:string ' +
    'ipaddrv6:string subnetv6:string inerrs:integer outerrs:integer collisions:integer ' +
    'inbytes:integer inbytespass:integer outbytes:integer outbytespass:integer ' +
    'inpkts:integer inpktspass:integer outpkts:integer outpktspass:integer dhcplink:string ' +
    'media:string gateway:string gatewayv6:string';
  _TDHCPLog = 'text:string';
  _TFirewallLog = 'text:string';
  _TLogSettings = 'format:TEnumPfopenapi76 reverseorder:boolean nentries:integer ' +
    'nologdefaultblock:boolean nologdefaultpass:boolean nologbogons:boolean ' +
    'nologprivatenets:boolean nolognginx:boolean rawfilter:boolean disablelocallogging:boolean ' +
    'logconfigchanges:boolean filterdescriptions:integer logfilesize:integer ' +
    'rotatecount:integer logcompressiontype:TEnumPfopenapi77 enableremotelogging:boolean ' +
    'ipprotocol:TEnumPfopenapi78 sourceip:string remoteserver:string remoteserver2:string ' +
    'remoteserver3:string logall:boolean filter:boolean dhcp:boolean auth:boolean ' +
    'portalauth:boolean vpn:boolean dpinger:boolean hostapd:boolean system:boolean ' +
    'resolver:boolean ppp:boolean routing:boolean ntpd:boolean';
  _TSystemLog = 'text:string';
  _TOpenVPNClientStatus = 'name:string port:string vpnid:integer mgmt:string ' +
    'status:string state:string state_detail:string connect_time:string virtual_addr:string ' +
    'virtual_addr6:string remote_host:string remote_port:string local_host:string ' +
    'local_port:string';
  _TOpenVPNServerConnectionStatus = 'common_name:string remote_host:string ' +
    'virtual_addr:string virtual_addr6:string bytes_recv:integer bytes_sent:integer ' +
    'connect_time:string connect_time_unix:integer user_name:string client_id:integer ' +
    'peer_id:integer cipher:string';
  _TOpenVPNServerRouteStatus = 'common_name:string remote_host:string virtual_addr:string ' +
    'last_time:string';
  _TOpenVPNServerStatus = 'name:string mode:string port:string vpnid:integer ' +
    'mgmt:string conns:variant routes:variant';
  _TService = 'name:string action:TEnumPfopenapi79 description:string enabled:boolean ' +
    'status:boolean';
  _TSystemStatus = 'platform:string serial:string netgate_id:string uptime:string ' +
    'bios_vendor:string bios_version:string bios_date:string kernel_pti:boolean ' +
    'mds_mitigation:string temp_c:single temp_f:single cpu_model:string cpu_load_avg:TSingleDynArray ' +
    'cpu_count:integer cpu_usage:single mbuf_usage:single mem_usage:single swap_usage:single ' +
    'disk_usage:single';
  _TCertificateRevocationList = 'refid:string caref:string descr:string method:TEnumPfopenapi80 ' +
    'lifetime:integer serial:integer text:string cert:variant';
  _TCertificateRevocationListRevokedCertificate = 'certref:string serial:string ' +
    'reason:integer revoke_time:integer caref:string descr:string type:string ' +
    'crt:string prv:string';
  _TCertificateAuthority = 'descr:string refid:string trust:boolean randomserial:boolean ' +
    'serial:integer crt:string prv:string';
  _TCertificateAuthorityGenerate = 'descr:string refid:string trust:boolean ' +
    'randomserial:boolean serial:integer is_intermediate:boolean caref:string ' +
    'keytype:TEnumPfopenapi81 keylen:integer ecname:string digest_alg:string ' +
    'lifetime:integer dn_commonname:string dn_country:string dn_state:string ' +
    'dn_city:string dn_organization:string dn_organizationalunit:string crt:string ' +
    'prv:string';
  _TCertificateAuthorityRenew = 'caref:string reusekey:boolean reuseserial:boolean ' +
    'strictsecurity:boolean oldserial:string newserial:string';
  _TCertificate = 'descr:string refid:string caref:string type:TEnumPfopenapi82 ' +
    'csr:string crt:string prv:string';
  _TCertificateGenerate = 'descr:string refid:string caref:string keytype:TEnumPfopenapi81 ' +
    'keylen:integer ecname:string digest_alg:string lifetime:integer dn_commonname:string ' +
    'dn_country:string dn_state:string dn_city:string dn_organization:string ' +
    'dn_organizationalunit:string type:TEnumPfopenapi82 dn_dns_sans:TStringDynArray ' +
    'dn_email_sans:TStringDynArray dn_ip_sans:TStringDynArray dn_uri_sans:TStringDynArray ' +
    'crt:string prv:string';
  _TCertificatePKCS12Export = 'certref:string encryption:TEnumPfopenapi83 ' +
    'passphrase:string filename:string binary_data:string';
  _TCertificateRenew = 'certref:string reusekey:boolean reuseserial:boolean ' +
    'strictsecurity:boolean oldserial:string newserial:string';
  _TCertificateSigningRequest = 'descr:string refid:string keytype:TEnumPfopenapi81 ' +
    'keylen:integer ecname:string digest_alg:string lifetime:integer dn_commonname:string ' +
    'dn_country:string dn_state:string dn_city:string dn_organization:string ' +
    'dn_organizationalunit:string type:TEnumPfopenapi82 dn_dns_sans:TStringDynArray ' +
    'dn_email_sans:TStringDynArray dn_ip_sans:TStringDynArray dn_uri_sans:TStringDynArray ' +
    'csr:string prv:string';
  _TCertificateSigningRequestSign = 'descr:string refid:string caref:string ' +
    'csr:string crt:string prv:string digest_alg:string lifetime:integer type:TEnumPfopenapi82 ' +
    'dn_dns_sans:TStringDynArray dn_email_sans:TStringDynArray dn_ip_sans:TStringDynArray ' +
    'dn_uri_sans:TStringDynArray';
  _TSystemConsole = 'passwd_protect_console:boolean _:RawUtf8';
  _TSystemDNS = 'dnsallowoverride:boolean dnslocalhost:TEnumPfopenapi84 dnsserver:TStringDynArray';
  _TSystemHostname = 'hostname:string domain:string';
  _TEmailNotificationSettings = 'disable:boolean ipaddress:string port:string ' +
    'timeout:integer ssl:boolean sslvalidate:boolean fromaddress:string notifyemailaddress:string ' +
    'authentication_mechanism:TEnumPfopenapi85 username:string password:string';
  _TAvailablePackage = 'name:string shortname:string descr:string version:string ' +
    'installed:boolean deps:TStringDynArray';
  _TPackage = 'name:string shortname:string descr:string installed_version:string ' +
    'latest_version:string update_available:boolean';
  _TRESTAPIAccessListEntry = 'type:TEnumPfopenapi86 weight:integer network:string ' +
    'users:TStringDynArray sched:string descr:string';
  _TRESTAPISettings = 'enabled:boolean read_only:boolean keep_backup:boolean ' +
    'login_protection:boolean log_successful_auth:boolean allow_pre_releases:boolean ' +
    'hateoas:boolean expose_sensitive_fields:boolean override_sensitive_fields:TStringDynArray ' +
    'allowed_interfaces:TStringDynArray represent_interfaces_as:TEnumPfopenapi87 ' +
    'auth_methods:TStringDynArray jwt_exp:integer ha_sync:boolean ha_sync_validate_certs:boolean ' +
    'ha_sync_hosts:TStringDynArray ha_sync_username:string ha_sync_password:string';
  _TRESTAPISettingsSync = 'sync_data:string';
  _TRESTAPIVersion = 'current_version:string latest_version:string latest_version_release_date:string ' +
    'update_available:boolean install_version:string available_versions:TStringDynArray';
  _TSystemTunable = 'tunable:string value:string descr:string';
  _TSystemVersion = 'version:string base:string patch:string buildtime:string';
  _TWebGUISettings = 'protocol:TEnumPfopenapi43 port:string sslcertref:string';
  _TAuthServer = 'refid:string type:TEnumPfopenapi88 name:string host:string ' +
    'ldap_port:string ldap_urltype:TEnumPfopenapi89 ldap_protver:integer ldap_timeout:integer ' +
    'ldap_caref:string ldap_scope:TEnumPfopenapi90 ldap_basedn:string ldap_authcn:string ' +
    'ldap_extended_enabled:boolean ldap_extended_query:string ldap_binddn:string ' +
    'ldap_bindpw:string ldap_attr_user:string ldap_attr_group:string ldap_attr_member:string ' +
    'ldap_rfc2307:boolean ldap_rfc2307_userdn:boolean ldap_attr_groupobj:string ' +
    'ldap_pam_groupdn:string ldap_utf8:boolean ldap_nostrip_at:boolean ldap_allow_unauthenticated:boolean ' +
    'radius_secret:string radius_auth_port:string radius_acct_port:string radius_protocol:TEnumPfopenapi91 ' +
    'radius_timeout:integer radius_nasip_attribute:string';
  _TUser = 'name:string password:string uid:integer scope:string priv:TStringDynArray ' +
    'disabled:boolean descr:string expires:string cert:TStringDynArray authorizedkeys:string ' +
    'ipsecpsk:string';
  _TUserGroup = 'name:string gid:integer scope:TEnumPfopenapi84 description:string ' +
    'member:TStringDynArray priv:TStringDynArray';
  _TIPsecApply = 'applied:boolean _:RawUtf8';
  _TIPsecPhase1Encryption = 'encryption_algorithm_name:TEnumPfopenapi92 encryption_algorithm_keylen:integer ' +
    'hash_algorithm:TEnumPfopenapi93 dhgroup:integer prf_algorithm:TEnumPfopenapi93 _:RawUtf8';
  _TIPsecPhase1 = 'ikeid:integer descr:string disabled:boolean iketype:TEnumPfopenapi94 ' +
    'mode:TEnumPfopenapi95 protocol:TEnumPfopenapi96 interface:string remote_gateway:string ' +
    'authentication_method:TEnumPfopenapi97 myid_type:TEnumPfopenapi98 myid_data:string ' +
    'peerid_type:TEnumPfopenapi99 peerid_data:string pre_shared_key:string certref:string ' +
    'caref:string rekey_time:integer reauth_time:integer rand_time:integer lifetime:integer ' +
    'startaction:TEnumPfopenapi100 closeaction:TEnumPfopenapi100 nat_traversal:TEnumPfopenapi101 ' +
    'gw_duplicates:boolean mobike:boolean splitconn:boolean prfselect_enable:boolean ' +
    'ikeport:string nattport:string dpd_delay:integer dpd_maxfail:integer encryption:variant';
  _TIPsecPhase2Encryption = 'name:TEnumPfopenapi92 keylen:integer _:RawUtf8';
  _TIPsecPhase2 = 'uniqid:string reqid:integer ikeid:integer descr:string ' +
    'disabled:boolean mode:TEnumPfopenapi102 localid_type:string localid_address:string ' +
    'localid_netbits:integer natlocalid_type:string natlocalid_address:string ' +
    'natlocalid_netbits:integer remoteid_type:string remoteid_address:string ' +
    'remoteid_netbits:integer protocol:TEnumPfopenapi103 encryption_algorithm_option:variant ' +
    'hash_algorithm_option:TEnumPfopenapi104Set pfsgroup:integer rekey_time:integer ' +
    'rand_time:integer lifetime:integer pinghost:string keepalive:boolean';
  _TOpenVPNClientSpecificOverride = 'common_name:string disable:boolean block:boolean ' +
    'description:string server_list:TStringDynArray tunnel_network:string tunnel_networkv6:string ' +
    'local_network:TStringDynArray local_networkv6:TStringDynArray remote_network:TStringDynArray ' +
    'remote_networkv6:TStringDynArray gwredir:boolean push_reset:boolean remove_route:boolean ' +
    'dns_domain:string dns_server1:string dns_server2:string dns_server3:string ' +
    'dns_server4:string ntp_server1:string ntp_server2:string netbios_enable:boolean ' +
    'netbios_ntype:integer netbios_scope:string wins_server1:string wins_server2:string ' +
    'custom_options:TStringDynArray';
  _TOpenVPNClient = 'vpnid:integer vpnif:string description:string disable:boolean ' +
    'mode:TEnumPfopenapi105 dev_mode:TEnumPfopenapi106 protocol:TEnumPfopenapi107 ' +
    'interface:string server_addr:string server_port:string local_port:string ' +
    'proxy_addr:string proxy_port:string proxy_authtype:TEnumPfopenapi108 proxy_user:string ' +
    'proxy_passwd:string auth_user:string auth_pass:string auth_retry_none:boolean ' +
    'tls:string tls_type:TEnumPfopenapi109 tlsauth_keydir:TEnumPfopenapi110 ' +
    'caref:string certref:string data_ciphers:TStringDynArray data_ciphers_fallback:string ' +
    'digest:string remote_cert_tls:boolean tunnel_network:string tunnel_networkv6:string ' +
    'remote_network:TStringDynArray remote_networkv6:TStringDynArray use_shaper:integer ' +
    'allow_compression:TEnumPfopenapi111 passtos:boolean route_no_pull:boolean ' +
    'route_no_exec:boolean dns_add:boolean topology:TEnumPfopenapi112 inactive_seconds:integer ' +
    'ping_method:TEnumPfopenapi113 keepalive_interval:integer keepalive_timeout:integer ' +
    'ping_seconds:integer ping_action:TEnumPfopenapi114 ping_action_seconds:integer ' +
    'custom_options:TStringDynArray udp_fast_io:boolean exit_notify:TEnumPfopenapi115 ' +
    'sndrcvbuf:integer create_gw:TEnumPfopenapi116 verbosity_level:integer';
  _TOpenVPNServer = 'vpnid:integer vpnif:string description:string disable:boolean ' +
    'mode:TEnumPfopenapi117 authmode:TStringDynArray dev_mode:TEnumPfopenapi106 ' +
    'protocol:TEnumPfopenapi107 interface:string local_port:string use_tls:boolean ' +
    'tls:string tls_type:TEnumPfopenapi109 tlsauth_keydir:TEnumPfopenapi110 ' +
    'caref:string certref:string cert_depth:integer dh_length:string ecdh_curve:string ' +
    'data_ciphers:TStringDynArray data_ciphers_fallback:string digest:string ' +
    'strictusercn:boolean remote_cert_tls:boolean tunnel_network:string tunnel_networkv6:string ' +
    'serverbridge_dhcp:boolean serverbridge_interface:string serverbridge_routegateway:boolean ' +
    'serverbridge_dhcp_start:string serverbridge_dhcp_end:string gwredir:boolean ' +
    'gwredir6:boolean local_network:TStringDynArray local_networkv6:TStringDynArray ' +
    'remote_network:TStringDynArray remote_networkv6:TStringDynArray maxclients:integer ' +
    'allow_compression:TEnumPfopenapi111 passtos:boolean client2client:boolean ' +
    'duplicate_cn:boolean connlimit:integer dynamic_ip:boolean topology:TEnumPfopenapi112 ' +
    'inactive_seconds:integer ping_method:TEnumPfopenapi113 keepalive_interval:integer ' +
    'keepalive_timeout:integer ping_seconds:integer ping_push:boolean ping_action:TEnumPfopenapi114 ' +
    'ping_action_seconds:integer ping_action_push:boolean dns_domain:string ' +
    'dns_server1:string dns_server2:string dns_server3:string dns_server4:string ' +
    'push_blockoutsidedns:boolean push_register_dns:boolean ntp_server1:string ' +
    'ntp_server2:string netbios_enable:boolean netbios_ntype:integer netbios_scope:string ' +
    'wins_server1:string wins_server2:string custom_options:TStringDynArray ' +
    'username_as_common_name:boolean sndrcvbuf:integer create_gw:TEnumPfopenapi116 ' +
    'verbosity_level:integer';
  _TWireGuardApply = 'applied:boolean _:RawUtf8';
  _TWireGuardPeerAllowedIP = 'address:string mask:integer descr:string';
  _TWireGuardPeer = 'enabled:boolean tun:string endpoint:string port:string ' +
    'descr:string persistentkeepalive:integer publickey:string presharedkey:string ' +
    'allowedips:variant';
  _TWireGuardSettings = 'enable:boolean keep_conf:boolean resolve_interval_track:boolean ' +
    'resolve_interval:integer interface_group:TEnumPfopenapi118 hide_secrets:boolean ' +
    'hide_peers:boolean _:RawUtf8';
  _TWireGuardTunnelAddress = 'address:string mask:integer descr:string';
  _TWireGuardTunnel = 'name:string enabled:boolean listenport:string publickey:string ' +
    'privatekey:string mtu:integer addresses:variant';


procedure RegisterRtti;
begin
  TRttiJson.RegisterCustomEnumValues([
    TypeInfo(TEnumPfopenapi1), nil, @ENUMPFOPENAPI1_TXT,
    TypeInfo(TEnumPfopenapi2), nil, @ENUMPFOPENAPI2_TXT,
    TypeInfo(TEnumPfopenapi3), nil, @ENUMPFOPENAPI3_TXT,
    TypeInfo(TEnumPfopenapi4), nil, @ENUMPFOPENAPI4_TXT,
    TypeInfo(TEnumPfopenapi5), nil, @ENUMPFOPENAPI5_TXT,
    TypeInfo(TEnumPfopenapi6), nil, @ENUMPFOPENAPI6_TXT,
    TypeInfo(TEnumPfopenapi7), nil, @ENUMPFOPENAPI7_TXT,
    TypeInfo(TEnumPfopenapi8), nil, @ENUMPFOPENAPI8_TXT,
    TypeInfo(TEnumPfopenapi9), nil, @ENUMPFOPENAPI9_TXT,
    TypeInfo(TEnumPfopenapi10), nil, @ENUMPFOPENAPI10_TXT,
    TypeInfo(TEnumPfopenapi11), nil, @ENUMPFOPENAPI11_TXT,
    TypeInfo(TEnumPfopenapi12), TypeInfo(TEnumPfopenapi12Set), @ENUMPFOPENAPI12_TXT,
    TypeInfo(TEnumPfopenapi13), nil, @ENUMPFOPENAPI13_TXT,
    TypeInfo(TEnumPfopenapi14), TypeInfo(TEnumPfopenapi14Set), @ENUMPFOPENAPI14_TXT,
    TypeInfo(TEnumPfopenapi15), nil, @ENUMPFOPENAPI15_TXT,
    TypeInfo(TEnumPfopenapi16), nil, @ENUMPFOPENAPI16_TXT,
    TypeInfo(TEnumPfopenapi17), nil, @ENUMPFOPENAPI17_TXT,
    TypeInfo(TEnumPfopenapi18), nil, @ENUMPFOPENAPI18_TXT,
    TypeInfo(TEnumPfopenapi19), nil, @ENUMPFOPENAPI19_TXT,
    TypeInfo(TEnumPfopenapi20), nil, @ENUMPFOPENAPI20_TXT,
    TypeInfo(TEnumPfopenapi21), nil, @ENUMPFOPENAPI21_TXT,
    TypeInfo(TEnumPfopenapi22), nil, @ENUMPFOPENAPI22_TXT,
    TypeInfo(TEnumPfopenapi23), nil, @ENUMPFOPENAPI23_TXT,
    TypeInfo(TEnumPfopenapi24), nil, @ENUMPFOPENAPI24_TXT,
    TypeInfo(TEnumPfopenapi25), nil, @ENUMPFOPENAPI25_TXT,
    TypeInfo(TEnumPfopenapi26), nil, @ENUMPFOPENAPI26_TXT,
    TypeInfo(TEnumPfopenapi27), nil, @ENUMPFOPENAPI27_TXT,
    TypeInfo(TEnumPfopenapi28), nil, @ENUMPFOPENAPI28_TXT,
    TypeInfo(TEnumPfopenapi29), nil, @ENUMPFOPENAPI29_TXT,
    TypeInfo(TEnumPfopenapi30), nil, @ENUMPFOPENAPI30_TXT,
    TypeInfo(TEnumPfopenapi31), nil, @ENUMPFOPENAPI31_TXT,
    TypeInfo(TEnumPfopenapi32), nil, @ENUMPFOPENAPI32_TXT,
    TypeInfo(TEnumPfopenapi33), nil, @ENUMPFOPENAPI33_TXT,
    TypeInfo(TEnumPfopenapi34), nil, @ENUMPFOPENAPI34_TXT,
    TypeInfo(TEnumPfopenapi35), nil, @ENUMPFOPENAPI35_TXT,
    TypeInfo(TEnumPfopenapi36), nil, @ENUMPFOPENAPI36_TXT,
    TypeInfo(TEnumPfopenapi37), nil, @ENUMPFOPENAPI37_TXT,
    TypeInfo(TEnumPfopenapi38), nil, @ENUMPFOPENAPI38_TXT,
    TypeInfo(TEnumPfopenapi39), nil, @ENUMPFOPENAPI39_TXT,
    TypeInfo(TEnumPfopenapi40), nil, @ENUMPFOPENAPI40_TXT,
    TypeInfo(TEnumPfopenapi41), TypeInfo(TEnumPfopenapi41Set), @ENUMPFOPENAPI41_TXT,
    TypeInfo(TEnumPfopenapi42), nil, @ENUMPFOPENAPI42_TXT,
    TypeInfo(TEnumPfopenapi43), nil, @ENUMPFOPENAPI43_TXT,
    TypeInfo(TEnumPfopenapi44), nil, @ENUMPFOPENAPI44_TXT,
    TypeInfo(TEnumPfopenapi45), nil, @ENUMPFOPENAPI45_TXT,
    TypeInfo(TEnumPfopenapi46), nil, @ENUMPFOPENAPI46_TXT,
    TypeInfo(TEnumPfopenapi47), nil, @ENUMPFOPENAPI47_TXT,
    TypeInfo(TEnumPfopenapi48), nil, @ENUMPFOPENAPI48_TXT,
    TypeInfo(TEnumPfopenapi49), nil, @ENUMPFOPENAPI49_TXT,
    TypeInfo(TEnumPfopenapi50), nil, @ENUMPFOPENAPI50_TXT,
    TypeInfo(TEnumPfopenapi51), nil, @ENUMPFOPENAPI51_TXT,
    TypeInfo(TEnumPfopenapi52), nil, @ENUMPFOPENAPI52_TXT,
    TypeInfo(TEnumPfopenapi53), nil, @ENUMPFOPENAPI53_TXT,
    TypeInfo(TEnumPfopenapi54), nil, @ENUMPFOPENAPI54_TXT,
    TypeInfo(TEnumPfopenapi55), nil, @ENUMPFOPENAPI55_TXT,
    TypeInfo(TEnumPfopenapi56), nil, @ENUMPFOPENAPI56_TXT,
    TypeInfo(TEnumPfopenapi57), nil, @ENUMPFOPENAPI57_TXT,
    TypeInfo(TEnumPfopenapi58), nil, @ENUMPFOPENAPI58_TXT,
    TypeInfo(TEnumPfopenapi59), nil, @ENUMPFOPENAPI59_TXT,
    TypeInfo(TEnumPfopenapi60), nil, @ENUMPFOPENAPI60_TXT,
    TypeInfo(TEnumPfopenapi61), nil, @ENUMPFOPENAPI61_TXT,
    TypeInfo(TEnumPfopenapi62), nil, @ENUMPFOPENAPI62_TXT,
    TypeInfo(TEnumPfopenapi63), nil, @ENUMPFOPENAPI63_TXT,
    TypeInfo(TEnumPfopenapi64), nil, @ENUMPFOPENAPI64_TXT,
    TypeInfo(TEnumPfopenapi65), nil, @ENUMPFOPENAPI65_TXT,
    TypeInfo(TEnumPfopenapi66), nil, @ENUMPFOPENAPI66_TXT,
    TypeInfo(TEnumPfopenapi67), nil, @ENUMPFOPENAPI67_TXT,
    TypeInfo(TEnumPfopenapi68), nil, @ENUMPFOPENAPI68_TXT,
    TypeInfo(TEnumPfopenapi69), nil, @ENUMPFOPENAPI69_TXT,
    TypeInfo(TEnumPfopenapi70), nil, @ENUMPFOPENAPI70_TXT,
    TypeInfo(TEnumPfopenapi71), nil, @ENUMPFOPENAPI71_TXT,
    TypeInfo(TEnumPfopenapi72), nil, @ENUMPFOPENAPI72_TXT,
    TypeInfo(TEnumPfopenapi73), nil, @ENUMPFOPENAPI73_TXT,
    TypeInfo(TEnumPfopenapi74), nil, @ENUMPFOPENAPI74_TXT,
    TypeInfo(TEnumPfopenapi75), nil, @ENUMPFOPENAPI75_TXT,
    TypeInfo(TEnumPfopenapi76), nil, @ENUMPFOPENAPI76_TXT,
    TypeInfo(TEnumPfopenapi77), nil, @ENUMPFOPENAPI77_TXT,
    TypeInfo(TEnumPfopenapi78), nil, @ENUMPFOPENAPI78_TXT,
    TypeInfo(TEnumPfopenapi79), nil, @ENUMPFOPENAPI79_TXT,
    TypeInfo(TEnumPfopenapi80), nil, @ENUMPFOPENAPI80_TXT,
    TypeInfo(TEnumPfopenapi81), nil, @ENUMPFOPENAPI81_TXT,
    TypeInfo(TEnumPfopenapi82), nil, @ENUMPFOPENAPI82_TXT,
    TypeInfo(TEnumPfopenapi83), nil, @ENUMPFOPENAPI83_TXT,
    TypeInfo(TEnumPfopenapi84), nil, @ENUMPFOPENAPI84_TXT,
    TypeInfo(TEnumPfopenapi85), nil, @ENUMPFOPENAPI85_TXT,
    TypeInfo(TEnumPfopenapi86), nil, @ENUMPFOPENAPI86_TXT,
    TypeInfo(TEnumPfopenapi87), nil, @ENUMPFOPENAPI87_TXT,
    TypeInfo(TEnumPfopenapi88), nil, @ENUMPFOPENAPI88_TXT,
    TypeInfo(TEnumPfopenapi89), nil, @ENUMPFOPENAPI89_TXT,
    TypeInfo(TEnumPfopenapi90), nil, @ENUMPFOPENAPI90_TXT,
    TypeInfo(TEnumPfopenapi91), nil, @ENUMPFOPENAPI91_TXT,
    TypeInfo(TEnumPfopenapi92), nil, @ENUMPFOPENAPI92_TXT,
    TypeInfo(TEnumPfopenapi93), nil, @ENUMPFOPENAPI93_TXT,
    TypeInfo(TEnumPfopenapi94), nil, @ENUMPFOPENAPI94_TXT,
    TypeInfo(TEnumPfopenapi95), nil, @ENUMPFOPENAPI95_TXT,
    TypeInfo(TEnumPfopenapi96), nil, @ENUMPFOPENAPI96_TXT,
    TypeInfo(TEnumPfopenapi97), nil, @ENUMPFOPENAPI97_TXT,
    TypeInfo(TEnumPfopenapi98), nil, @ENUMPFOPENAPI98_TXT,
    TypeInfo(TEnumPfopenapi99), nil, @ENUMPFOPENAPI99_TXT,
    TypeInfo(TEnumPfopenapi100), nil, @ENUMPFOPENAPI100_TXT,
    TypeInfo(TEnumPfopenapi101), nil, @ENUMPFOPENAPI101_TXT,
    TypeInfo(TEnumPfopenapi102), nil, @ENUMPFOPENAPI102_TXT,
    TypeInfo(TEnumPfopenapi103), nil, @ENUMPFOPENAPI103_TXT,
    TypeInfo(TEnumPfopenapi104), TypeInfo(TEnumPfopenapi104Set), @ENUMPFOPENAPI104_TXT,
    TypeInfo(TEnumPfopenapi105), nil, @ENUMPFOPENAPI105_TXT,
    TypeInfo(TEnumPfopenapi106), nil, @ENUMPFOPENAPI106_TXT,
    TypeInfo(TEnumPfopenapi107), nil, @ENUMPFOPENAPI107_TXT,
    TypeInfo(TEnumPfopenapi108), nil, @ENUMPFOPENAPI108_TXT,
    TypeInfo(TEnumPfopenapi109), nil, @ENUMPFOPENAPI109_TXT,
    TypeInfo(TEnumPfopenapi110), nil, @ENUMPFOPENAPI110_TXT,
    TypeInfo(TEnumPfopenapi111), nil, @ENUMPFOPENAPI111_TXT,
    TypeInfo(TEnumPfopenapi112), nil, @ENUMPFOPENAPI112_TXT,
    TypeInfo(TEnumPfopenapi113), nil, @ENUMPFOPENAPI113_TXT,
    TypeInfo(TEnumPfopenapi114), nil, @ENUMPFOPENAPI114_TXT,
    TypeInfo(TEnumPfopenapi115), nil, @ENUMPFOPENAPI115_TXT,
    TypeInfo(TEnumPfopenapi116), nil, @ENUMPFOPENAPI116_TXT,
    TypeInfo(TEnumPfopenapi117), nil, @ENUMPFOPENAPI117_TXT,
    TypeInfo(TEnumPfopenapi118), nil, @ENUMPFOPENAPI118_TXT,
    TypeInfo(TEnumPfopenapi119), nil, @ENUMPFOPENAPI119_TXT,
    TypeInfo(TEnumPfopenapi120), nil, @ENUMPFOPENAPI120_TXT]);
  Rtti.RegisterFromText([
    TypeInfo(TAuthenticationError), _TAuthenticationError,
    TypeInfo(TConflictError), _TConflictError,
    TypeInfo(TFailedDependencyError), _TFailedDependencyError,
    TypeInfo(TForbiddenError), _TForbiddenError,
    TypeInfo(TDtoPfopenapi2), _TDtoPfopenapi2,
    TypeInfo(TDtoPfopenapi3), _TDtoPfopenapi3,
    TypeInfo(TDtoPfopenapi1), _TDtoPfopenapi1,
    TypeInfo(TGraphQLResponse), _TGraphQLResponse,
    TypeInfo(TMediaTypeError), _TMediaTypeError,
    TypeInfo(TMethodNotAllowedError), _TMethodNotAllowedError,
    TypeInfo(TNotAcceptableError), _TNotAcceptableError,
    TypeInfo(TNotFoundError), _TNotFoundError,
    TypeInfo(TServerError), _TServerError,
    TypeInfo(TServiceUnavailableError), _TServiceUnavailableError,
    TypeInfo(TSuccess), _TSuccess,
    TypeInfo(TUnprocessableContentError), _TUnprocessableContentError,
    TypeInfo(TValidationError), _TValidationError,
    TypeInfo(TRESTAPIJWT), _TRESTAPIJWT,
    TypeInfo(TRESTAPIKey), _TRESTAPIKey,
    TypeInfo(TARPTable), _TARPTable,
    TypeInfo(TCommandPrompt), _TCommandPrompt,
    TypeInfo(TConfigHistoryRevision), _TConfigHistoryRevision,
    TypeInfo(TSystemHalt), _TSystemHalt,
    TypeInfo(TSystemReboot), _TSystemReboot,
    TypeInfo(TFirewallAdvancedSettings), _TFirewallAdvancedSettings,
    TypeInfo(TFirewallAlias), _TFirewallAlias,
    TypeInfo(TFirewallApply), _TFirewallApply,
    TypeInfo(TOneToOneNATMapping), _TOneToOneNATMapping,
    TypeInfo(TOutboundNATMapping), _TOutboundNATMapping,
    TypeInfo(TOutboundNATMode), _TOutboundNATMode,
    TypeInfo(TPortForward), _TPortForward,
    TypeInfo(TFirewallRule), _TFirewallRule,
    TypeInfo(TFirewallSchedule), _TFirewallSchedule,
    TypeInfo(TFirewallScheduleTimeRange), _TFirewallScheduleTimeRange,
    TypeInfo(TFirewallState), _TFirewallState,
    TypeInfo(TFirewallStatesSize), _TFirewallStatesSize,
    TypeInfo(TTrafficShaper), _TTrafficShaper,
    TypeInfo(TTrafficShaperLimiterBandwidth), _TTrafficShaperLimiterBandwidth,
    TypeInfo(TTrafficShaperLimiter), _TTrafficShaperLimiter,
    TypeInfo(TTrafficShaperLimiterQueue), _TTrafficShaperLimiterQueue,
    TypeInfo(TTrafficShaperQueue), _TTrafficShaperQueue,
    TypeInfo(TVirtualIPApply), _TVirtualIPApply,
    TypeInfo(TVirtualIP), _TVirtualIP,
    TypeInfo(TGraphQL), _TGraphQL,
    TypeInfo(TInterfaceApply), _TInterfaceApply,
    TypeInfo(TAvailableInterface), _TAvailableInterface,
    TypeInfo(TInterfaceBridge), _TInterfaceBridge,
    TypeInfo(TInterfaceGRE), _TInterfaceGRE,
    TypeInfo(TInterfaceGroup), _TInterfaceGroup,
    TypeInfo(TInterfaceLAGG), _TInterfaceLAGG,
    TypeInfo(TInterfaceVLAN), _TInterfaceVLAN,
    TypeInfo(TNetworkInterface), _TNetworkInterface,
    TypeInfo(TRoutingApply), _TRoutingApply,
    TypeInfo(TDefaultGateway), _TDefaultGateway,
    TypeInfo(TRoutingGateway), _TRoutingGateway,
    TypeInfo(TRoutingGatewayGroup), _TRoutingGatewayGroup,
    TypeInfo(TRoutingGatewayGroupPriority), _TRoutingGatewayGroupPriority,
    TypeInfo(TStaticRoute), _TStaticRoute,
    TypeInfo(TACMEAccountKey), _TACMEAccountKey,
    TypeInfo(TACMEAccountKeyRegister), _TACMEAccountKeyRegister,
    TypeInfo(TACMECertificateAction), _TACMECertificateAction,
    TypeInfo(TACMECertificateDomain), _TACMECertificateDomain,
    TypeInfo(TACMECertificate), _TACMECertificate,
    TypeInfo(TACMECertificateIssue), _TACMECertificateIssue,
    TypeInfo(TACMECertificateRenew), _TACMECertificateRenew,
    TypeInfo(TACMESettings), _TACMESettings,
    TypeInfo(TBINDAccessList), _TBINDAccessList,
    TypeInfo(TBINDAccessListEntry), _TBINDAccessListEntry,
    TypeInfo(TBINDSettings), _TBINDSettings,
    TypeInfo(TBINDSyncRemoteHost), _TBINDSyncRemoteHost,
    TypeInfo(TBINDSyncSettings), _TBINDSyncSettings,
    TypeInfo(TBINDView), _TBINDView,
    TypeInfo(TBINDZone), _TBINDZone,
    TypeInfo(TBINDZoneRecord), _TBINDZoneRecord,
    TypeInfo(TCronJob), _TCronJob,
    TypeInfo(TDHCPServerAddressPool), _TDHCPServerAddressPool,
    TypeInfo(TDHCPServerApply), _TDHCPServerApply,
    TypeInfo(TDHCPServerBackend), _TDHCPServerBackend,
    TypeInfo(TDHCPServerCustomOption), _TDHCPServerCustomOption,
    TypeInfo(TDHCPServer), _TDHCPServer,
    TypeInfo(TDHCPServerStaticMapping), _TDHCPServerStaticMapping,
    TypeInfo(TDNSForwarderApply), _TDNSForwarderApply,
    TypeInfo(TDNSForwarderHostOverrideAlias), _TDNSForwarderHostOverrideAlias,
    TypeInfo(TDNSForwarderHostOverride), _TDNSForwarderHostOverride,
    TypeInfo(TDNSResolverAccessList), _TDNSResolverAccessList,
    TypeInfo(TDNSResolverAccessListNetwork), _TDNSResolverAccessListNetwork,
    TypeInfo(TDNSResolverApply), _TDNSResolverApply,
    TypeInfo(TDNSResolverDomainOverride), _TDNSResolverDomainOverride,
    TypeInfo(TDNSResolverHostOverrideAlias), _TDNSResolverHostOverrideAlias,
    TypeInfo(TDNSResolverHostOverride), _TDNSResolverHostOverride,
    TypeInfo(TDNSResolverSettings), _TDNSResolverSettings,
    TypeInfo(THAProxyApply), _THAProxyApply,
    TypeInfo(THAProxyBackendACL), _THAProxyBackendACL,
    TypeInfo(THAProxyBackendAction), _THAProxyBackendAction,
    TypeInfo(THAProxyBackend), _THAProxyBackend,
    TypeInfo(THAProxyBackendErrorFile), _THAProxyBackendErrorFile,
    TypeInfo(THAProxyBackendServer), _THAProxyBackendServer,
    TypeInfo(THAProxyFile), _THAProxyFile,
    TypeInfo(THAProxyFrontendACL), _THAProxyFrontendACL,
    TypeInfo(THAProxyFrontendAction), _THAProxyFrontendAction,
    TypeInfo(THAProxyFrontendAddress), _THAProxyFrontendAddress,
    TypeInfo(THAProxyFrontend), _THAProxyFrontend,
    TypeInfo(THAProxyFrontendErrorFile), _THAProxyFrontendErrorFile,
    TypeInfo(THAProxyDNSResolver), _THAProxyDNSResolver,
    TypeInfo(THAProxyEmailMailer), _THAProxyEmailMailer,
    TypeInfo(THAProxySettings), _THAProxySettings,
    TypeInfo(TNTPSettings), _TNTPSettings,
    TypeInfo(TNTPTimeServer), _TNTPTimeServer,
    TypeInfo(TSSH), _TSSH,
    TypeInfo(TServiceWatchdog), _TServiceWatchdog,
    TypeInfo(TWakeOnLANSend), _TWakeOnLANSend,
    TypeInfo(TCARP), _TCARP,
    TypeInfo(TDHCPServerLease), _TDHCPServerLease,
    TypeInfo(TRoutingGatewayStatus), _TRoutingGatewayStatus,
    TypeInfo(TIPsecChildSAStatus), _TIPsecChildSAStatus,
    TypeInfo(TIPsecSAStatus), _TIPsecSAStatus,
    TypeInfo(TInterfaceStats), _TInterfaceStats,
    TypeInfo(TDHCPLog), _TDHCPLog,
    TypeInfo(TFirewallLog), _TFirewallLog,
    TypeInfo(TLogSettings), _TLogSettings,
    TypeInfo(TSystemLog), _TSystemLog,
    TypeInfo(TOpenVPNClientStatus), _TOpenVPNClientStatus,
    TypeInfo(TOpenVPNServerConnectionStatus), _TOpenVPNServerConnectionStatus,
    TypeInfo(TOpenVPNServerRouteStatus), _TOpenVPNServerRouteStatus,
    TypeInfo(TOpenVPNServerStatus), _TOpenVPNServerStatus,
    TypeInfo(TService), _TService,
    TypeInfo(TSystemStatus), _TSystemStatus,
    TypeInfo(TCertificateRevocationList), _TCertificateRevocationList,
    TypeInfo(TCertificateRevocationListRevokedCertificate), _TCertificateRevocationListRevokedCertificate,
    TypeInfo(TCertificateAuthority), _TCertificateAuthority,
    TypeInfo(TCertificateAuthorityGenerate), _TCertificateAuthorityGenerate,
    TypeInfo(TCertificateAuthorityRenew), _TCertificateAuthorityRenew,
    TypeInfo(TCertificate), _TCertificate,
    TypeInfo(TCertificateGenerate), _TCertificateGenerate,
    TypeInfo(TCertificatePKCS12Export), _TCertificatePKCS12Export,
    TypeInfo(TCertificateRenew), _TCertificateRenew,
    TypeInfo(TCertificateSigningRequest), _TCertificateSigningRequest,
    TypeInfo(TCertificateSigningRequestSign), _TCertificateSigningRequestSign,
    TypeInfo(TSystemConsole), _TSystemConsole,
    TypeInfo(TSystemDNS), _TSystemDNS,
    TypeInfo(TSystemHostname), _TSystemHostname,
    TypeInfo(TEmailNotificationSettings), _TEmailNotificationSettings,
    TypeInfo(TAvailablePackage), _TAvailablePackage,
    TypeInfo(TPackage), _TPackage,
    TypeInfo(TRESTAPIAccessListEntry), _TRESTAPIAccessListEntry,
    TypeInfo(TRESTAPISettings), _TRESTAPISettings,
    TypeInfo(TRESTAPISettingsSync), _TRESTAPISettingsSync,
    TypeInfo(TRESTAPIVersion), _TRESTAPIVersion,
    TypeInfo(TSystemTunable), _TSystemTunable,
    TypeInfo(TSystemVersion), _TSystemVersion,
    TypeInfo(TWebGUISettings), _TWebGUISettings,
    TypeInfo(TAuthServer), _TAuthServer,
    TypeInfo(TUser), _TUser,
    TypeInfo(TUserGroup), _TUserGroup,
    TypeInfo(TIPsecApply), _TIPsecApply,
    TypeInfo(TIPsecPhase1Encryption), _TIPsecPhase1Encryption,
    TypeInfo(TIPsecPhase1), _TIPsecPhase1,
    TypeInfo(TIPsecPhase2Encryption), _TIPsecPhase2Encryption,
    TypeInfo(TIPsecPhase2), _TIPsecPhase2,
    TypeInfo(TOpenVPNClientSpecificOverride), _TOpenVPNClientSpecificOverride,
    TypeInfo(TOpenVPNClient), _TOpenVPNClient,
    TypeInfo(TOpenVPNServer), _TOpenVPNServer,
    TypeInfo(TWireGuardApply), _TWireGuardApply,
    TypeInfo(TWireGuardPeerAllowedIP), _TWireGuardPeerAllowedIP,
    TypeInfo(TWireGuardPeer), _TWireGuardPeer,
    TypeInfo(TWireGuardSettings), _TWireGuardSettings,
    TypeInfo(TWireGuardTunnelAddress), _TWireGuardTunnelAddress,
    TypeInfo(TWireGuardTunnel), _TWireGuardTunnel]);
end;

initialization
  RegisterRtti;

end.
