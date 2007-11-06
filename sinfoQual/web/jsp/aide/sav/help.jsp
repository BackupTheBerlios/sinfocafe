<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Help</title>
<style>
	body
	{
	margin: 0;
	color:#FFFFFF;
	font-family: "Verdana", Arial, sans-serif;
	font-size:11px;
	}
	
	#help
	{
	width: 700px;
	height: 500px;
	font-family:;
	background-color:#336633;
	padding:0;
	margin:0;
	border-color:#CCCCCC;
	border-style:solid;
	border-spacing:0px;		
	}
	
	#header
	{
	padding-top:4px;
	padding-bottom:4px;
	height:34px;	
	}
	
	#menu
	{
	width:160px;
	padding:20px;
	text-align:left;
	height:460px;
	}
	
	#content
	{
	height:460px;
	width:500px;
	background-color:#FFFFFF;
	text-align:justify;
	}
	
	.link:hover
	{
	cursor:pointer;
	text-decoration:underline;
	}
	
	.linkImg
	{
	display:inline;
	}
	
	#histoDisplay
	{
	border-style:solid;
	border:1px;
	border-color:#000000;
	background-color:#CCCCCC;
	}
	
	#histoFleche
	{
	width:110px;
	max-height:100px;	
	color:#000000;
	background-color:#FFFFFF;
	overflow: auto;
	font-size:9px;
	position:absolute;

	}		
	.ico
	{
	display:inline;
	}
		
	.inline
	{
	display:inline;
	}
</style>
</head>
<body onload="loadPage('home.html');"><!-- page désirée au chargement-->
<table id="help">
	<tr>
		<td colspan="2">
			<table width="700" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<div id="header">
							<a class="link" onclick="back();">
								<img src="img/back_on.bmp" 
									onMouseOver="this.src='img/back_press.bmp'" 
									onMouseOut="this.src='img/back_on.bmp'"
								 />
							</a>
							
							<a onclick="openReduce(); histoDisplay();">
								<div id="icoGroupe2" class="ico">
									<img src="img/+.bmp" />
								</div>
							</a>
							<div id="histoFleche"></div><!-- contient <div id="histoDisplay"></div> -->
							
							<a class="link" onclick="next();">
								<img src="img/next_on.bmp"
									onMouseOver="this.src='img/next_press.bmp'" 
									onMouseOut="this.src='img/next_on.bmp'"
								 />
							</a>
							<a class="link" onclick="loadPage('home.html');">
								<img src="img/home_on.bmp" 
									onMouseOver="this.src='img/home_press.bmp'" 
									onMouseOut="this.src='img/home_on.bmp'"
								/>
							</a>
							<a class="link" onclick="iPrint(iframe)";>
							<img src="img/print_on.bmp"
									onMouseOver="this.src='img/print_press.bmp'" 
									onMouseOut="this.src='img/print_on.bmp'"							
							 />
							</a>
						</div>
					</td>
					<td align="right">
						Rechercher <input type="text" size="20" id="recherche"/>
					</td>
				<tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" bgcolor="#006400">
			<br />
			<img src="img/logoFapecafes.jpg" />
			<div id="menu">
				<a onclick="openReduceGroup('groupe1','icoGroupe1')">
					<div id="icoGroupe1" class="ico"><img src="img/+.bmp" /></div>
					&nbsp;&nbsp;Groupe 1 <!-- bean à mettre-->
				</a>
				<div id="groupe1"></div>	
			</div>	
	 	 </td>
	 	 <td valign="top">			
			<div id="content"></div>
	 	 </td>
	</tr>
</table>

