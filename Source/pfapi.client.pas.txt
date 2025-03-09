unit pfapi.client;

{$I mormot.defines.inc}

interface

{
  ------------------------------------------------------------------
  PFSENSE REST API DOCUMENTATION client as TPfApiClient class

  Generated 9 Mar 2025 by igor via mopenapi - DO NOT MODIFY BY HAND!
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
  pfapi.dto;

type

{ ************ Main TPfApiClient Class }

  TPfApiClient = class
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;

    // DIAGNOSTICS methods
    function DeleteDiagnosticsARPTableEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetDiagnosticsARPTableEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteDiagnosticsARPTableEntryEndpoint(const Id: variant): variant;
    function GetDiagnosticsARPTableEntryEndpoint(const Id: variant): variant;
    function PostDiagnosticsCommandPromptEndpoint(const Payload: variant): variant;
    function DeleteDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
    function GetDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
    function DeleteDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PostDiagnosticsHaltSystemEndpoint(const Payload: variant): variant;
    function PostDiagnosticsRebootEndpoint(const Payload: variant): variant;

    // FIREWALL methods
    function GetFirewallAdvancedSettingsEndpoint(): variant;
    function PatchFirewallAdvancedSettingsEndpoint(const Payload: variant): variant;
    function DeleteFirewallAliasEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallAliasEndpoint(const Id: variant): variant;
    function PatchFirewallAliasEndpoint(const Payload: variant): variant;
    function PostFirewallAliasEndpoint(const Payload: variant): variant;
    function DeleteFirewallAliasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallAliasesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallAliasesEndpoint(const Payload: variant): variant;
    function GetFirewallApplyEndpoint(): variant;
    function PostFirewallApplyEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATOneToOneMappingEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallNATOneToOneMappingEndpoint(const Id: variant): variant;
    function PatchFirewallNATOneToOneMappingEndpoint(const Payload: variant): variant;
    function PostFirewallNATOneToOneMappingEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATOneToOneMappingsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetFirewallNATOneToOneMappingsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallNATOneToOneMappingsEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATOutboundMappingEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallNATOutboundMappingEndpoint(const Id: variant): variant;
    function PatchFirewallNATOutboundMappingEndpoint(const Payload: variant): variant;
    function PostFirewallNATOutboundMappingEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATOutboundMappingsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0): variant;
    function GetFirewallNATOutboundMappingsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallNATOutboundMappingsEndpoint(const Payload: variant): variant;
    function GetFirewallNATOutboundModeEndpoint(): variant;
    function PatchFirewallNATOutboundModeEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATPortForwardEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallNATPortForwardEndpoint(const Id: variant): variant;
    function PatchFirewallNATPortForwardEndpoint(const Payload: variant): variant;
    function PostFirewallNATPortForwardEndpoint(const Payload: variant): variant;
    function DeleteFirewallNATPortForwardsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallNATPortForwardsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallNATPortForwardsEndpoint(const Payload: variant): variant;
    function DeleteFirewallRuleEndpoint(const Id: variant): variant;
    function GetFirewallRuleEndpoint(const Id: variant): variant;
    function PatchFirewallRuleEndpoint(const Payload: variant): variant;
    function PostFirewallRuleEndpoint(const Payload: variant): variant;
    function DeleteFirewallRulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallRulesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallSchedulesEndpoint(const Payload: variant): variant;
    function DeleteFirewallStatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallStatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetFirewallStatesSizeEndpoint(): variant;
    function PatchFirewallStatesSizeEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShaperEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallTrafficShaperEndpoint(const Id: variant): variant;
    function PatchFirewallTrafficShaperEndpoint(const Payload: variant): variant;
    function PostFirewallTrafficShaperEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShaperLimiterEndpoint(const Id: variant;
      Apply: boolean = false): variant;
    function GetFirewallTrafficShaperLimiterEndpoint(const Id: variant): variant;
    function PatchFirewallTrafficShaperLimiterEndpoint(const Payload: variant): variant;
    function PostFirewallTrafficShaperLimiterEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShaperLimiterBandwidthEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetFirewallTrafficShaperLimiterBandwidthEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchFirewallTrafficShaperLimiterBandwidthEndpoint(const Payload: variant): variant;
    function PostFirewallTrafficShaperLimiterBandwidthEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShaperLimiterQueueEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetFirewallTrafficShaperLimiterQueueEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchFirewallTrafficShaperLimiterQueueEndpoint(const Payload: variant): variant;
    function PostFirewallTrafficShaperLimiterQueueEndpoint(const Payload: variant): variant;
    function GetFirewallTrafficShaperLimitersEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallTrafficShaperLimitersEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShaperQueueEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetFirewallTrafficShaperQueueEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchFirewallTrafficShaperQueueEndpoint(const Payload: variant): variant;
    function PostFirewallTrafficShaperQueueEndpoint(const Payload: variant): variant;
    function DeleteFirewallTrafficShapersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallTrafficShapersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutFirewallTrafficShapersEndpoint(const Payload: variant): variant;
    function DeleteFirewallVirtualIPEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetFirewallVirtualIPEndpoint(const Id: variant): variant;
    function PatchFirewallVirtualIPEndpoint(const Payload: variant): variant;
    function PostFirewallVirtualIPEndpoint(const Payload: variant): variant;
    function GetFirewallVirtualIPApplyEndpoint(): variant;
    function PostFirewallVirtualIPApplyEndpoint(const Payload: variant): variant;
    function DeleteFirewallVirtualIPsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetFirewallVirtualIPsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;

    // GRAPHQL methods
    function PostGraphQLEndpoint(const Payload: variant): variant;

    // INTERFACE methods
    function DeleteNetworkInterfaceEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetNetworkInterfaceEndpoint(const Id: variant): variant;
    function PatchNetworkInterfaceEndpoint(const Payload: variant): variant;
    function PostNetworkInterfaceEndpoint(const Payload: variant): variant;
    function GetInterfaceApplyEndpoint(): variant;
    function PostInterfaceApplyEndpoint(const Payload: variant): variant;
    function GetInterfaceAvailableInterfacesEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteInterfaceBridgeEndpoint(const Id: variant): variant;
    function GetInterfaceBridgeEndpoint(const Id: variant): variant;
    function PatchInterfaceBridgeEndpoint(const Payload: variant): variant;
    function PostInterfaceBridgeEndpoint(const Payload: variant): variant;
    function GetInterfaceBridgesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteInterfaceGREEndpoint(const Id: variant): variant;
    function GetInterfaceGREEndpoint(const Id: variant): variant;
    function PatchInterfaceGREEndpoint(const Payload: variant): variant;
    function PostInterfaceGREEndpoint(const Payload: variant): variant;
    function DeleteInterfaceGREsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceGREsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteInterfaceGroupEndpoint(const Id: variant): variant;
    function GetInterfaceGroupEndpoint(const Id: variant): variant;
    function PatchInterfaceGroupEndpoint(const Payload: variant): variant;
    function PostInterfaceGroupEndpoint(const Payload: variant): variant;
    function DeleteInterfaceGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutInterfaceGroupsEndpoint(const Payload: variant): variant;
    function DeleteInterfaceLAGGEndpoint(const Id: variant): variant;
    function GetInterfaceLAGGEndpoint(const Id: variant): variant;
    function PatchInterfaceLAGGEndpoint(const Payload: variant): variant;
    function PostInterfaceLAGGEndpoint(const Payload: variant): variant;
    function DeleteInterfaceLAGGsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceLAGGsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteInterfaceVLANEndpoint(const Id: variant): variant;
    function GetInterfaceVLANEndpoint(const Id: variant): variant;
    function PatchInterfaceVLANEndpoint(const Payload: variant): variant;
    function PostInterfaceVLANEndpoint(const Payload: variant): variant;
    function DeleteInterfaceVLANsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetInterfaceVLANsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteNetworkInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetNetworkInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;

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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteRoutingGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetRoutingGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteRoutingStaticRouteEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetRoutingStaticRouteEndpoint(const Id: variant): variant;
    function PatchRoutingStaticRouteEndpoint(const Payload: variant): variant;
    function PostRoutingStaticRouteEndpoint(const Payload: variant): variant;
    function DeleteRoutingStaticRoutesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetRoutingStaticRoutesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;

    // SERVICES methods
    function DeleteServicesACMEAccountKeyEndpoint(const Id: variant): variant;
    function GetServicesACMEAccountKeyEndpoint(const Id: variant): variant;
    function PatchServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
    function PostServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
    function PostServicesACMEAccountKeyRegisterEndpoint(const Payload: variant): variant;
    function GetServicesACMEAccountKeyRegistrationsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteServicesACMEAccountKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesACMEAccountKeysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PostServicesACMECertificateIssueEndpoint(const Payload: variant): variant;
    function PostServicesACMECertificateRenewEndpoint(const Payload: variant): variant;
    function GetServicesACMECertificateRenewalsEndpoint(const Query: variant;
      Limit: integer = 0; Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil;
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteServicesACMECertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesACMECertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesBINDZonesEndpoint(const Payload: variant): variant;
    function DeleteServicesCronJobEndpoint(const Id: variant): variant;
    function GetServicesCronJobEndpoint(const Id: variant): variant;
    function PatchServicesCronJobEndpoint(const Payload: variant): variant;
    function PostServicesCronJobEndpoint(const Payload: variant): variant;
    function DeleteServicesCronJobsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesCronJobsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesDNSResolverHostOverridesEndpoint(const Payload: variant): variant;
    function GetServicesDNSResolverSettingsEndpoint(): variant;
    function PatchServicesDNSResolverSettingsEndpoint(const Payload: variant): variant;
    function GetServicesHAProxyApplyEndpoint(): variant;
    function PostServicesHAProxyApplyEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendEndpoint(const Id: variant): variant;
    function GetServicesHAProxyBackendEndpoint(const Id: variant): variant;
    function PatchServicesHAProxyBackendEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyBackendEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendACLEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyBackendACLEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyBackendACLEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyBackendACLEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyBackendActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyBackendActionEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyBackendActionEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendErrorFileEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyBackendErrorFileEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyBackendErrorFileEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyBackendErrorFileEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendServerEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyBackendServerEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyBackendServerEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyBackendServerEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyBackendsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesHAProxyBackendsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesHAProxyBackendsEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFileEndpoint(const Id: variant): variant;
    function GetServicesHAProxyFileEndpoint(const Id: variant): variant;
    function PatchServicesHAProxyFileEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFileEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFiles(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesHAProxyFiles(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesHAProxyFiles(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendEndpoint(const Id: variant): variant;
    function GetServicesHAProxyFrontendEndpoint(const Id: variant): variant;
    function PatchServicesHAProxyFrontendEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFrontendEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendACLEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyFrontendACLEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyFrontendACLEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFrontendACLEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyFrontendActionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyFrontendActionEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFrontendActionEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendAddressEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyFrontendAddressEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyFrontendAddressEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFrontendAddressEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendErrorFileEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetServicesHAProxyFrontendErrorFileEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchServicesHAProxyFrontendErrorFileEndpoint(const Payload: variant): variant;
    function PostServicesHAProxyFrontendErrorFileEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxyFrontendsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesHAProxyFrontendsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesHAProxyFrontendsEndpoint(const Payload: variant): variant;
    function GetServicesHAProxySettingsEndpoint(): variant;
    function PatchServicesHAProxySettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxySettingsDNSResolverEndpoint(const Id: variant): variant;
    function GetServicesHAProxySettingsDNSResolverEndpoint(const Id: variant): variant;
    function PatchServicesHAProxySettingsDNSResolverEndpoint(const Payload: variant): variant;
    function PostServicesHAProxySettingsDNSResolverEndpoint(const Payload: variant): variant;
    function DeleteServicesHAProxySettingsEmailMailerEndpoint(const Id: variant): variant;
    function GetServicesHAProxySettingsEmailMailerEndpoint(const Id: variant): variant;
    function PatchServicesHAProxySettingsEmailMailerEndpoint(const Payload: variant): variant;
    function PostServicesHAProxySettingsEmailMailerEndpoint(const Payload: variant): variant;
    function GetServicesNTPSettingsEndpoint(): variant;
    function PatchServicesNTPSettingsEndpoint(const Payload: variant): variant;
    function DeleteServicesNTPTimeServerEndpoint(const Id: variant): variant;
    function GetServicesNTPTimeServerEndpoint(const Id: variant): variant;
    function PatchServicesNTPTimeServerEndpoint(const Payload: variant): variant;
    function PostServicesNTPTimeServerEndpoint(const Payload: variant): variant;
    function DeleteServicesNTPTimeServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesNTPTimeServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutServicesNTPTimeServersEndpoint(const Payload: variant): variant;
    function DeleteServicesServiceWatchdogEndpoint(const Id: variant): variant;
    function GetServicesServiceWatchdogEndpoint(const Id: variant): variant;
    function PatchServicesServiceWatchdogEndpoint(const Payload: variant): variant;
    function PostServicesServiceWatchdogEndpoint(const Payload: variant): variant;
    function DeleteServicesServiceWatchdogsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetServicesServiceWatchdogsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusGatewaysEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusInterfacesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusIPsecChildSAEndpoint(const ParentId: variant; const Id: variant): variant;
    function GetStatusIPsecSAsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusLogsDHCPEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusLogsFirewallEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusLogsSettingsEndpoint(): variant;
    function PatchStatusLogsSettingsEndpoint(const Payload: variant): variant;
    function GetStatusLogsSystemEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetStatusOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetStatusOpenVPNServerRouteEndpoint(const ParentId: variant; const Id: variant): variant;
    function GetStatusOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PostStatusServiceEndpoint(const Payload: variant): variant;
    function GetStatusServicesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      const SortOrder: TEnumPfApi63 = epa63None; const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteSystemCertificateAuthorityEndpoint(const Id: variant): variant;
    function GetSystemCertificateAuthorityEndpoint(const Id: variant): variant;
    function PatchSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityGenerateEndpoint(const Payload: variant): variant;
    function PostSystemCertificateAuthorityRenewEndpoint(const Payload: variant): variant;
    function DeleteSystemCertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemCertificatesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetSystemDNSEndpoint(): variant;
    function PatchSystemDNSEndpoint(const Payload: variant): variant;
    function GetSystemHostnameEndpoint(): variant;
    function PatchSystemHostnameEndpoint(const Payload: variant): variant;
    function GetSystemNotificationsEmailSettingsEndpoint(): variant;
    function PatchSystemNotificationsEmailSettingsEndpoint(const Payload: variant): variant;
    function DeleteSystemPackageEndpoint(const Id: variant): variant;
    function GetSystemPackageEndpoint(const Id: variant): variant;
    function PostSystemPackageEndpoint(const Payload: variant): variant;
    function GetSystemPackageAvailableEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteSystemPackagesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemPackagesEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteSystemRESTAPIAccessListEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetSystemRESTAPIAccessListEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
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
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutUserAuthServersEndpoint(const Payload: variant): variant;
    function DeleteUserGroupEndpoint(const Id: variant): variant;
    function GetUserGroupEndpoint(const Id: variant): variant;
    function PatchUserGroupEndpoint(const Payload: variant): variant;
    function PostUserGroupEndpoint(const Payload: variant): variant;
    function DeleteUserGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetUserGroupsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutUserGroupsEndpoint(const Payload: variant): variant;
    function DeleteUsersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetUsersEndpoint(const Query: variant; Limit: integer = 0; Offset: integer = 0;
      const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;

    // VPN methods
    function GetVPNIPsecApplyEndpoint(): variant;
    function PostVPNIPsecApplyEndpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase1Endpoint(const Id: variant; Apply: boolean = false): variant;
    function GetVPNIPsecPhase1Endpoint(const Id: variant): variant;
    function PatchVPNIPsecPhase1Endpoint(const Payload: variant): variant;
    function PostVPNIPsecPhase1Endpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase1EncryptionEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetVPNIPsecPhase1EncryptionEndpoint(const ParentId: variant; const Id: variant): variant;
    function PatchVPNIPsecPhase1EncryptionEndpoint(const Payload: variant): variant;
    function PostVPNIPsecPhase1EncryptionEndpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase1sEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNIPsecPhase1sEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutVPNIPsecPhase1sEndpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase2Endpoint(const Id: variant; Apply: boolean = false): variant;
    function GetVPNIPsecPhase2Endpoint(const Id: variant): variant;
    function PatchVPNIPsecPhase2Endpoint(const Payload: variant): variant;
    function PostVPNIPsecPhase2Endpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase2EncryptionEndpoint(const ParentId: variant;
      const Id: variant; Apply: boolean = false): variant;
    function GetVPNIPsecPhase2EncryptionEndpoint(const ParentId: variant; const Id: variant): variant;
    function PatchVPNIPsecPhase2EncryptionEndpoint(const Payload: variant): variant;
    function PostVPNIPsecPhase2EncryptionEndpoint(const Payload: variant): variant;
    function DeleteVPNIPsecPhase2sEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNIPsecPhase2sEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutVPNIPsecPhase2sEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNClientEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNClientEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNClientEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNClientEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNClientsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteVPNOpenVPNCSOEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNCSOEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNCSOsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNCSOsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function DeleteVPNOpenVPNServerEndpoint(const Id: variant): variant;
    function GetVPNOpenVPNServerEndpoint(const Id: variant): variant;
    function PatchVPNOpenVPNServerEndpoint(const Payload: variant): variant;
    function PostVPNOpenVPNServerEndpoint(const Payload: variant): variant;
    function DeleteVPNOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNOpenVPNServersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function GetVPNWireGuardApplyEndpoint(): variant;
    function PostVPNWireGuardApplyEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardPeerEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetVPNWireGuardPeerEndpoint(const Id: variant): variant;
    function PatchVPNWireGuardPeerEndpoint(const Payload: variant): variant;
    function PostVPNWireGuardPeerEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardPeerAllowedIPEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetVPNWireGuardPeerAllowedIPEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchVPNWireGuardPeerAllowedIPEndpoint(const Payload: variant): variant;
    function PostVPNWireGuardPeerAllowedIPEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardPeersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNWireGuardPeersEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutVPNWireGuardPeersEndpoint(const Payload: variant): variant;
    function GetVPNWireGuardSettingsEndpoint(): variant;
    function PatchVPNWireGuardSettingsEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardTunnelEndpoint(const Id: variant; Apply: boolean = false): variant;
    function GetVPNWireGuardTunnelEndpoint(const Id: variant): variant;
    function PatchVPNWireGuardTunnelEndpoint(const Payload: variant): variant;
    function PostVPNWireGuardTunnelEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardTunnelAddressEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function GetVPNWireGuardTunnelAddressEndpoint(const ParentId: variant;
      const Id: variant): variant;
    function PatchVPNWireGuardTunnelAddressEndpoint(const Payload: variant): variant;
    function PostVPNWireGuardTunnelAddressEndpoint(const Payload: variant): variant;
    function DeleteVPNWireGuardTunnelsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0): variant;
    function GetVPNWireGuardTunnelsEndpoint(const Query: variant; Limit: integer = 0;
      Offset: integer = 0; const SortBy: TRawUtf8DynArray = nil; const SortOrder: TEnumPfApi63 = epa63None;
      const SortFlags: TEnumPfApi64 = epa64None): variant;
    function PutVPNWireGuardTunnelsEndpoint(const Payload: variant): variant;

    // access to the associated HTTP/JSON client instance
    property JsonClient: IJsonClient
      read fClient write fClient;
  end;


implementation



{ ************ Main TPfApiClient Class }

{ TPfApiClient}

constructor TPfApiClient.Create(const aClient: IJsonClient);
begin
  fClient := aClient;
  fClient.Options := [jcoParseTolerant, jcoHttpErrorRaise];
  fClient.UrlEncoder :=
    [ueEncodeNames, ueSkipVoidString, ueSkipVoidValue, ueStarNameIsCsv];
end;

function TPfApiClient.PostAuthJWTEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/auth/jwt', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteAuthKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/auth/key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostAuthKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/auth/key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteAuthKeysEndpoint(const Query: variant; Limit: integer;
  Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/auth/keys', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetAuthKeysEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/auth/keys', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteDiagnosticsARPTableEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/arp_table', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetDiagnosticsARPTableEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/arp_table', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteDiagnosticsARPTableEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/arp_table/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetDiagnosticsARPTableEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/arp_table/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostDiagnosticsCommandPromptEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/diagnostics/command_prompt', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/config_history/revision', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetDiagnosticsConfigHistoryRevisionEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/config_history/revision', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/diagnostics/config_history/revisions', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetDiagnosticsConfigHistoryRevisionsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/diagnostics/config_history/revisions', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostDiagnosticsHaltSystemEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/diagnostics/halt_system', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostDiagnosticsRebootEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/diagnostics/reboot', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetFirewallAdvancedSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/advanced_settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallAdvancedSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/advanced_settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallAliasEndpoint(const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/alias', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallAliasEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/alias', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallAliasEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallAliasEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallAliasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/aliases', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallAliasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/aliases', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallAliasesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/aliases', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetFirewallApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostFirewallApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATOneToOneMappingEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/one_to_one/mapping', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATOneToOneMappingEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/one_to_one/mapping', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallNATOneToOneMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/nat/one_to_one/mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallNATOneToOneMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/nat/one_to_one/mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATOneToOneMappingsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/one_to_one/mappings', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATOneToOneMappingsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/one_to_one/mappings', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallNATOneToOneMappingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/nat/one_to_one/mappings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATOutboundMappingEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/outbound/mapping', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATOutboundMappingEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/outbound/mapping', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallNATOutboundMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/nat/outbound/mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallNATOutboundMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/nat/outbound/mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATOutboundMappingsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/outbound/mappings', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATOutboundMappingsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/outbound/mappings', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallNATOutboundMappingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/nat/outbound/mappings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATOutboundModeEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/outbound/mode', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallNATOutboundModeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/nat/outbound/mode', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATPortForwardEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/port_forward', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATPortForwardEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/port_forward', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallNATPortForwardEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/nat/port_forward', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallNATPortForwardEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/nat/port_forward', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallNATPortForwardsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/nat/port_forwards', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallNATPortForwardsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/nat/port_forwards', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallNATPortForwardsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/nat/port_forwards', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallRuleEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/rule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallRuleEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/rule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallRuleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/rule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallRuleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/rule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallRulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/rules', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallRulesEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/rules', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallRulesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/rules', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallScheduleEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallScheduleEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedule', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallScheduleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/schedule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallScheduleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/schedule', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedule/time_range', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallScheduleTimeRangeEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedule/time_range', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/schedule/time_range', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallScheduleTimeRangeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/schedule/time_range', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallSchedulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/schedules', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallSchedulesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/schedules', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallSchedulesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/schedules', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallStatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/states', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallStatesEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/states', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallStatesSizeEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/states/size', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallStatesSizeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/states/size', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShaperEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shaper', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallTrafficShaperEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/traffic_shaper', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallTrafficShaperEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/traffic_shaper', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShaperLimiterEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shaper/limiter', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperLimiterEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper/limiter', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallTrafficShaperLimiterEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/traffic_shaper/limiter', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallTrafficShaperLimiterEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/traffic_shaper/limiter', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShaperLimiterBandwidthEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shaper/limiter/bandwidth', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperLimiterBandwidthEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper/limiter/bandwidth', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallTrafficShaperLimiterBandwidthEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/traffic_shaper/limiter/bandwidth', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallTrafficShaperLimiterBandwidthEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/traffic_shaper/limiter/bandwidth', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShaperLimiterQueueEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shaper/limiter/queue', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperLimiterQueueEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper/limiter/queue', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallTrafficShaperLimiterQueueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/traffic_shaper/limiter/queue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallTrafficShaperLimiterQueueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/traffic_shaper/limiter/queue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperLimitersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper/limiters', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallTrafficShaperLimitersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/traffic_shaper/limiters', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShaperQueueEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shaper/queue', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShaperQueueEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shaper/queue', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallTrafficShaperQueueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/traffic_shaper/queue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallTrafficShaperQueueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/traffic_shaper/queue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallTrafficShapersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/traffic_shapers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallTrafficShapersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/traffic_shapers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutFirewallTrafficShapersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/firewall/traffic_shapers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallVirtualIPEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/virtual_ip', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallVirtualIPEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ip', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchFirewallVirtualIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/firewall/virtual_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostFirewallVirtualIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/virtual_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetFirewallVirtualIPApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ip/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostFirewallVirtualIPApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/firewall/virtual_ip/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteFirewallVirtualIPsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/firewall/virtual_ips', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetFirewallVirtualIPsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/firewall/virtual_ips', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostGraphQLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/graphql', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteNetworkInterfaceEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetNetworkInterfaceEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchNetworkInterfaceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostNetworkInterfaceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/interface/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceAvailableInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/available_interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceBridgeEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/bridge', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceBridgeEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/bridge', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchInterfaceBridgeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/bridge', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceBridgeEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/bridge', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceBridgesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/bridges', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceGREEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/gre', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceGREEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/gre', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchInterfaceGREEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/gre', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceGREEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/gre', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceGREsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/gres', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceGREsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/gres', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchInterfaceGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutInterfaceGroupsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/interface/groups', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceLAGGEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/lagg', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceLAGGEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/lagg', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchInterfaceLAGGEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/lagg', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceLAGGEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/lagg', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceLAGGsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/laggs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceLAGGsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/laggs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceVLANEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/vlan', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceVLANEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/interface/vlan', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchInterfaceVLANEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/interface/vlan', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostInterfaceVLANEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/interface/vlan', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteInterfaceVLANsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interface/vlans', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetInterfaceVLANsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interface/vlans', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteNetworkInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetNetworkInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/routing/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostRoutingApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingGatewayEndpoint(const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewayEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchRoutingGatewayEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostRoutingGatewayEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewayDefaultEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/default', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchRoutingGatewayDefaultEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/default', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingGatewayGroupEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/group', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewayGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchRoutingGatewayGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostRoutingGatewayGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/group/priority', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewayGroupPriorityEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/group/priority', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/gateway/group/priority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostRoutingGatewayGroupPriorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/gateway/group/priority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingGatewayGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateway/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewayGroupsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateway/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingGatewaysEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingGatewaysEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/routing/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingStaticRouteEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/static_route', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingStaticRouteEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/routing/static_route', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchRoutingStaticRouteEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/routing/static_route', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostRoutingStaticRouteEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/routing/static_route', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteRoutingStaticRoutesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/routing/static_routes', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetRoutingStaticRoutesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/routing/static_routes', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMEAccountKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/account_key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMEAccountKeyEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_key', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/account_key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMEAccountKeyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/account_key', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMEAccountKeyRegisterEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/account_key/register', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMEAccountKeyRegistrationsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_key/registrations', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMEAccountKeysEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/account_keys', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMEAccountKeysEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/account_keys', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesACMEAccountKeysEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/acme/account_keys', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMECertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesACMECertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMECertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMECertificateActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificateActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesACMECertificateActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMECertificateActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMECertificateDomainEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificate/domain', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificateDomainEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/domain', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/certificate/domain', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMECertificateDomainEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/domain', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificateIssuancesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/issuances', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMECertificateIssueEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/issue', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesACMECertificateRenewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/acme/certificate/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificateRenewalsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificate/renewals', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesACMECertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/acme/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMECertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesACMECertificatesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/acme/certificates', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesACMESettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/acme/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesACMESettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/acme/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDAccessListEntryEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_list/entry', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDAccessListEntryEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_list/entry', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesBINDAccessListsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/access_lists', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/sync/remote_host', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDSyncRemoteHostEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/remote_host', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/sync/remote_host', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDSyncRemoteHostEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/sync/remote_host', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDSyncRemoteHostsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/sync/remote_hosts', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDSyncRemoteHostsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/remote_hosts', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesBINDSyncRemoteHostsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/sync/remote_hosts', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDSyncSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/sync/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDSyncSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/sync/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDViewEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/view', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDViewEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/view', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDViewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/view', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDViewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/view', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDViewsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/views', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDViewsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/views', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesBINDViewsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/views', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDZoneEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zone', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDZoneEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zone', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDZoneEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/zone', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDZoneEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/zone', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDZoneRecordEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zone/record', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDZoneRecordEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zone/record', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/bind/zone/record', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesBINDZoneRecordEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/bind/zone/record', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesBINDZonesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/bind/zones', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesBINDZonesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/bind/zones', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesBINDZonesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/bind/zones', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesCronJobEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/cron/job', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesCronJobEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/cron/job', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesCronJobEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/cron/job', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesCronJobEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/cron/job', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesCronJobsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/cron/jobs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesCronJobsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/cron/jobs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesCronJobsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/cron/jobs', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDHCPServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDHCPServerAddressPoolEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/address_pool', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServerAddressPoolEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/address_pool', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/address_pool', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDHCPServerAddressPoolEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/address_pool', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServerApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostServicesDHCPServerApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDHCPServerBackendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/backend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDHCPServerCustomOptionEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/custom_option', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServerCustomOptionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/custom_option', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDHCPServerCustomOptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/custom_option', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDHCPServerCustomOptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/custom_option', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDHCPServerStaticMappingEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dhcp_server/static_mapping', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServerStaticMappingEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_server/static_mapping', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDHCPServerStaticMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dhcp_server/static_mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDHCPServerStaticMappingEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dhcp_server/static_mapping', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDHCPServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/dhcp_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesDHCPServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dhcp_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSForwarderApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSForwarderApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSForwarderHostOverrideEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSForwarderHostOverrideEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSForwarderHostOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_forwarder/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSForwarderHostOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSForwarderHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSForwarderHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSForwarderHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_forwarder/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSForwarderHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_forwarder/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSForwarderHostOverridesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_forwarder/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSForwarderHostOverridesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_forwarder/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesDNSForwarderHostOverridesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_forwarder/host_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverAccessListEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_list', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverAccessListEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_list', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverAccessListNetworkEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_list/network', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverAccessListNetworkEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_list/network', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverAccessListNetworkEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/access_list/network', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverAccessListNetworkEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/access_list/network', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverAccessListsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/access_lists', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesDNSResolverAccessListsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/access_lists', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverDomainOverrideEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/domain_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverDomainOverrideEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/domain_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverDomainOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/domain_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverDomainOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/domain_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverDomainOverridesEndpoint(
  const Query: variant; Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/domain_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverDomainOverridesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/domain_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesDNSResolverDomainOverridesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/domain_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverHostOverrideEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_override', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverHostOverrideEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_override', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverHostOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverHostOverrideEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/host_override', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverHostOverrideAliasEndpoint(
  const ParentId: variant; const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverHostOverrideAliasEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_override/alias', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesDNSResolverHostOverrideAliasEndpoint(
  const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/dns_resolver/host_override/alias', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesDNSResolverHostOverridesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/dns_resolver/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverHostOverridesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/host_overrides', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesDNSResolverHostOverridesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/dns_resolver/host_overrides', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesDNSResolverSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/dns_resolver/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesDNSResolverSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/dns_resolver/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backend', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backend', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyBackendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/backend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyBackendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/backend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendACLEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backend/acl', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendACLEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backend/acl', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyBackendACLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/backend/acl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyBackendACLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/backend/acl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backend/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backend/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyBackendActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/backend/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyBackendActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/backend/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendErrorFileEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backend/error_file', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendErrorFileEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backend/error_file', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyBackendErrorFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/backend/error_file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyBackendErrorFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/backend/error_file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendServerEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backend/server', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendServerEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backend/server', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyBackendServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/backend/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyBackendServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/backend/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyBackendsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/backends', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyBackendsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/backends', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesHAProxyBackendsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/haproxy/backends', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFileEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/file', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFileEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/file', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFiles(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/files', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFiles(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/files', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesHAProxyFiles(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/haproxy/files', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontend', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontend', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFrontendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/frontend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFrontendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/frontend', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendACLEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontend/acl', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendACLEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontend/acl', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFrontendACLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/frontend/acl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFrontendACLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/frontend/acl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontend/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendActionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontend/action', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFrontendActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/frontend/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFrontendActionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/frontend/action', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendAddressEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontend/address', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendAddressEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontend/address', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFrontendAddressEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/frontend/address', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFrontendAddressEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/frontend/address', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendErrorFileEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontend/error_file', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendErrorFileEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontend/error_file', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxyFrontendErrorFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/frontend/error_file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxyFrontendErrorFileEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/frontend/error_file', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxyFrontendsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/frontends', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxyFrontendsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/frontends', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesHAProxyFrontendsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/haproxy/frontends', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxySettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxySettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxySettingsDNSResolverEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/settings/dns_resolver', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxySettingsDNSResolverEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/settings/dns_resolver', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxySettingsDNSResolverEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/settings/dns_resolver', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxySettingsDNSResolverEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/settings/dns_resolver', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesHAProxySettingsEmailMailerEndpoint(
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/haproxy/settings/email_mailer', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesHAProxySettingsEmailMailerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/haproxy/settings/email_mailer', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesHAProxySettingsEmailMailerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/haproxy/settings/email_mailer', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesHAProxySettingsEmailMailerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/haproxy/settings/email_mailer', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesNTPSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesNTPSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ntp/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesNTPTimeServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/ntp/time_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesNTPTimeServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/time_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesNTPTimeServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ntp/time_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesNTPTimeServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/ntp/time_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesNTPTimeServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/ntp/time_servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesNTPTimeServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/ntp/time_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesNTPTimeServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/ntp/time_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesServiceWatchdogEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/service_watchdog', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesServiceWatchdogEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/services/service_watchdog', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesServiceWatchdogEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/service_watchdog', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesServiceWatchdogEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/service_watchdog', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteServicesServiceWatchdogsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/services/service_watchdogs', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetServicesServiceWatchdogsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/services/service_watchdogs', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutServicesServiceWatchdogsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/services/service_watchdogs', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetServicesSSHEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/services/ssh', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchServicesSSHEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/services/ssh', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostServicesWakeOnLANSendEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/services/wake_on_lan/send', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetStatusCARPEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/carp', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchStatusCARPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/status/carp', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteStatusDHCPServerLeasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/status/dhcp_server/leases', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusDHCPServerLeasesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/dhcp_server/leases', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusGatewaysEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/gateways', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusInterfacesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/interfaces', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusIPsecChildSAEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/status/ipsec/child_sa', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusIPsecSAsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/ipsec/sas', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusLogsDHCPEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/dhcp', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusLogsFirewallEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/firewall', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusLogsSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchStatusLogsSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/status/logs/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetStatusLogsSystemEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/logs/system', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/status/openvpn/server/connection', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusOpenVPNServerConnectionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/server/connection', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusOpenVPNServerRouteEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/server/route', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostStatusServiceEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/status/service', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetStatusServicesEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/status/services', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetStatusSystemEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/status/system', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCertificateEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateGenerateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/generate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

procedure TPfApiClient.PostSystemCertificatePKCS12ExportEndpoint(const Payload: variant);
begin
  fClient.Request('POST', '/api/v2/system/certificate/pkcs12/export', [], [], [],
    Payload, {dummy:}self, TypeInfo(variant), nil);
end;

function TPfApiClient.PostSystemCertificateRenewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateSigningRequestEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/signing_request', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateSigningRequestSignEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate/signing_request/sign', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCertificateAuthoritiesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate_authorities', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCertificateAuthoritiesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate_authorities', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCertificateAuthorityEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificate_authority', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCertificateAuthorityEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificate_authority', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/certificate_authority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateAuthorityEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateAuthorityGenerateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority/generate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCertificateAuthorityRenewEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/certificate_authority/renew', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCertificatesEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/certificates', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemConsoleEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/console', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemConsoleEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/console', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCRLEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crl', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCRLEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/crl', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemCRLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/crl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCRLEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/crl', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crl/revoked_certificate', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCRLRevokedCertificateEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/crl/revoked_certificate', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/crl/revoked_certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemCRLRevokedCertificateEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/crl/revoked_certificate', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemCRLsEndpoint(const Query: variant; Limit: integer;
  Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/crls', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemCRLsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/crls', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemDNSEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/dns', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemDNSEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/dns', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemHostnameEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/hostname', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemHostnameEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/hostname', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemNotificationsEmailSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/notifications/email_settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemNotificationsEmailSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/notifications/email_settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemPackageEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/package', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemPackageEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/package', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostSystemPackageEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/package', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemPackageAvailableEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/package/available', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemPackagesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/packages', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemPackagesEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/packages', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemRESTAPIAccessListEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/restapi/access_list', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemRESTAPIAccessListEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/access_list', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutSystemRESTAPIAccessListEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/system/restapi/access_list', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/restapi/access_list/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemRESTAPIAccessListEntryEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/access_list/entry', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemRESTAPIAccessListEntryEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/restapi/access_list/entry', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemRESTAPISettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemRESTAPISettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemRESTAPISettingsSyncEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/restapi/settings/sync', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemRESTAPIVersionEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/restapi/version', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemRESTAPIVersionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/restapi/version', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemTunableEndpoint(const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/tunable', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemTunableEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/system/tunable', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemTunableEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/tunable', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostSystemTunableEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/system/tunable', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteSystemTunablesEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/system/tunables', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemTunablesEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/system/tunables', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutSystemTunablesEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/system/tunables', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetSystemVersionEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/version', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetSystemWebGUISettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/system/webgui/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchSystemWebGUISettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/system/webgui/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUserEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUserEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchUserEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostUserEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUserAuthServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/auth_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUserAuthServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user/auth_server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchUserAuthServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user/auth_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostUserAuthServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user/auth_server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUserAuthServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/auth_servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUserAuthServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/user/auth_servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutUserAuthServersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/user/auth_servers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUserGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUserGroupEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/user/group', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchUserGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/user/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostUserGroupEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/user/group', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUserGroupsEndpoint(const Query: variant; Limit: integer;
  Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/user/groups', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUserGroupsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/user/groups', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutUserGroupsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/user/groups', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteUsersEndpoint(const Query: variant; Limit: integer;
  Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/users', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetUsersEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/users', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostVPNIPsecApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/ipsec/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase1Endpoint(const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase1', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase1Endpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase1', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNIPsecPhase1Endpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/ipsec/phase1', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNIPsecPhase1Endpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/ipsec/phase1', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase1EncryptionEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase1/encryption', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase1EncryptionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase1/encryption', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNIPsecPhase1EncryptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/ipsec/phase1/encryption', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNIPsecPhase1EncryptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/ipsec/phase1/encryption', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase1sEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase1s', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase1sEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase1s', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutVPNIPsecPhase1sEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/vpn/ipsec/phase1s', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase2Endpoint(const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase2', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase2Endpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase2', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNIPsecPhase2Endpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/ipsec/phase2', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNIPsecPhase2Endpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/ipsec/phase2', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase2EncryptionEndpoint(const ParentId: variant;
  const Id: variant; Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase2/encryption', [], [
    'parent_id', ParentId,
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase2EncryptionEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase2/encryption', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNIPsecPhase2EncryptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/ipsec/phase2/encryption', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNIPsecPhase2EncryptionEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/ipsec/phase2/encryption', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNIPsecPhase2sEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/ipsec/phase2s', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNIPsecPhase2sEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/ipsec/phase2s', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutVPNIPsecPhase2sEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/vpn/ipsec/phase2s', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNClientEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/client', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNClientEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/client', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNOpenVPNClientEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/client', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNOpenVPNClientEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/client', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNClientsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/clients', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNCSOEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/cso', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNCSOEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/cso', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/cso', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNOpenVPNCSOEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/cso', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNCSOsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/csos', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNCSOsEndpoint(const Query: variant; Limit: integer;
  Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/csos', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNServerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/server', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNOpenVPNServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/openvpn/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNOpenVPNServerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/openvpn/server', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNOpenVPNServersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/openvpn/servers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardApplyEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/apply', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PostVPNWireGuardApplyEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/wireguard/apply', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardPeerEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/peer', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardPeerEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/peer', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNWireGuardPeerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/wireguard/peer', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNWireGuardPeerEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/wireguard/peer', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardPeerAllowedIPEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/peer/allowed_ip', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardPeerAllowedIPEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/peer/allowed_ip', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNWireGuardPeerAllowedIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/wireguard/peer/allowed_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNWireGuardPeerAllowedIPEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/wireguard/peer/allowed_ip', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardPeersEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/peers', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardPeersEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/peers', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutVPNWireGuardPeersEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/vpn/wireguard/peers', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardSettingsEndpoint(): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/settings', [], [], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNWireGuardSettingsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/wireguard/settings', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardTunnelEndpoint(const Id: variant;
  Apply: boolean): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/tunnel', [], [
    'id', Id,
    'apply', Apply], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardTunnelEndpoint(const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/tunnel', [], [
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNWireGuardTunnelEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/wireguard/tunnel', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNWireGuardTunnelEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/wireguard/tunnel', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardTunnelAddressEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/tunnel/address', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardTunnelAddressEndpoint(const ParentId: variant;
  const Id: variant): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/tunnel/address', [], [
    'parent_id', ParentId,
    'id', Id], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PatchVPNWireGuardTunnelAddressEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PATCH', '/api/v2/vpn/wireguard/tunnel/address', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.PostVPNWireGuardTunnelAddressEndpoint(const Payload: variant): variant;
begin
  fClient.Request('POST', '/api/v2/vpn/wireguard/tunnel/address', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;

function TPfApiClient.DeleteVPNWireGuardTunnelsEndpoint(const Query: variant;
  Limit: integer; Offset: integer): variant;
begin
  fClient.Request('DELETE', '/api/v2/vpn/wireguard/tunnels', [], [
    'limit', Limit,
    'offset', Offset,
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.GetVPNWireGuardTunnelsEndpoint(const Query: variant;
  Limit: integer; Offset: integer; const SortBy: TRawUtf8DynArray; const SortOrder: TEnumPfApi63;
  const SortFlags: TEnumPfApi64): variant;
begin
  fClient.Request('GET', '/api/v2/vpn/wireguard/tunnels', [], [
    'limit', Limit,
    'offset', Offset,
    '*sort_by', RawUtf8ArrayToCsv(SortBy),
    'sort_order', ENUMPFAPI63_TXT[SortOrder],
    'sort_flags', ENUMPFAPI64_TXT[SortFlags],
    'query', Query], [],
    result, TypeInfo(variant));
end;

function TPfApiClient.PutVPNWireGuardTunnelsEndpoint(const Payload: variant): variant;
begin
  fClient.Request('PUT', '/api/v2/vpn/wireguard/tunnels', [], [], [],
    Payload, result, TypeInfo(variant), TypeInfo(variant));
end;


end.