unit status_system;

interface

uses SysUtils, Classes, fpJSON;


Type
  
  Tdatacpu_load_avg = Array of Double;

Function CreateTdatacpu_load_avg(AJSON : TJSONData) : Tdatacpu_load_avg;
Procedure SaveTdatacpu_load_avgToJSON(AnArray : Tdatacpu_load_avg; AJSONArray : TJSONArray); overload;
Function SaveTdatacpu_load_avgToJSON(AnArray : Tdatacpu_load_avg) : TJSONArray; overload;


Type
  
  
  { -----------------------------------------------------------------------
    Tdata
    -----------------------------------------------------------------------}
  
  Tdata = class(TObject)
  Private
    Fplatform : String;
    Fserial : String;
    Fnetgate_id : String;
    Fuptime : String;
    Fbios_vendor : String;
    Fbios_version : String;
    Fbios_date : String;
    Fkernel_pti : Boolean;
    Fmds_mitigation : String;
    Ftemp_c : Boolean;
    Ftemp_f : Boolean;
    Fcpu_model : String;
    Fcpu_load_avg : Tdatacpu_load_avg;
    Fcpu_count : Integer;
    Fcpu_usage : Double;
    Fmbuf_usage : Integer;
    Fmem_usage : Integer;
    Fswap_usage : Integer;
    Fdisk_usage : Integer;
  Public
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property platform : String Read Fplatform Write Fplatform;
    Property serial : String Read Fserial Write Fserial;
    Property netgate_id : String Read Fnetgate_id Write Fnetgate_id;
    Property uptime : String Read Fuptime Write Fuptime;
    Property bios_vendor : String Read Fbios_vendor Write Fbios_vendor;
    Property bios_version : String Read Fbios_version Write Fbios_version;
    Property bios_date : String Read Fbios_date Write Fbios_date;
    Property kernel_pti : Boolean Read Fkernel_pti Write Fkernel_pti;
    Property mds_mitigation : String Read Fmds_mitigation Write Fmds_mitigation;
    Property temp_c : Boolean Read Ftemp_c Write Ftemp_c;
    Property temp_f : Boolean Read Ftemp_f Write Ftemp_f;
    Property cpu_model : String Read Fcpu_model Write Fcpu_model;
    Property cpu_load_avg : Tdatacpu_load_avg Read Fcpu_load_avg Write Fcpu_load_avg;
    Property cpu_count : Integer Read Fcpu_count Write Fcpu_count;
    Property cpu_usage : Double Read Fcpu_usage Write Fcpu_usage;
    Property mbuf_usage : Integer Read Fmbuf_usage Write Fmbuf_usage;
    Property mem_usage : Integer Read Fmem_usage Write Fmem_usage;
    Property swap_usage : Integer Read Fswap_usage Write Fswap_usage;
    Property disk_usage : Integer Read Fdisk_usage Write Fdisk_usage;
  end;
  
  
  { -----------------------------------------------------------------------
    TMyObject
    -----------------------------------------------------------------------}
  
  TMyObject = class(TObject)
  Private
    Fcode : Integer;
    Fstatus : String;
    Fresponse_id : String;
    Fmessage : String;
    Fdata : Tdata;
  Public
    Destructor Destroy; override;
    Constructor CreateFromJSON(AJSON : TJSONData); virtual;
    Procedure LoadFromJSON(AJSON : TJSONData); virtual;
    Function SaveToJSON : TJSONObject; overload;
    Procedure SaveToJSON(AJSON : TJSONObject); overload; virtual;
    Property code : Integer Read Fcode Write Fcode;
    Property status : String Read Fstatus Write Fstatus;
    Property response_id : String Read Fresponse_id Write Fresponse_id;
    Property message : String Read Fmessage Write Fmessage;
    Property data : Tdata Read Fdata Write Fdata;
  end;

implementation





Function CreateTdatacpu_load_avg(AJSON : TJSONData) : Tdatacpu_load_avg;

var
  I : integer;

begin
  SetLength(Result,AJSON.Count);
  For I:=0 to AJSON.Count-1 do
    Result[i]:=AJSON.Items[i].AsFloat;
End;


Function SaveTdatacpu_load_avgToJSON(AnArray : Tdatacpu_load_avg) : TJSONArray;
begin
  Result:=TJSONArray.Create;
  Try
    SaveTdatacpu_load_avgToJSON(AnArray,Result);
  Except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure SaveTdatacpu_load_avgToJSON(AnArray : Tdatacpu_load_avg; AJSONArray : TJSONArray);

