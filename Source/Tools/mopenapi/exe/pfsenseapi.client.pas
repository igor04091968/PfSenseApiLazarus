unit pfsenseapi.client;

{$I mormot.defines.inc}

interface

{
  ------------------------------------------------------------------
  PFSENSE REST API DOCUMENTATION client as TPfsenseapiClient class

  Generated 8 Mar 2025 by igor via mopenapi - DO NOT MODIFY BY HAND!
  ------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.unicode,
  mormot.core.text,
  mormot.core.buffers,
  mormot.core.datetime,
  mormot.core.rtti,
  mormot.core.json,
  mormot.core.variants,
  mormot.net.client,
  pfsenseapi.dto;

type

{ ************ Main TPfsenseapiClient Class }

  TPfsenseapiClient = class
  private
    fClient: IJsonClient;
  public

    // initialize this Client with an associated HTTP/JSON request
    constructor Create(const aClient: IJsonClient);

    // AUTH methods
    function PostAuthJWTEndpoint(const Payload: variant): variant;
    function DeleteAuthKeyEndpoint(const Id: variant): variant;
    function PostAuthKeyEndpoint(const Payload: variant): variant;
    function DeleteAuthKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetAuthKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // DIAGNOSTICS methods
    function DeleteDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
    function GetDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
    function DeleteDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PostDiagnosticsHaltSystemEndpoint(const Payload: variant): variant;
    function PostDiagnosticsRebootEndpoint(const Payload: variant): variant;

