<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page language="java"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib  uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="helpStyle.css" media="screen" />
<title>Help windows</title>
</head>
<body onload="loadPageHisto(window.opener.loadingPage);"><!-- page désirée au chargement-->
	<table id="help">
		<tr>
			<td colspan="2">
				<div id="header">
					<b class="arrondi">
					<b class="arrondi1"><b></b></b>
					<b class="arrondi2"><b></b></b>
					<b class="arrondi3"></b>
					<b class="arrondi4"></b>
					<b class="arrondi5"></b></b>
					<div id="headerContent">
						<div align="right">
							<div class="inline" id="es" title="Espanol">
								<img class="link" src="img/flagEs.jpg" onclick="languageChange('es'); update(); loadPage('home_esp.html');"/>
							</div>
							<div class="inline" id="en" title="English">
								<img class="link" src="img/flagEn.GIF" onclick="languageChange('en'); update(); loadPage('home_en.html');"/>
							</div>
							<div class="inline" id="fr" title="French">
								<img class="link" src="img/flagFr.jpg" onclick="languageChange('fr'); update(); loadPage('home_fr.html');"/>
							</div>
							<div style="margin-top:4px; margin-bottom:4px;">
								<a class="link" onclick="loadPage('home_esp.html');">
									<img src="img/home_on.bmp"
									onMouseOver="this.src='img/home_press.bmp'" 
									onMouseOut="this.src='img/home_on.bmp'"
									/>
								</a>
								<a class="link" onclick="iPrint(iframe);">
									<img src="img/print_on.bmp"
										onMouseOver="this.src='img/print_press.bmp'; doTooltip(event, tipMsg['hor']);" 
										onMouseOut="this.src='img/print_on.bmp'; hideTip();"							
									/>
								</a>
							</div>				
							<bean:message key="help.search"/> <input type="text" size="17" id="recherche" name="recherche" onkeyup="search();"/>
						</div>
					</div>
					<b class="arrondi">
					<b class="arrondi5"></b>
					<b class="arrondi4"></b>
					<b class="arrondi3"></b>
					<b class="arrondi2"><b></b></b>
					<b class="arrondi1"><b></b></b></b>		
				</div>
			</td>
		</tr>
		<tr>
			<td valign="top">
			<div id="menu">
				<b class="arrondi">
				<b class="arrondi1"><b></b></b>
				<b class="arrondi2"><b></b></b>
				<b class="arrondi3"></b>
				<b class="arrondi4"></b>
				<b class="arrondi5"></b></b>
				<div id="menuContent">
					<a class="link" onclick="back();">
						<img src="img/back_on.bmp" 
						onMouseOver="this.src='img/back_press.bmp'" 
						onMouseOut="this.src='img/back_on.bmp'"
						/>
					</a>							
					<a onclick="openReduce(); histoDisplay();">
						<div id="icoHisto" class="ico"><img src="img/histo+.bmp" /></div>
					</a>
					<div id="histoFleche"></div>
					<!-- contient <div id="histoDisplay"></div> -->							
					<a class="link" onclick="next();">
						<img src="img/next_on.bmp"
						onMouseOver="this.src='img/next_press.bmp'" 
						onMouseOut="this.src='img/next_on.bmp'"
						/>
					</a>
				<br />
				<br />	
				<a class="groupTitle" onclick="openReduceGroup('access','accessico')">
					<div id="accessico" class="ico"><img src="img/+.bmp" /></div>
					&nbsp;&nbsp;<bean:message key="help.access"/> <!-- bean à mettre-->
				</a>
				<div id="access"></div>					
				<br />				
				<a class="groupTitle" onclick="openReduceGroup('creation','creationico')">
					<div id="creationico" class="ico"><img src="img/+.bmp" /></div>
					&nbsp;&nbsp;<bean:message key="help.creation"/> <!-- bean à mettre-->
				</a>
				<div id="creation"></div>
			</div>	
				  <b class="arrondi">
				  <b class="arrondi5"></b>
				  <b class="arrondi4"></b>
				  <b class="arrondi3"></b>
				  <b class="arrondi2"><b></b></b>
				  <b class="arrondi1"><b></b></b></b>
			</div>		
			<div id="resultSearchLayer">
					  <b class="arrondi">
					  <b class="arrondi1"><b></b></b>
					  <b class="arrondi2"><b></b></b>
					  <b class="arrondi3"></b>
					  <b class="arrondi4"></b>
					  <b class="arrondi5"></b></b>
					
					  <div class="arrondifg">
							<div id="resultSearch"></div>
					  </div>
					  <b class="arrondi">
					  <b class="arrondi5"></b>
					  <b class="arrondi4"></b>
					  <b class="arrondi3"></b>
					  <b class="arrondi2"><b></b></b>
					  <b class="arrondi1"><b></b></b></b>
			</div>
			<div id="loadIframeHide" style="display:none;"></div>	
	 	 </td>
	 	 <td>		 
			<div id="main">
			  <b class="arrondi">
			  <b class="arrondi1"><b></b></b>
			  <b class="arrondi2"><b></b></b>
			  <b class="arrondi3"></b>
			  <b class="arrondi4"></b>
			  <b class="arrondi5"></b></b>			
			  <div class="arrondifg">
				<div id="content"></div>	
			  </div>
			  <b class="arrondi">
			  <b class="arrondi5"></b>
			  <b class="arrondi4"></b>
			  <b class="arrondi3"></b>
			  <b class="arrondi2"><b></b></b>
			  <b class="arrondi1"><b></b></b></b>
			</div>
	 	 </td>
	</tr>
</table>
<script type="text/javascript" src="helpJs.js"></script>
</body>
</html>