var
  I : integer;

begin
  For I:=0 to Length(AnArray)-1 do
    AJSONArray.Add(AnArray[i]);
end;



{ -----------------------------------------------------------------------
  Tdata
  -----------------------------------------------------------------------}


Constructor Tdata.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure Tdata.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'platform':
      platform:=E.Value.AsString;
    'serial':
      serial:=E.Value.AsString;
    'netgate_id':
      netgate_id:=E.Value.AsString;
    'uptime':
      uptime:=E.Value.AsString;
    'bios_vendor':
      bios_vendor:=E.Value.AsString;
    'bios_version':
      bios_version:=E.Value.AsString;
    'bios_date':
      bios_date:=E.Value.AsString;
    'kernel_pti':
      kernel_pti:=E.Value.AsBoolean;
    'mds_mitigation':
      mds_mitigation:=E.Value.AsString;
    'temp_c':
      temp_c:=E.Value.AsBoolean;
    'temp_f':
      temp_f:=E.Value.AsBoolean;
    'cpu_model':
      cpu_model:=E.Value.AsString;
    'cpu_load_avg':
      cpu_load_avg:=CreateTdatacpu_load_avg(E.Value);
    'cpu_count':
      cpu_count:=E.Value.AsInteger;
    'cpu_usage':
      cpu_usage:=E.Value.AsFloat;
    'mbuf_usage':
      mbuf_usage:=E.Value.AsInteger;
    'mem_usage':
      mem_usage:=E.Value.AsInteger;
    'swap_usage':
      swap_usage:=E.Value.AsInteger;
    'disk_usage':
      disk_usage:=E.Value.AsInteger;
    end;
    end;
end;
Function  Tdata.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure Tdata.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('platform',platform);
  AJSON.Add('serial',serial);
  AJSON.Add('netgate_id',netgate_id);
  AJSON.Add('uptime',uptime);
  AJSON.Add('bios_vendor',bios_vendor);
  AJSON.Add('bios_version',bios_version);
  AJSON.Add('bios_date',bios_date);
  AJSON.Add('kernel_pti',kernel_pti);
  AJSON.Add('mds_mitigation',mds_mitigation);
  AJSON.Add('temp_c',temp_c);
  AJSON.Add('temp_f',temp_f);
  AJSON.Add('cpu_model',cpu_model);
  AJSON.Add('cpu_load_avg',SaveTdatacpu_load_avgToJSON(cpu_load_avg));
  AJSON.Add('cpu_count',cpu_count);
  AJSON.Add('cpu_usage',cpu_usage);
  AJSON.Add('mbuf_usage',mbuf_usage);
  AJSON.Add('mem_usage',mem_usage);
  AJSON.Add('swap_usage',swap_usage);
  AJSON.Add('disk_usage',disk_usage);
end;


{ -----------------------------------------------------------------------
  TMyObject
  -----------------------------------------------------------------------}

Destructor TMyObject.Destroy;

begin
  FreeAndNil(Fdata);
  inherited;
end;


Constructor TMyObject.CreateFromJSON(AJSON : TJSONData);

begin
  Create();
  LoadFromJSON(AJSON);
end;

Procedure TMyObject.LoadFromJSON(AJSON : TJSONData);

var
  E : TJSONEnum;

begin
  for E in AJSON do
    begin
    case E.Key of
    'code':
      code:=E.Value.AsInteger;
    'status':
      status:=E.Value.AsString;
    'response_id':
      response_id:=E.Value.AsString;
    'message':
      message:=E.Value.AsString;
    'data':
      data:=Tdata.CreateFromJSON(E.Value);
    end;
    end;
end;
Function  TMyObject.SaveToJSON : TJSONObject;
begin
  Result:=TJSONObject.Create;
  Try
    SaveToJSON(Result);
  except
    FreeAndNil(Result);
    Raise;
  end;
end;


Procedure TMyObject.SaveToJSON(AJSON : TJSONObject);

begin
  AJSON.Add('code',code);
  AJSON.Add('status',status);
  AJSON.Add('response_id',response_id);
  AJSON.Add('message',message);
  If Assigned(data) then
    AJSON.Add('data',data.SaveToJSON);
end;

end.