    // FIREWALL methods
    function DeleteFirewallAliasEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallAliasEndpoint(const Id: variant): variant;
    function PatchFirewallAliasEndpoint(const Payload: variant): variant;
    function PostFirewallAliasEndpoint(const Payload: variant): variant;
    function DeleteFirewallAliasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallAliasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutFirewallAliasesEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATPortForwardEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallNATPortForwardEndpoint(const Id: variant): variant;
    function PatchFirewallNATPortForwardEndpoint(const Payload: variant): variant;
    function PostFirewallNATPortForwardEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATPortForwardsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallNATPortForwardsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutFirewallNATPortForwardsEndpoint(const Payload: variant): variant;
    function DeleteFirewallRuleEndpoint(const Id: variant): variant;
    function GetFirewallRuleEndpoint(const Id: variant): variant;
    function PatchFirewallRuleEndpoint(const Payload: variant): variant;
    function PostFirewallRuleEndpoint(const Payload: variant): variant;
    function DeleteFirewallRulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallRulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutFirewallRulesEndpoint(const Payload: variant): variant;
    function DeleteFirewallScheduleEndpoint(const Id: variant): variant;
    function GetFirewallScheduleEndpoint(const Id: variant): variant;
    function PatchFirewallScheduleEndpoint(const Payload: variant): variant;
    function PostFirewallScheduleEndpoint(const Payload: variant): variant;
    function DeleteFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
    function PostFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
    function DeleteFirewallSchedulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallSchedulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutFirewallSchedulesEndpoint(const Payload: variant): variant;
    function DeleteFirewallStatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallStatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetFirewallStatesSizeEndpoint(): variant;
    function PatchFirewallStatesSizeEndpoint(const Payload: variant): variant;
    function DeleteFirewallVirtualIPEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallVirtualIPEndpoint(const Id: variant): variant;
    function PatchFirewallVirtualIPEndpoint(const Payload: variant): variant;
    function PostFirewallVirtualIPEndpoint(const Payload: variant): variant;
    function GetFirewallVirtualIPApplyEndpoint(): variant;
    function PostFirewallVirtualIPApplyEndpoint(const Payload: variant): variant;
    function DeleteFirewallVirtualIPsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallVirtualIPsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // INTERFACE methods
    function DeleteNetworkInterfaceEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetNetworkInterfaceEndpoint(const Id: variant): variant;
    function PatchNetworkInterfaceEndpoint(const Payload: variant): variant;
    function PostNetworkInterfaceEndpoint(const Payload: variant): variant;
    function GetInterfaceApplyEndpoint(): variant;
    function PostInterfaceApplyEndpoint(const Payload: variant): variant;
    function GetInterfaceAvailableInterfacesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteInterfaceBridgeEndpoint(const Id: variant): variant;
    function GetInterfaceBridgeEndpoint(const Id: variant): variant;
    function PatchInterfaceBridgeEndpoint(const Payload: variant): variant;
    function PostInterfaceBridgeEndpoint(const Payload: variant): variant;
    function GetInterfaceBridgesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteInterfaceGREEndpoint(const Id: variant): variant;
    function GetInterfaceGREEndpoint(const Id: variant): variant;
    function PatchInterfaceGREEndpoint(const Payload: variant): variant;
    function PostInterfaceGREEndpoint(const Payload: variant): variant;
    function DeleteInterfaceGREsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceGREsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteInterfaceGroupEndpoint(const Id: variant): variant;
    function GetInterfaceGroupEndpoint(const Id: variant): variant;
    function PatchInterfaceGroupEndpoint(const Payload: variant): variant;
    function PostInterfaceGroupEndpoint(const Payload: variant): variant;
    function DeleteInterfaceGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutInterfaceGroupsEndpoint(const Payload: variant): variant;
    function DeleteInterfaceLAGGEndpoint(const Id: variant): variant;
    function GetInterfaceLAGGEndpoint(const Id: variant): variant;
    function PatchInterfaceLAGGEndpoint(const Payload: variant): variant;
    function PostInterfaceLAGGEndpoint(const Payload: variant): variant;
    function DeleteInterfaceLAGGsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceLAGGsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteInterfaceVLANEndpoint(const Id: variant): variant;
    function GetInterfaceVLANEndpoint(const Id: variant): variant;
    function PatchInterfaceVLANEndpoint(const Payload: variant): variant;
    function PostInterfaceVLANEndpoint(const Payload: variant): variant;
    function DeleteInterfaceVLANsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceVLANsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteNetworkInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetNetworkInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // ROUTING methods
    function GetRoutingApplyEndpoint(): variant;
    function PostRoutingApplyEndpoint(const Payload: variant): variant;
    function DeleteRoutingGatewayEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetRoutingGatewayEndpoint(const Id: variant): variant;
    function PatchRoutingGatewayEndpoint(const Payload: variant): variant;
    function PostRoutingGatewayEndpoint(const Payload: variant): variant;
    function GetRoutingGatewayDefaultEndpoint(): variant;
    function PatchRoutingGatewayDefaultEndpoint(const Payload: variant): variant;
    function DeleteRoutingGatewayGroupEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetRoutingGatewayGroupEndpoint(const Id: variant): variant;
    function PatchRoutingGatewayGroupEndpoint(const Payload: variant): variant;
    function PostRoutingGatewayGroupEndpoint(const Payload: variant): variant;
    function DeleteRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
    function PostRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
    function DeleteRoutingGatewayGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetRoutingGatewayGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteRoutingGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetRoutingGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteRoutingStaticRouteEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetRoutingStaticRouteEndpoint(const Id: variant): variant;
    function PatchRoutingStaticRouteEndpoint(const Payload: variant): variant;
    function PostRoutingStaticRouteEndpoint(const Payload: variant): variant;
    function DeleteRoutingStaticRoutesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetRoutingStaticRoutesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // SERVICES methods
    function DeleteServicesACMEAccountKeyEndpoint(const Id: variant): variant;
    function GetServicesACMEAccountKeyEndpoint(const Id: variant): variant;
    function PatchServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
    function PostServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
    function PostServicesACMEAccountKeyRegisterEndpoint(const Payload: variant): variant;
    function GetServicesACMEAccountKeyRegistrationsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteServicesACMEAccountKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesACMEAccountKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesACMEAccountKeysEndpoint(const Payload: variant): variant;
    function DeleteServicesACMECertificateEndpoint(const Id: variant): variant;
    function GetServicesACMECertificateEndpoint(const Id: variant): variant;
    function PatchServicesACMECertificateEndpoint(const Payload: variant): variant;
    function PostServicesACMECertificateEndpoint(const Payload: variant): variant;
    function DeleteServicesACMECertificateActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesACMECertificateActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesACMECertificateActionEndpoint(const Payload: variant): variant;
    function PostServicesACMECertificateActionEndpoint(const Payload: variant): variant;
    function DeleteServicesACMECertificateDomainEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesACMECertificateDomainEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
    function PostServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
    function GetServicesACMECertificateIssuancesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PostServicesACMECertificateIssueEndpoint(const Payload: variant): variant;
    function PostServicesACMECertificateRenewEndpoint(const Payload: variant): variant;
    function GetServicesACMECertificateRenewalsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteServicesACMECertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesACMECertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesACMECertificatesEndpoint(const Payload: variant): variant;
    function GetServicesACMESettingsEndpoint(): variant;
    function PatchServicesACMESettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDAccessListEndpoint(const Id: variant): variant;
    function GetServicesBINDAccessListEndpoint(const Id: variant): variant;
    function PatchServicesBINDAccessListEndpoint(const Payload: variant): variant;
    function PostServicesBINDAccessListEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDAccessListEntryEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesBINDAccessListEntryEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
    function PostServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDAccessListsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesBINDAccessListsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesBINDAccessListsEndpoint(const Payload: variant): variant;
    function GetServicesBINDSettingsEndpoint(): variant;
    function PatchServicesBINDSettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
    function GetServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
    function PatchServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
    function PostServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDSyncRemoteHostsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetServicesBINDSyncRemoteHostsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesBINDSyncRemoteHostsEndpoint(const Payload: variant): variant;
    function GetServicesBINDSyncSettingsEndpoint(): variant;
    function PatchServicesBINDSyncSettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDViewEndpoint(const Id: variant): variant;
    function GetServicesBINDViewEndpoint(const Id: variant): variant;
    function PatchServicesBINDViewEndpoint(const Payload: variant): variant;
    function PostServicesBINDViewEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDViewsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesBINDViewsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesBINDViewsEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDZoneEndpoint(const Id: variant): variant;
    function GetServicesBINDZoneEndpoint(const Id: variant): variant;
    function PatchServicesBINDZoneEndpoint(const Payload: variant): variant;
    function PostServicesBINDZoneEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDZoneRecordEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesBINDZoneRecordEndpoint(const ParentId: variant; const Id: variant): variant;
    function PatchServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
    function PostServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
    function DeleteServicesBINDZonesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesBINDZonesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesBINDZonesEndpoint(const Payload: variant): variant;
    function DeleteServicesCronJobEndpoint(const Id: variant): variant;
    function GetServicesCronJobEndpoint(const Id: variant): variant;
    function PatchServicesCronJobEndpoint(const Payload: variant): variant;
    function PostServicesCronJobEndpoint(const Payload: variant): variant;
    function DeleteServicesCronJobsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesCronJobsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesCronJobsEndpoint(const Payload: variant): variant;
    function GetServicesDHCPServerEndpoint(const Id: variant): variant;
    function PatchServicesDHCPServerEndpoint(const Payload: variant): variant;
    function DeleteServicesDHCPServerAddressPoolEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDHCPServerAddressPoolEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
    function PostServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
    function GetServicesDHCPServerApplyEndpoint(): variant;
    function PostServicesDHCPServerApplyEndpoint(const Payload: variant): variant;
    function PatchServicesDHCPServerBackendEndpoint(const Payload: variant): variant;
    function DeleteServicesDHCPServerCustomOptionEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDHCPServerCustomOptionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDHCPServerCustomOptionEndpoint(const Payload: variant): variant;
    function PostServicesDHCPServerCustomOptionEndpoint(const Payload: variant): variant;
    function DeleteServicesDHCPServerStaticMappingEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDHCPServerStaticMappingEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDHCPServerStaticMappingEndpoint(const Payload: variant): variant;
    function PostServicesDHCPServerStaticMappingEndpoint(const Payload: variant): variant;
    function GetServicesDHCPServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesDHCPServersEndpoint(const Payload: variant): variant;
    function GetServicesDNSForwarderApplyEndpoint(): variant;
    function PostServicesDNSForwarderApplyEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSForwarderHostOverrideEndpoint(const Id: variant;
      Apply: boolean = false): variant;
    function GetServicesDNSForwarderHostOverrideEndpoint(const Id: variant): variant;
    function PatchServicesDNSForwarderHostOverrideEndpoint(const Payload: variant): variant;
    function PostServicesDNSForwarderHostOverrideEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSForwarderHostOverrideAliasEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDNSForwarderHostOverrideAliasEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDNSForwarderHostOverrideAliasEndpoint(const Payload: variant): variant;
    function PostServicesDNSForwarderHostOverrideAliasEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSForwarderHostOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetServicesDNSForwarderHostOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesDNSForwarderHostOverridesEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverAccessListEndpoint(const Id: variant;
      Apply: boolean = false): variant;
    function GetServicesDNSResolverAccessListEndpoint(const Id: variant): variant;
    function PatchServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
    function PostServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverAccessListNetworkEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDNSResolverAccessListNetworkEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDNSResolverAccessListNetworkEndpoint(const Payload: variant): variant;
    function PostServicesDNSResolverAccessListNetworkEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverAccessListsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetServicesDNSResolverAccessListsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesDNSResolverAccessListsEndpoint(const Payload: variant): variant;
    function GetServicesDNSResolverApplyEndpoint(): variant;
    function PostServicesDNSResolverApplyEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverDomainOverrideEndpoint(const Id: variant;
      Apply: boolean = false): variant;
    function GetServicesDNSResolverDomainOverrideEndpoint(const Id: variant): variant;
    function PatchServicesDNSResolverDomainOverrideEndpoint(const Payload: variant): variant;
    function PostServicesDNSResolverDomainOverrideEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverDomainOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetServicesDNSResolverDomainOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesDNSResolverDomainOverridesEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverHostOverrideEndpoint(const Id: variant;
      Apply: boolean = false): variant;
    function GetServicesDNSResolverHostOverrideEndpoint(const Id: variant): variant;
    function PatchServicesDNSResolverHostOverrideEndpoint(const Payload: variant): variant;
    function PostServicesDNSResolverHostOverrideEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverHostOverrideAliasEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetServicesDNSResolverHostOverrideAliasEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesDNSResolverHostOverrideAliasEndpoint(const Payload: variant): variant;
    function PostServicesDNSResolverHostOverrideAliasEndpoint(const Payload: variant): variant;
    function DeleteServicesDNSResolverHostOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetServicesDNSResolverHostOverridesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesDNSResolverHostOverridesEndpoint(const Payload: variant): variant;
    function GetServicesDNSResolverSettingsEndpoint(): variant;
    function PatchServicesDNSResolverSettingsEndpoint(const Payload: variant): variant;
    function GetServicesNTPSettingsEndpoint(): variant;
    function PatchServicesNTPSettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesNTPTimeServerEndpoint(const Id: variant): variant;
    function GetServicesNTPTimeServerEndpoint(const Id: variant): variant;
    function PatchServicesNTPTimeServerEndpoint(const Payload: variant): variant;
    function PostServicesNTPTimeServerEndpoint(const Payload: variant): variant;
    function DeleteServicesNTPTimeServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesNTPTimeServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesNTPTimeServersEndpoint(const Payload: variant): variant;
    function DeleteServicesServiceWatchdogsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesServiceWatchdogsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutServicesServiceWatchdogsEndpoint(const Payload: variant): variant;
    function GetServicesSSHEndpoint(): variant;
    function PatchServicesSSHEndpoint(const Payload: variant): variant;
    function PostServicesWakeOnLANSendEndpoint(const Payload: variant): variant;

