//Remarque: Il ne doit pas y avoir de doublons au niveau des pages d'aides!!
/* Début Lien et Historique */
	//load page
	compteur=0;
	compteurHisto=0;
	compteurMax=0;
	tab = new Array(); //tableau de l'historique (première page visitée a pour arg 1)
	etatOpenReduce=0;//état du bouton de l'historique
	
	//initialisation du langage
	language='es';
	//Groupe de pages
	page = new Array();
	insertVar=0;	
	
	//Les groupes
	groupTab = new Array();
	compteurGroup=0;	
	//-------------------------------------------------------------------Ajout de groupe-------->	
	insertGroup('access');
	insertGroup('creation');
	//-------------------------------------------------------------------Ajout de groupe-------->	
	
	//Les contenus crés dynamiquement----------------------------------------------------------------->	
	
	accessetat=0; //ajout d'une variable d'état à chaque groupe rajouté
	//ex: insert(url, nom affiché, groupe de la page, numéro du groupe)
	insert('home_esp.html','Home Es','intro','0','fr');
	insert('home_en.html','Home En','intro','0','fr');	
	insert('home_fr.html','Home Fr','intro','0','fr');	
	
	insert('pages/fr/filtre_du_test.html','Access','access','1','fr');
	insert('pages/fr/cafe_verde.html','Cafe Vert','access','1','fr');
	insert('pages/fr/taille.html','Taille','access','1','fr');		
	insert('pages/fr/defauts.html','Défaut','access','1','fr');
	insert('pages/fr/degustation.html','Dégustation','access','1','fr');
	insert('pages/fr/resume.html','Résultat','access','1','fr');
	
	
	insert('pages/en/test_filter.html','Access','access','1','en');
	insert('pages/en/greenCoffee.html','Green coffee','access','1','en');
	insert('pages/en/tamano.html','Tamano','access','1','en');
	insert('pages/en/flaw.html','Flaw','access','1','en');
	insert('pages/en/tasting.html','Tasting','access','1','en');
	insert('pages/en/result.html','Result','access','1','en');


	insert('pages/esp/filtro_del_test.html','Access','access','1','es');
	insert('pages/esp/cafe_verde.html','cafe_verde','access','1','es');	
	insert('pages/esp/tamano.html','Tamano','access','1','es');
	insert('pages/esp/catacion.html','Catacion','access','1','es');
	insert('pages/esp/defectos.html','Defecto','access','1','es');
	insert('pages/esp/resumen.html','Resumen','access','1','es');
	
	creationetat=0;	
	
	insert('pages/fr/creation/afficherResult.html','afficherResult','creation','2','fr');
	insert('pages/fr/creation/afficherTest.html','afficherTest','creation','2','fr');
	insert('pages/fr/creation/etape1.html','etape1','creation','2','fr');
	insert('pages/fr/creation/etape2.html','etape2','creation','2','fr');
	insert('pages/fr/creation/etape3.html','etape3','creation','2','fr');
	insert('pages/fr/creation/structure.html','structure','creation','2','fr');
	
	
	insert('pages/en/creation/displayResult.html','displayResult','creation','2','en');
	insert('pages/en/creation/testFounded.html','testFounded','creation','2','en');
	insert('pages/en/creation/step1.html','step1','creation','2','en');
	insert('pages/en/creation/step2.html','step2','creation','2','en');
	insert('pages/en/creation/step3.html','step3','creation','2','en');
	insert('pages/en/creation/structure.html','structure','creation','2','en');


	insert('pages/esp/creacion/estructura.html','estructura','creation','2','es');
	insert('pages/esp/creacion/exhibicion_test.html','exhibicion_test','creation','2','es');
	insert('pages/esp/creacion/etapa1.html','etapa1','creation','2','es');
	insert('pages/esp/creacion/etapa2.html','etapa2','creation','2','es');
	insert('pages/esp/creacion/etapa3.html','etapa3','creation','2','es');
	insert('pages/esp/creacion/exhibir_resultados.html','exhibir_resultados','creation','2','es');

	//Fin des contenus-------------------------------------------------------------------------------->	
	
	function languageChange(x)
	{
		if( x=='fr'){language='fr';}
		if( x=='es'){language='es';}
		if( x=='en'){language='en';}
	}
	
	function loadPage(url)
	{
		if (url!=tab[compteur])//la page demandée ne doit pas  être déjà affichée
		{
		var content=document.getElementById('content');
		var x='<iframe id="iframe" name="iframe" src="'
			+url
			+'" scrolling="auto" align="middle"'
			+' marginwidth="15px" marginheight="10px" width="500px" height="452px" frameborder="0"></iframe>';
		content.innerHTML=x;
		compteur+=1;
		compteurHisto=compteur;
		if (compteur>compteurMax){compteurMax=compteur;}
		histo(url); //On sauvegarde les pages naviguées	
		histoDisplay();
		}
		/*
		else
		{
		alert('Page déjà en cours!');
		}
		*/
	}
	
	function loadPageHisto(page)
	{
		var content=document.getElementById('content');
		var x='<iframe id="iframe" name="iframe" src="'
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
	document.getElementById('histoDisplay').style.background="#84FF84";
	texte="";
	var namePage;
	
	for(i=1;i<=(tab.length-1);i++)
	{
		for(j=0; j<=page.length-1; j++)
		{
			if(tab[i]==page[j][1] /*&& language==page[j][5]*/)
				{
					namePage=page[j][2]
				}
		}
		texte+='<a class="link" onclick="loadPageHisto(\''+tab[i]+'\')">'+namePage+'</a><br>';
	}
	var div=document.getElementById('histoDisplay');
	div.innerHTML=texte;
	}	