<script type="text/javascript">
/* Début Lien et Historique */
	//load page
	var compteur=0;
	var compteurHisto=0;
	var compteurMax=0;
	var tab = new Array(); //tableau de l'historique (première page visitée a pour arg 1)
	var etatOpenReduce=0;//état du bouton de l'historique
	
	//Groupe de pages
	var page = new Array();
	var insertVar=0;	
	
	//Les contenus crés dynamiquement----------------------------------------------------------------->	
	var etatGroupe1=0; //ajout d'une variable d'état à chaque groupe rajouté
	insert('exemple.html','Exemple','Groupe1','1');
	insert('exemple2.html','Exemple2','Groupe1','1');	
	insert('exemple3.html','Exemple3','Groupe1','1');
	//Fin des contenus-------------------------------------------------------------------------------->	

	
	function loadPage(page)
	{
		if (page!=tab[compteur])//la page demandée ne doit pas  être déjà affichée
		{
		var content=document.getElementById('content');
		x='<iframe id="iframe" name="iframe" src="'
			+page
			+'" scrolling="auto" align="middle"'
			+' marginwidth="15px" marginheight="10px" width="500px" height="452px" frameborder="0"></iframe>';
		content.innerHTML=x;
		compteur+=1;
		compteurHisto=compteur;
		if (compteur>compteurMax){compteurMax=compteur;}
		histo(page); //On sauvegarde les pages naviguées	
		histoDisplay();
		}
		else
		{
		alert('Page déjà en cours!');
		}
	}
	
	function loadPageHisto(page)
	{
		var content=document.getElementById('content');
		x='<iframe id="iframe" name="iframe" src="'
			+page
			+'" scrolling="auto" align="middle"'
			+' marginwidth="15px" marginheight="10px" width="500px" height="452px" frameborder="0"></iframe>';
		content.innerHTML=x;
		histoDisplay();
	}
	
	function histo(page)//sauvegarde les pages naviguées
	{
	tab[compteur]=page;
	}
	

	function back()
	{
		if(compteurHisto==1){loadPageHisto('home.html')}
		else
		{			
			compteurHisto-=1;
			loadPageHisto(tab[compteurHisto]);
			histoDisplay();
		}
	}
				
	function next()
	{
		if (compteurHisto==compteurMax){loadPageHisto(tab[compteurMax]);}
		else
		{
		compteurHisto+=1;
		loadPageHisto(tab[compteurHisto]);
		histoDisplay();
		}
	}
	
	function histoDisplay()
	{
	texte="";
	for(i=1;i<=(tab.length-1);i++)
	{
		texte+='<a class="link" onclick="loadPageHisto(\''+tab[i]+'\')">'+tab[i]+'</a><br />';
	}
	var div=document.getElementById('histoDisplay');
	div.innerHTML=texte;
	}	
/* Fin Lien et Historique */
		
	function insert(namePage,urlPage,groupe,numberGroup)
	{
		page[insertVar] = new Array(5);
		page[insertVar]=[insertVar,namePage,urlPage,groupe,numberGroup] //Le tableau [][5]
		insertVar++;
	}
	
	/*
	verifParcourPage();
	function verifParcourPage()
	{
		var x="";
		for(i=0; i<=page.length-1; i++)
		{
			for(j=0; j<=4;j++)
			{
				x+=page[i][j]+ " ";
			}
			x+="\n"
		}
		alert(x);
	}
	*/
	
	function createLink(name)
	{
	var link="";
		for(i=0; i<=page.length-1; i++)
		{
			if(name==page[i][3])
			{
			link+='<a class="link" onclick="loadPage(\''+page[i][1]+'\')">'+page[i][2]+'</a><br />';
			}
		}
	return link;
	}	


	function openReduceGroup(id, ico)
	{
		var div=document.getElementById(id);
		var div2=document.getElementById(ico);
		var etat;
		init(0);		

		//-------------------------------------------------------------------Ajout de groupe-------->
		function init(x)
		{
			if(x==0)
			{
				if(id=='groupe1')
				{
				lien=createLink('Groupe1');
				etat=etatGroupe1;
				}
			}
			
			if(x==1)
			{
				if(id=='groupe1')
				{
				etatGroupe1=etat;
				}
			}
			
		}
		//------------------------------------------------------------------------------------------->
		
		if(etat==0)
		{
		div.innerHTML=lien;
		div2.innerHTML='<img src="img/-.bmp" />';
		etat=1;
		init(1);
		}
		else
		{
		div.innerHTML='';
		div2.innerHTML='<img src="img/+.bmp" />';
		etat=0;		
		init(1); 
		}
	}

	function openReduce()
	{
		var div=document.getElementById('histoFleche');
		var div2=document.getElementById('icoGroupe2');
	
		if(etatOpenReduce==0)
		{
		div.innerHTML='<div id="histoDisplay"></div>';
		div2.innerHTML='<img src="img/-.bmp" />';
		etatOpenReduce=1;
		}
		else
		{
		div.innerHTML='';
		div2.innerHTML='<img src="img/+.bmp" />';
		etatOpenReduce=0;		 
		}
	}
		

// Impression de l'iframe
function iPrint(ptarget)
{
ptarget.focus();
ptarget.print();
}
</script>
</body>
</html>