    // STATUS methods
    function GetStatusCARPEndpoint(): variant;
    function PatchStatusCARPEndpoint(const Payload: variant): variant;
    function DeleteStatusDHCPServerLeasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetStatusDHCPServerLeasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusLogsDHCPEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusLogsFirewallEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusLogsSettingsEndpoint(): variant;
    function PatchStatusLogsSettingsEndpoint(const Payload: variant): variant;
    function GetStatusLogsSystemEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetStatusOpenVPNServerRouteEndpoint(const ParentId: variant; const Id: variant): variant;
    function GetStatusOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PostStatusServiceEndpoint(const Payload: variant): variant;
    function GetStatusServicesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetStatusSystemEndpoint(): variant;

    // SYSTEM methods
    function DeleteSystemCertificateEndpoint(const Id: variant): variant;
    function GetSystemCertificateEndpoint(const Id: variant): variant;
    function PatchSystemCertificateEndpoint(const Payload: variant): variant;
    function PostSystemCertificateEndpoint(const Payload: variant): variant;
    function PostSystemCertificateGenerateEndpoint(const Payload: variant): variant;
    procedure PostSystemCertificatePKCS12ExportEndpoint(const Payload: variant);
    function PostSystemCertificateRenewEndpoint(const Payload: variant): variant;
    function PostSystemCertificateSigningRequestEndpoint(const Payload: variant): variant;
    function PostSystemCertificateSigningRequestSignEndpoint(const Payload: variant): variant;
    function DeleteSystemCertificateAuthoritiesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetSystemCertificateAuthoritiesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfsenseapi75 = ep75None; const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteSystemCertificateAuthorityEndpoint(const Id: variant): variant;
    function GetSystemCertificateAuthorityEndpoint(const Id: variant): variant;
    function PatchSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityGenerateEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityRenewEndpoint(const Payload: variant): variant;
    function DeleteSystemCertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemCertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetSystemConsoleEndpoint(): variant;
    function PatchSystemConsoleEndpoint(const Payload: variant): variant;
    function DeleteSystemCRLEndpoint(const Id: variant): variant;
    function GetSystemCRLEndpoint(const Id: variant): variant;
    function PatchSystemCRLEndpoint(const Payload: variant): variant;
    function PostSystemCRLEndpoint(const Payload: variant): variant;
    function DeleteSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
    function PostSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
    function DeleteSystemCRLsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemCRLsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function GetSystemDNSEndpoint(): variant;
    function PatchSystemDNSEndpoint(const Payload: variant): variant;
    function GetSystemHostnameEndpoint(): variant;
    function PatchSystemHostnameEndpoint(const Payload: variant): variant;
    function DeleteSystemPackageEndpoint(const Id: variant): variant;
    function GetSystemPackageEndpoint(const Id: variant): variant;
    function PostSystemPackageEndpoint(const Payload: variant): variant;
    function GetSystemPackageAvailableEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteSystemPackagesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemPackagesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteSystemRESTAPIAccessListEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemRESTAPIAccessListEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutSystemRESTAPIAccessListEndpoint(const Payload: variant): variant;
    function DeleteSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
    function GetSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
    function PatchSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
    function PostSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
    function GetSystemRESTAPISettingsEndpoint(): variant;
    function PatchSystemRESTAPISettingsEndpoint(const Payload: variant): variant;
    function PostSystemRESTAPISettingsSyncEndpoint(const Payload: variant): variant;
    function GetSystemRESTAPIVersionEndpoint(): variant;
    function PatchSystemRESTAPIVersionEndpoint(const Payload: variant): variant;
    function DeleteSystemTunableEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetSystemTunableEndpoint(const Id: variant): variant;
    function PatchSystemTunableEndpoint(const Payload: variant): variant;
    function PostSystemTunableEndpoint(const Payload: variant): variant;
    function DeleteSystemTunablesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemTunablesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutSystemTunablesEndpoint(const Payload: variant): variant;
    function GetSystemVersionEndpoint(): variant;
    function GetSystemWebGUISettingsEndpoint(): variant;
    function PatchSystemWebGUISettingsEndpoint(const Payload: variant): variant;

