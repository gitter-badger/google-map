﻿<%@ Page Language="C#" MasterPageFile="~/markers/Marker.master" AutoEventWireup="false"
    CodeFile="~/markers/DataBound.aspx.cs" Inherits="Artem.GoogleMap.WebSite.DataBound"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>GoogleMap - Markers - Data Bound</title>
    <meta name="description" content="GoogleMap control markers data binding sample." />
    <meta name="keywords" content="googlemap control markers data binding sample" />
</asp:Content>
<asp:Content ContentPlaceHolderID="main" runat="Server">
    <h1>
        Markers Data Bound
    </h1>
    <p>
        GoogleMap control markers data binding sample.
        <br />
        Drag or zoom the map to desired position and code will generate random markers (20
        by default) inside the current bounds of the map.<br />
        To change the number of rendered out markers enter the number in text box bellow.
    </p>
    <fieldset>
        <legend>Settings</legend>
        <label>
            Change markers' count</label>
        <asp:TextBox ID="txtCount" runat="server" OnTextChanged="HandleTextCountChanged"></asp:TextBox>
    </fieldset>
    <div class="map-wrap">
        <artem:GoogleMap ID="GoogleMap1" runat="server" Latitude="42.1229" Longitude="24.7879"
            Zoom="4" EnableScrollWheelZoom="true" OnDragEnd="HandleMapEvent" OnZoomChanged="HandleMapEvent"
            CssClass="map">
        </artem:GoogleMap>
        <artem:GoogleMarkers ID="GoogleMarkers1" TargetControlID="GoogleMap1" runat="server"
            DataSourceID="odsMarkers" DataLatitudeField="Lat" DataLongitudeField="Lng" DataInfoField="Info">
            <MarkerOptions Draggable="true">
            </MarkerOptions>
            <InfoWindowOptions DisableAutoPan="true" />
        </artem:GoogleMarkers>
    </div>
    <asp:ObjectDataSource ID="odsMarkers" runat="server" TypeName="Artem.GoogleMap.WebSite.Models.MarkersRepository"
        SelectMethod="GetTestMarkers" OnSelecting="HandleDataSelecting">
        <SelectParameters>
            <asp:Parameter Name="count" Type="Int32" DefaultValue="20" />
            <asp:Parameter Name="bounds" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