/* Fin Lien et Historique */
		
	function insert(urlPage,namePage,groupe,numberGroup,langue)
	{
		page[insertVar] = new Array(6);
		page[insertVar]=[insertVar,urlPage,namePage,groupe,numberGroup,langue] //Le tableau [][6]
		insertVar++;
	}
	
	/*
	verifParcourPage();
	function verifParcourPage()
	{
		var x="";
		for(i=0; i<=page.length-1; i++)
		{
			for(j=0; j<=5;j++)
			{
				x+=page[i][j]+ " ";
			}
			x+="\n"
		}
		alert(x);
	}
	*/
	
	function createLink(nameGroup)
	{
	var link="";
		for(i=0; i<=page.length-1; i++)
		{
			if(nameGroup==page[i][3] && language==page[i][5])
			{
			link+='<a class="link" onclick="loadPage(\''+page[i][1]+'\')">'+page[i][2]+'</a><br />';
			}
		}
	return link;
	}	
		
	function insertGroup(nameGroup)
	{
		groupTab[compteurGroup] =nameGroup;
		compteurGroup++;
	}	
	
	function update()
	{
	//-------------------------------------------------------------------Ajout de groupe-------->
		if(accessetat==1){openGroup('access');}
		if(creationetat==1){openGroup('creation');}
	//-------------------------------------------------------------------Ajout de groupe-------->
	}	
	
	/*
	function closeAllGroup()
	{
		//-------------------------------------------------------------------Ajout de groupe-------->
		accessetat=0;
		creationetat=0;		
		//-------------------------------------------------------------------Ajout de groupe-------->	
		for(i=0;i<=groupTab.length; i++)
		{
		var div=document.getElementById(groupTab[i]);
		var div2=document.getElementById(groupTab[i]+'ico');
		div.innerHTML='';
		div2.innerHTML='<img src="img/+.bmp" />';	
		}
	}
	*/
	
	function closeGroup(groupName)
	{
		//-------------------------------------------------------------------Ajout de groupe-------->
		if (groupName+'etat'=='accessetat'){ accessetat=0; }
		if (groupName+'etat'=='creationetat'){ creationetat=0; }	
		//-------------------------------------------------------------------Ajout de groupe-------->	
		for(i=0;i<=groupTab.length; i++)
		{
			if (groupTab[i]==groupName)
			{
			var div=document.getElementById(groupName);
			var div2=document.getElementById(groupName+'ico');
			div.innerHTML='';
			div2.innerHTML='<img src="img/+.bmp" />';	
			}
		}
	}
	
	function openGroup(groupName)
	{
		//-------------------------------------------------------------------Ajout de groupe-------->
		if (groupName+'etat'=='accessetat'){ accessetat=1; }
		if (groupName+'etat'=='creationetat'){ creationetat=1; }
				
		//-------------------------------------------------------------------Ajout de groupe-------->	
		for(i=0;i<=groupTab.length; i++)
		{
			if (groupTab[i]==groupName)
			{
			var div=document.getElementById(groupName);
			var div2=document.getElementById(groupName+'ico');
			div.innerHTML='<br>'+createLink(groupName);
			div2.innerHTML='<img src="img/-.bmp" />';	
			}
			 	
		}
	}

	function openReduceGroup(id, ico)
	{
		var div=document.getElementById(id);
		var div2=document.getElementById(ico);
		var etat;
		init(0);		

		
		function init(x)
		{
			if(x==0)
			{
			//-------------------------------------------------------------------Ajout de groupe-------->
				if(id=='access')
				{
				lien='<br>'+createLink('access');
				etat=accessetat;
				}
				
				if(id=='creation')
				{
				lien='<br>'+createLink('creation');
				etat=creationetat;
				//-------------------------------------------------------------------Ajout de groupe-------->
				}
			}
			
			if(x==1)
			{
				//-------------------------------------------------------------------Ajout de groupe-------->
				if(id=='access')
				{				
				accessetat=etat;
				}
				
				if(id=='creation')
				{
				creationetat=etat;
				}
				//-------------------------------------------------------------------Ajout de groupe-------->
			}
			
		}
				
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
		var div2=document.getElementById('icoHisto');
	
		if(etatOpenReduce==0)
		{
		div.innerHTML='<div id="histoDisplay"></div>';
		div2.innerHTML='<img src="img/histo-.bmp" />';
		etatOpenReduce=1;
		}
		else
		{
		document.getElementById('histoDisplay').style.background="#84FF84";
		div.innerHTML='';
		div2.innerHTML='<img src="img/histo+.bmp" />';
		etatOpenReduce=0;		 
		}
	}
		