    // USER methods
    function DeleteUserEndpoint(const Id: variant): variant;
    function GetUserEndpoint(const Id: variant): variant;
    function PatchUserEndpoint(const Payload: variant): variant;
    function PostUserEndpoint(const Payload: variant): variant;
    function DeleteUserAuthServerEndpoint(const Id: variant): variant;
    function GetUserAuthServerEndpoint(const Id: variant): variant;
    function PatchUserAuthServerEndpoint(const Payload: variant): variant;
    function PostUserAuthServerEndpoint(const Payload: variant): variant;
    function DeleteUserAuthServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetUserAuthServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutUserAuthServersEndpoint(const Payload: variant): variant;
    function DeleteUserGroupEndpoint(const Id: variant): variant;
    function GetUserGroupEndpoint(const Id: variant): variant;
    function PatchUserGroupEndpoint(const Payload: variant): variant;
    function PostUserGroupEndpoint(const Payload: variant): variant;
    function DeleteUserGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetUserGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function PutUserGroupsEndpoint(const Payload: variant): variant;
    function DeleteUsersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetUsersEndpoint(const Query: variant; Limit: integer = 0; Offset: integer = 0;
      const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // VPN methods
    function DeleteVPNOpenVPNClientEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNClientEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNClientEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNClientEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteVPNOpenVPNCSOEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNCSOEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNCSOsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNCSOsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;
    function DeleteVPNOpenVPNServerEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNServerEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNServerEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNServerEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfsenseapi75 = ep75None;
      const SortFlags: TEnumPfsenseapi76 = ep76None): variant;

