<style>
  ol
  {
    width: 60em;  /* room for 3 columns */
  }
  ol li
  {
    float: left;
    /* suppress item markers */
    list-style-type: none;
    margin: 10px;
  }
  /* stop the floating after the list */
  br
  {
    clear: left;
  }
  /* separate the list from what follows it */
  div.wrapper
  {
    margin-bottom: 1em;
    margin-left: 0;
  }

  ol li
  {
    display: block;
    text-decoration: none;
    /* background-color:orange; */
    padding: 5px;
  }

  ol li a:hover
  {
    color: #FFF; /* white */
    background-color: #A52A2A; /* brown */
  }

  div.boxes {
    background-color: orange;
    width: 200px;
    height: 100px;
    padding:5px;

  }

</style>
<style>
  /*
 Author: Craig Erskine
 Description: Dynamic Menu System - Horizontal/Vertical
  */


  ul#navmenu-h { margin: 0; padding: 0; list-style: none; position: relative; height:28px;z-index:1;}

  ul#navmenu-h ul {
    width: 160px; /* Sub Menu Width */
    margin: 0;
    list-style: none;
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
  }

  ul#navmenu-h ul ul,ul#navmenu-h ul ul ul { top: 0; left: 100%; }

  ul#navmenu-h li { float: left; display: inline; position: relative; }
  ul#navmenu-h ul li { width: 100%; display: block; }

  /* Root Menu */
  ul#navmenu-h a {
    border-top: 1px solid #FFF;
    border-right: 1px solid #FFF;
    padding: 6px;
    float: left;
    display: block;
    background: #DDD;
    color: #666;
    font: bold 11px Arial, sans-serif;
    text-decoration: none;
    height: auto;
  }

  /* Root Menu Hover Persistence */
  ul#navmenu-h a:hover,ul#navmenu-h li:hover a,ul#navmenu-h li.iehover a {
    background: #BBB;
    color: #FFF;
  }

  /* 2nd Menu */
  ul#navmenu-h li:hover li a,ul#navmenu-h li.iehover li a {
    float: none;
    background: #BBB;
  }

  /* 2nd Menu Hover Persistence */
  ul#navmenu-h li:hover li a:hover,ul#navmenu-h li:hover li:hover a,ul#navmenu-h li.iehover li a:hover,ul#navmenu-h li.iehover li.iehover a {
    background: #999;
  }

  /* 3rd Menu */
  ul#navmenu-h li:hover li:hover li a,ul#navmenu-h li.iehover li.iehover li a {
    background: #999;
  }

  /* 3rd Menu Hover Persistence */
  ul#navmenu-h li:hover li:hover li a:hover,ul#navmenu-h li:hover li:hover li:hover a,ul#navmenu-h li.iehover li.iehover li a:hover,ul#navmenu-h li.iehover li.iehover li.iehover a {
    background: #666;
  }

  /* 4th Menu */
  ul#navmenu-h li:hover li:hover li:hover li a,ul#navmenu-h li.iehover li.iehover li.iehover li a {
    background: #666;
  }

  /* 4th Menu Hover */
  ul#navmenu-h li:hover li:hover li:hover li a:hover,ul#navmenu-h li.iehover li.iehover li.iehover li a:hover {
    background: #333;
  }

  /* Hover Function - Do Not Move */
  ul#navmenu-h li:hover ul ul,ul#navmenu-h li:hover ul ul ul,ul#navmenu-h li.iehover ul ul,ul#navmenu-h li.iehover ul ul ul { display: none; }
  ul#navmenu-h li:hover ul,ul#navmenu-h ul li:hover ul,ul#navmenu-h ul ul li:hover ul,ul#navmenu-h li.iehover ul,ul#navmenu-h ul li.iehover ul,ul#navmenu-h ul ul li.iehover ul { display: block; padding:0;}


</style>

<style>
  /*
 Author: Craig Erskine
 Description: Dynamic Menu System - Horizontal/Vertical
  */


  ul.level-1 { margin: 0; padding: 0; list-style: none; position: relative; height:28px;z-index:1;}

  ul.level-1 ul {
    width: 160px; /* Sub Menu Width */
    margin: 0;
    list-style: none;
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
  }

  ul.level-1 ul ul,ul.level-1 ul ul ul { top: 0; left: 100%; }

  ul.level-1 li { float: left; display: inline; position: relative; }
  ul.level-1 ul li { width: 100%; display: block; }

  /* Root Menu */
  ul.level-1 a {
    border-top: 1px solid #FFF;
    border-right: 1px solid #FFF;
    padding: 6px;
    float: left;
    display: block;
    background: #DDD;
    color: #666;
    font: bold 11px Arial, sans-serif;
    text-decoration: none;
    height: auto;
  }

  /* Root Menu Hover Persistence */
  ul.level-1 a:hover,ul.level-1 li:hover a,ul.level-1 li.iehover a {
    background: #BBB;
    color: #FFF;
  }

  /* 2nd Menu */
  ul.level-1 li:hover li a,ul.level-1 li.iehover li a {
    float: none;
    background: #BBB;
  }

  /* 2nd Menu Hover Persistence */
  ul.level-1 li:hover li a:hover,ul.level-1 li:hover li:hover a,ul.level-1 li.iehover li a:hover,ul.level-1 li.iehover li.iehover a {
    background: #999;
  }

  /* 3rd Menu */
  ul.level-1 li:hover li:hover li a,ul.level-1 li.iehover li.iehover li a {
    background: #999;
  }

  /* 3rd Menu Hover Persistence */
  ul.level-1 li:hover li:hover li a:hover,ul.level-1 li:hover li:hover li:hover a,ul.level-1 li.iehover li.iehover li a:hover,ul.level-1 li.iehover li.iehover li.iehover a {
    background: #666;
  }

  /* 4th Menu */
  ul.level-1 li:hover li:hover li:hover li a,ul.level-1 li.iehover li.iehover li.iehover li a {
    background: #666;
  }

  /* 4th Menu Hover */
  ul.level-1 li:hover li:hover li:hover li a:hover,ul.level-1 li.iehover li.iehover li.iehover li a:hover {
    background: #333;
  }

  /* Hover Function - Do Not Move */
  ul.level-1 li:hover ul ul,ul.level-1 li:hover ul ul ul,ul.level-1 li.iehover ul ul,ul.level-1 li.iehover ul ul ul { display: none; }
  ul.level-1 li:hover ul,ul.level-1 ul li:hover ul,ul.level-1 ul ul li:hover ul,ul.level-1 li.iehover ul,ul.level-1 ul li.iehover ul,ul.level-1 ul ul li.iehover ul { display: block; padding:0;}


</style>

<div style="padding:5px;">
  <ul  id="navmenu-h">
    <li class="controller"><a href="${createLink(controller:'socio')}">soci</a></li>
    <li class="controller"><a href="${createLink(controller:'categoria')}">categorie</a></li>
    <li class="controller"><a href="${createLink(controller:'oggetto')}">oggetti</a></li>
    <li class="controller"><a href="#">tabelle</a>
      <ul>
        <li class="controller"><a href="${createLink(controller:'requestmap')}">filtri accesso</a></li>
        <li class="controller"><a href="${createLink(controller:'authority')}">ruoli</a></li>
      </ul>
    </li>
  </ul>
</div>