/**********Module d'impression*****************/
function iPrint(ptarget)
{
ptarget.focus();
ptarget.print();
}
/**********Module d'impression*****************/

/**********Module de Recherche*****************/
initSearch();

	function initSearch()
	{
		var iframeInitSearch='';
		for(i=0; i<=(page.length-1); i++)
		{
		url=page[i][1];
		name=page[i][2];
	
		iframeInitSearch+='<iframe id="'+ name +'" src="'+url+'"></iframe>';	
		//alert(iframeInitSearch);
		}
		document.getElementById('loadIframeHide').innerHTML=iframeInitSearch;//affiche la iframe dans le div caché	
	}

document.getElementById('resultSearchLayer').style.display="none";

	 function search()
     {
	 	var compteur=0;//variable pour l'incrémentation du premier argument de la table searchResultDisplay 
		
		var searchResultDisplay = new Array();//tableau des résultats
		function SearchResult(lengthResult, name, url, lang) { this.lengthResult=lengthResult; this.name=name; this.url=url; this.lang=lang;}
		
		document.getElementById("menu").style.display="none";
		document.getElementById("resultSearchLayer").style.display="";
		
		var recherche=document.getElementById("recherche").value;//contenu du champs de recherche
		var reg = new RegExp(recherche,"ig");

		if(reg=="/(?:)/gi" || reg=="//ig")//si le champs ne contient rien
		{
		document.getElementById("resultSearchLayer").style.display="none";
		document.getElementById("menu").style.display="";
		}
		else
		{			
			var display = document.getElementById("resultSearch");	
			
			var x=0;//x et y des compteurs pour définir s'il ya trop de résultat ou pas du tout
			var y=0;
			var contenu = new Array();
			
			for(i=0; i<=(page.length-1); i++)
			{			
				var url=page[i][1];
				var namePage=page[i][2];
				var langage=page[i][5];
		
				contenu[i]=getIframeContent(namePage);
				//alert('pause');
				
				//Enregistrement du tableau pour le module de recherche
				var resultat = contenu[i].match(reg);				
				if(resultat!=null)
				{
					x++;
					if(resultat.length<20)//limite le nombre de résultat à 20 occurences 
					{			
						y++;		
						//searchResultDisplay[compteur]=new Array(4);		
						
						searchResultDisplay[compteur]=new SearchResult(resultat.length,namePage, url,langage);
						compteur++;	

						function parN(a,b)
						{
						return b.lengthResult - a.lengthResult;
						}
						searchResultDisplay.sort(parN);							

						z='<img src="img/gif-loupe.gif" /><br>';								
						
						for(j=0; j<=(searchResultDisplay.length-1); j++)
						{	
							z+='<a class="link" onclick="loadPageHisto(\''
							+searchResultDisplay[j].url+'\')">'
							+searchResultDisplay[j].name+'</a>'
							+ ' score: '+ searchResultDisplay[j].lengthResult
							+ ' '+ searchResultDisplay[j].lang
							+ '<br />';
							display.innerHTML=z;	
						}			
					 }
				  }
			}//fin du for
			if (y==0){display.innerHTML='No results';}			
			if (x!=0 && y==0){display.innerHTML='Need more precision';}
		}//fin du else		
	 }
/* 
	 function empty()
	 {	
		 for(i=0; i<=searchResultDisplay.length-1; i++)
		 {
			 for(j=0; j<=0; j++)
			 {			  
			 	searchResultDisplay[i][j]=null;
			 }
	 	 }
	 }
*/
/*
	 function displaySearchResult()
	 {
		for(i=0; i<=searchResultDisplay.length-1; i++)
		{	
			 x+= searchResultDisplay[i][0]+ ' ' + searchResultDisplay[i][2] + ' score: '+ searchResultDisplay[i][3]+'<br>';
	 	}
		alert(x);
	 }
*/
	function getIframeContent(iframeName)
	{
	
		IE  = window.ActiveXObject ? true : false;
		MOZ = window.sidebar       ? true : false;
		
		var code;
		
		if(IE)
		{
		edoc = window.frames[iframeName].document;
		code = edoc.body.innerHTML;
		}
	
		if(MOZ)
		{
		code = document.getElementById(iframeName).contentDocument.body.innerHTML;
		}
		//alert(code);
		return(code)
		
	}
	
/**********Module de Recherche*****************/