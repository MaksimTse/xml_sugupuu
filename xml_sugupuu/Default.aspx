<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="xml_sugupuu._Default" %>

<!DOCTYPE html>
<html>
    <head>
        <title>
            xml ja xslt andmete kuvamine
        </title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div>
            <asp:Xml runat="server" DocumentSource="~/pohiandmed.xml" TransformSource="~/pohiandmeteLisa.xslt"/>
        </div>
    </body>
</html>