    // access to the associated HTTP/JSON client instance
    property JsonClient: IJsonClient
      read fClient write fClient;
  end;


implementation



{ ************ Main TPfsenseapiClient Class }

{ TPfsenseapiClient}

constructor TPfsenseapiClient.Create(const aClient: IJsonClient);
begin
  fClient := aClient;
  fClient.Options := [jcoParseTolerant, jcoHttpErrorRaise];
  fClient.UrlEncoder :=
    [ueEncodeNames, ueSkipVoidString, ueSkipVoidValue, ueStarNameIsCsv];
end;

function TPfsenseapiClient.PostAuthJWTEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/auth/jwt', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteAuthKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/auth/key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostAuthKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/auth/key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteAuthKeysEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/auth/keys', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetAuthKeysEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/auth/keys', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteDiagnosticsConfigHistoryRevisionEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/config_history/revision', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetDiagnosticsConfigHistoryRevisionEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/config_history/revision', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteDiagnosticsConfigHistoryRevisionsEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/config_history/revisions', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetDiagnosticsConfigHistoryRevisionsEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/config_history/revisions', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostDiagnosticsHaltSystemEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/diagnostics/halt_system', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostDiagnosticsRebootEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/diagnostics/reboot', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallAliasEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/alias', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallAliasEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/alias', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallAliasEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallAliasEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallAliasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/aliases', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallAliasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/aliases', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutFirewallAliasesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/aliases', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallNATPortForwardEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/port_forward', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallNATPortForwardEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/port_forward', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallNATPortForwardEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/nat/port_forward', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallNATPortForwardEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/nat/port_forward', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallNATPortForwardsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/port_forwards', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallNATPortForwardsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/port_forwards', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutFirewallNATPortForwardsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/nat/port_forwards', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallRuleEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/rule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallRuleEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/rule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallRuleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/rule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallRuleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/rule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallRulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/rules', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallRulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/rules', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutFirewallRulesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/rules', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallScheduleEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallScheduleEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallScheduleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/schedule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallScheduleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/schedule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedule/time_range', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedule/time_range', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/schedule/time_range', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/schedule/time_range', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallSchedulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedules', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallSchedulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedules', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutFirewallSchedulesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/schedules', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallStatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/states', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallStatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/states', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallStatesSizeEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/states/size', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallStatesSizeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/states/size', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallVirtualIPEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/virtual_ip', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallVirtualIPEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ip', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchFirewallVirtualIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/virtual_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallVirtualIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/virtual_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallVirtualIPApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ip/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostFirewallVirtualIPApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/virtual_ip/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteFirewallVirtualIPsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/virtual_ips', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetFirewallVirtualIPsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ips', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteNetworkInterfaceEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetNetworkInterfaceEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchNetworkInterfaceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostNetworkInterfaceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/interface/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceAvailableInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/available_interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceBridgeEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/bridge', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceBridgeEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/bridge', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchInterfaceBridgeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/bridge', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceBridgeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/bridge', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceBridgesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/bridges', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceGREEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/gre', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceGREEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/gre', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchInterfaceGREEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/gre', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceGREEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/gre', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceGREsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/gres', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceGREsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/gres', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchInterfaceGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutInterfaceGroupsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/interface/groups', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceLAGGEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/lagg', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceLAGGEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/lagg', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchInterfaceLAGGEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/lagg', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceLAGGEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/lagg', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceLAGGsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/laggs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceLAGGsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/laggs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceVLANEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/vlan', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceVLANEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/vlan', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchInterfaceVLANEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/vlan', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostInterfaceVLANEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/vlan', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteInterfaceVLANsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/vlans', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetInterfaceVLANsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interface/vlans', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteNetworkInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetNetworkInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/routing/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostRoutingApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingGatewayEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewayEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchRoutingGatewayEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostRoutingGatewayEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewayDefaultEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/default', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchRoutingGatewayDefaultEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/default', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingGatewayGroupEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/group', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewayGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchRoutingGatewayGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostRoutingGatewayGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/group/priority', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/group/priority', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/group/priority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway/group/priority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingGatewayGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewayGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingGatewaysEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingGatewaysEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingStaticRouteEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/static_route', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingStaticRouteEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/static_route', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchRoutingStaticRouteEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/static_route', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostRoutingStaticRouteEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/static_route', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteRoutingStaticRoutesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/static_routes', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetRoutingStaticRoutesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/routing/static_routes', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMEAccountKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/account_key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMEAccountKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/account_key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/account_key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMEAccountKeyRegisterEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/account_key/register', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMEAccountKeyRegistrationsEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_key/registrations', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMEAccountKeysEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/account_keys', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMEAccountKeysEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_keys', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesACMEAccountKeysEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/acme/account_keys', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMECertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesACMECertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMECertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMECertificateActionEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificateActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesACMECertificateActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMECertificateActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMECertificateDomainEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate/domain', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificateDomainEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/domain', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate/domain', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/domain', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificateIssuancesEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/issuances', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMECertificateIssueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/issue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesACMECertificateRenewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificateRenewalsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/renewals', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesACMECertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMECertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesACMECertificatesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/acme/certificates', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesACMESettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesACMESettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDAccessListEntryEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_list/entry', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDAccessListEntryEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_list/entry', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesBINDAccessListsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/access_lists', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/sync/remote_host', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/remote_host', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/sync/remote_host', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/sync/remote_host', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDSyncRemoteHostsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/sync/remote_hosts', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDSyncRemoteHostsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/remote_hosts', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesBINDSyncRemoteHostsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/sync/remote_hosts', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDSyncSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDSyncSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/sync/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDViewEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/view', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDViewEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/view', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDViewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/view', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDViewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/view', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDViewsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/views', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDViewsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/views', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesBINDViewsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/views', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDZoneEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zone', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDZoneEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zone', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDZoneEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/zone', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDZoneEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/zone', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDZoneRecordEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zone/record', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDZoneRecordEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zone/record', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/zone/record', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/zone/record', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesBINDZonesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zones', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesBINDZonesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zones', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesBINDZonesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/zones', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesCronJobEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/cron/job', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesCronJobEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/cron/job', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesCronJobEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/cron/job', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesCronJobEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/cron/job', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesCronJobsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/cron/jobs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesCronJobsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/cron/jobs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesCronJobsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/cron/jobs', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDHCPServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDHCPServerAddressPoolEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/address_pool', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServerAddressPoolEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/address_pool', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/address_pool', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/address_pool', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServerApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDHCPServerApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDHCPServerBackendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/backend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDHCPServerCustomOptionEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/custom_option', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServerCustomOptionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/custom_option', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDHCPServerCustomOptionEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/custom_option', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDHCPServerCustomOptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/custom_option', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDHCPServerStaticMappingEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/static_mapping', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServerStaticMappingEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/static_mapping', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDHCPServerStaticMappingEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/static_mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDHCPServerStaticMappingEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/static_mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDHCPServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesDHCPServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dhcp_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSForwarderApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSForwarderApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSForwarderHostOverrideEndpoint(
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSForwarderHostOverrideEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSForwarderHostOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_forwarder/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSForwarderHostOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSForwarderHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSForwarderHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSForwarderHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_forwarder/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSForwarderHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSForwarderHostOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSForwarderHostOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesDNSForwarderHostOverridesEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_forwarder/host_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverAccessListEndpoint(
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_list', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverAccessListNetworkEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_list/network', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverAccessListNetworkEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_list/network', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverAccessListNetworkEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/access_list/network', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverAccessListNetworkEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/access_list/network', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverAccessListsEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesDNSResolverAccessListsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/access_lists', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverDomainOverrideEndpoint(
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/domain_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverDomainOverrideEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/domain_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverDomainOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/domain_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverDomainOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/domain_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverDomainOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/domain_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverDomainOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/domain_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesDNSResolverDomainOverridesEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/domain_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverHostOverrideEndpoint(
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverHostOverrideEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverHostOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverHostOverrideEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesDNSResolverHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesDNSResolverHostOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverHostOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray;
  const SortOrder: TEnumPfsenseapi75; const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesDNSResolverHostOverridesEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/host_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesDNSResolverSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesDNSResolverSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesNTPSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesNTPSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ntp/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesNTPTimeServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/ntp/time_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesNTPTimeServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/time_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesNTPTimeServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ntp/time_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesNTPTimeServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/ntp/time_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesNTPTimeServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/ntp/time_servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesNTPTimeServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/time_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesNTPTimeServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/ntp/time_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteServicesServiceWatchdogsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/service_watchdogs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesServiceWatchdogsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/services/service_watchdogs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutServicesServiceWatchdogsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/service_watchdogs', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetServicesSSHEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/ssh', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchServicesSSHEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ssh', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostServicesWakeOnLANSendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/wake_on_lan/send', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusCARPEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/carp', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchStatusCARPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/status/carp', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteStatusDHCPServerLeasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/status/dhcp_server/leases', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusDHCPServerLeasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/dhcp_server/leases', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusGatewaysEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusLogsDHCPEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/dhcp', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusLogsFirewallEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/firewall', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusLogsSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchStatusLogsSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/status/logs/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusLogsSystemEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/system', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteStatusOpenVPNServerConnectionEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/status/openvpn/server/connection', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/server/connection', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusOpenVPNServerRouteEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/server/route', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostStatusServiceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/status/service', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusServicesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/status/services', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetStatusSystemEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/system', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateGenerateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/generate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

procedure TPfsenseapiClient.PostSystemCertificatePKCS12ExportEndpoint(const Payload: variant);
begin
  fClient.Request('POST', '/api/v2/system/certificate/pkcs12/export', [], [], [],
    Payload, {dummy:}self, TypeInfo(variant), nil);
end;

function TPfsenseapiClient.PostSystemCertificateRenewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateSigningRequestEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/signing_request', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateSigningRequestSignEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/signing_request/sign', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCertificateAuthoritiesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate_authorities', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCertificateAuthoritiesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate_authorities', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCertificateAuthorityEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate_authority', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCertificateAuthorityEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate_authority', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/certificate_authority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateAuthorityGenerateEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority/generate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCertificateAuthorityRenewEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemConsoleEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/console', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemConsoleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/console', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCRLEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crl', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCRLEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/crl', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemCRLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/crl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCRLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/crl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crl/revoked_certificate', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/crl/revoked_certificate', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/crl/revoked_certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/crl/revoked_certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemCRLsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crls', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemCRLsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/crls', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemDNSEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/dns', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemDNSEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/dns', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemHostnameEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/hostname', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemHostnameEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/hostname', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemPackageEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/package', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemPackageEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/package', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemPackageEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/package', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemPackageAvailableEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/package/available', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemPackagesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/packages', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemPackagesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/packages', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemRESTAPIAccessListEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/restapi/access_list', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemRESTAPIAccessListEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/access_list', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutSystemRESTAPIAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/system/restapi/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/restapi/access_list/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/access_list/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/restapi/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemRESTAPISettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemRESTAPISettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemRESTAPISettingsSyncEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/restapi/settings/sync', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemRESTAPIVersionEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/version', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemRESTAPIVersionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/version', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemTunableEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/tunable', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemTunableEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/tunable', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemTunableEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/tunable', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostSystemTunableEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/tunable', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteSystemTunablesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/tunables', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemTunablesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/system/tunables', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutSystemTunablesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/system/tunables', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemVersionEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/version', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetSystemWebGUISettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/webgui/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchSystemWebGUISettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/webgui/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUserEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUserEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchUserEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostUserEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUserAuthServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/auth_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUserAuthServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user/auth_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchUserAuthServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user/auth_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostUserAuthServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user/auth_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUserAuthServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/auth_servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUserAuthServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/user/auth_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutUserAuthServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/user/auth_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUserGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUserGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchUserGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostUserGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUserGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUserGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/user/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PutUserGroupsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/user/groups', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteUsersEndpoint(const Query: variant; Limit: integer;
  Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/users', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetUsersEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/users', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNClientEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/client', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNClientEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/client', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchVPNOpenVPNClientEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/client', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostVPNOpenVPNClientEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/client', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNCSOEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/cso', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNCSOEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/cso', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/cso', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/cso', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNCSOsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/csos', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNCSOsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/csos', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.PatchVPNOpenVPNServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.PostVPNOpenVPNServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfsenseapiClient.DeleteVPNOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfsenseapiClient.GetVPNOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfsenseapi75;
  const SortFlags: TEnumPfsenseapi76): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFSENSEAPI75_TXT[SortOrder],
    'sort_flags', ENUMPFSENSEAPI76_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;


end.