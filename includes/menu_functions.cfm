<script language="JavaScript">
  var childActive = null 
    var menuActive = null
    var lastHighlight = null
    var active = false
   
    function getReal(el) {
      // FIND A TABLE CELL ELEMENT IN THE PARENT CHAIN */
      temp = el
      while ((temp!=null) && (temp.tagName!="TABLE") && (temp.className!="root") && (temp.id!="menuBar")) {
        if (temp.tagName=="TD")
          el = temp
        temp = temp.parentElement
      }
      return el
    }

    function raiseMenu(el) {
      el.style.borderLeft = "1px #EEEEEE solid"
      el.style.borderTop = "1px #EEEEEE solid"
      el.style.borderRight = "1px white solid"
      el.style.borderBottom = "1px white solid"
    }

    function clearHighlight(el) {
      if (el==null) return
      el.style.borderRight = "1px white solid"
      el.style.borderBottom = "1px white solid"
      el.style.borderTop = "1px white solid"
      el.style.borderLeft = "1px white solid" 
	  showElement('SELECT');
    }

    function sinkMenu(el) {
      el.style.borderRight = "1px #EEEEEE solid"
      el.style.borderBottom = "1px #EEEEEE solid"
      el.style.borderTop = "1px white solid"
      el.style.borderLeft = "1px white solid"
	  hideElement('SELECT');
    }

    function menuHandler(menuItem) {
      // WRITE GENERIC MENU HANDLERS HERE!
      // RETURNING TRUE COLLAPSES THE MENU. RETURNING FALSE DOES NOT COLLAPSE THE MENU
      return true
    }

    function getOffsetPos(which,el,tagName) {
      var pos = 0 // el["offset" + which]
      while (el.tagName!=tagName) {
        pos+=el["offset" + which]
        el = el.offsetParent
      }
      return pos	
    }

    function getRootTable(el) {
      el = el.offsetParent
      if (el.tagName=="TR") 
        el = el.offsetParent
      return el
    }

    function getElement(el,tagName) {
      while ((el!=null) && (el.tagName!=tagName) )
        el = el.parentElement
      return el
    }

    function processClick() {
      var el = getReal(event.srcElement)
      if ((getRootTable(el).id=="menuBar") && (active)) {        
        cleanupMenu(menuActive)
        clearHighlight(menuActive)
        active=false
        lastHighlight=null
        doHighlight(el)
      }
      else {
        if ((el.className=="root") || (!menuHandler(el)))
          doMenuDown(el)
        else {
          if (el._childItem==null) 
            el._childItem = getChildren(el)
          if (el._childItem!=null)  return;
          if ((el.id!="break") && (el.className!="disabled") && (el.className!="disabledhighlight") && (el.className!="clear"))  {
            if (menuHandler(el)) {
              cleanupMenu(menuActive)
              clearHighlight(menuActive)
              active=false
              lastHighlight=null
            }
          }
        }
      }
    }

    function getChildren(el) {
      var tList = el.children.tags("TABLE")
      var i = 0
      while ((i<tList.length) && (tList[i].tagName!="TABLE"))
        i++
      if (i==tList.length)
        return null
      else
        return tList[i]
    }

    function doMenuDown(el) {
      if (el._childItem==null) 
        el._childItem = getChildren(el)
      if ((el._childItem!=null) && (el.className!="disabled") && (el.className!="disabledhighlight")) {
        // PERFORMANCE OPTIMIZATION - CACHE CHILD ELEMENT
        ch = el._childItem
        if (ch.style.display=="block") {
          removeHighlight(ch.active)
          return
        }
        ch.style.display = "block"
        if (el.className=="root") {
          ch.style.pixelTop = el.offsetHeight + el.offsetTop + 2
          ch.style.pixelLeft = el.offsetLeft + 1
	  if (ch.style.pixelWidth==0)
            ch.style.pixelWidth = ch.rows[0].offsetWidth+50
          sinkMenu(el)
          active = true
          menuActive = el
        } else {
          childActive = el
          ch.style.pixelTop = getOffsetPos("Top",el,"TABLE") -3 // el.offsetTop + el.offsetParent.offsetTop - 3
          ch.style.pixelLeft = el.offsetLeft + el.offsetWidth
	  if (ch.style.pixelWidth==0)
            ch.style.pixelWidth = ch.offsetWidth+50
        }     
      }
    }
 
    function doHighlight(el) {
      el = getReal(el)
      if ("root"==el.className) {
        if ((menuActive!=null) && (menuActive!=el)) {
          clearHighlight(menuActive)
        }
        if (!active) {
          raiseMenu(el)
        }          
        else 
          sinkMenu(el)
        if ((active) && (menuActive!=el)) {
          cleanupMenu(menuActive)          
          doMenuDown(el)
        }
        menuActive = el  
        lastHighlight=null
      }
      else {
        if (childActive!=null) 
          if (!childActive.contains(el)) 
            closeMenu(childActive, el)    

        if (("TD"==el.tagName) && ("clear"!=el.className)) {
          var ch = getRootTable(el)         
          if (ch.active!=null) {
            if (ch.active!=el) {
              if (ch.active.className=="disabledhighlight")  
                ch.active.className="disabled"
              else
                ch.active.className=""
              }
            }
          ch.active = el
          lastHighlight = el
          if ((el.className=="disabled") || (el.className=="disabledhighlight") || (el.id=="break")) 
            el.className = "disabledhighlight"
          else {
            if (el.id!="break") {
              el.className = "highlight"
              if (el._childItem==null) 
                el._childItem = getChildren(el)
              if (el._childItem!=null) {
                doMenuDown(el)
              }
            }  
          }
        }
      }
    }

    function removeHighlight(el) {
      if (el!=null)
        if ((el.className=="disabled") || (el.className=="disabledhighlight"))  
          el.className="disabled"
        else
          el.className=""
    }

    function cleanupMenu(el) {
      if (el==null) return
      for (var i = 0; i < el.all.length; i++) {
        var item = el.all[i]
        if (item.tagName=="TABLE")
         item.style.display = ""
        removeHighlight(item.active)
        item.active=null
      }
    }


    function closeMenu(ch, el) {
      var start = ch
      while (ch.className!="root") {
          ch = ch.parentElement
          if (((!ch.contains(el)) && (ch.className!="root"))) {
            start=ch
          }
      }
      cleanupMenu(start)
    }
 
    function checkMenu() {      
      if (document.all.menuBar==null) return
      if ((!document.all.menuBar.contains(event.srcElement)) && (menuActive!=null)) {
        clearHighlight(menuActive)
        closeMenu(menuActive)
        active = false
        menuActive=null
        choiceActive = null
      }
    }

    function doCheckOut() {
      var el = event.toElement      
      if ((!active) && (menuActive!=null) && (!menuActive.contains(el))) {
        clearHighlight(menuActive)
        menuActive=null
      }
    }


    function processKey() {
      if (active) {
        switch (event.keyCode) {
         case 13: lastHighlight.click(); break;
         case 39:  // right
           if ((lastHighlight==null) || (lastHighlight._childItem==null)) {
             var idx = menuActive.cellIndex
//             if (idx==menuActive.offsetParent.cells.length-2)
             if (idx==getElement(menuActive,"TR").cells.length-2)
               idx = 0
             else
               idx++
             newItem = getElement(menuActive,"TR").cells[idx]
           } else
           {
             newItem = lastHighlight._childItem.rows[0].cells[0]
           }
           doHighlight(newItem)
           break; 
         case 37: //left
           if ((lastHighlight==null) || (getElement(getRootTable(lastHighlight),"TR").id=="menuBar")) {
             var idx = menuActive.cellIndex
             if (idx==0)
               idx = getElement(menuActive,"TR").cells.length-2
             else
               idx--
             newItem = getElement(menuActive,"TR").cells[idx]
           } else
           {
             newItem = getElement(lastHighlight,"TR")
             while (newItem.tagName!="TD")
               newItem = newItem.parentElement
           }
           doHighlight(newItem)
           break; 
         case 40: // down
            if (lastHighlight==null) {
              itemCell = menuActive._childItem
              curCell=0
              curRow = 0
            }
            else {
              itemCell = getRootTable(lastHighlight)
              if (lastHighlight.cellIndex==getElement(lastHighlight,"TR").cells.length-1) {
                curCell = 0
                curRow = getElement(lastHighlight,"TR").rowIndex+1
                if (getElement(lastHighlight,"TR").rowIndex==itemCell.rows.length-1)
                  curRow = 0
              } else {
                curCell = lastHighlight.cellIndex+1
                curRow = getElement(lastHighlight,"TR").rowIndex
              }
            }
            doHighlight(itemCell.rows[curRow].cells[curCell])
            break;
         case 38: // up
            if (lastHighlight==null) {
              itemCell = menuActive._childItem
              curRow = itemCell.rows.length-1
              curCell= itemCell.rows[curRow].cells.length-1

            }
            else {
              itemCell = getRootTable(lastHighlight)
              if (lastHighlight.cellIndex==0) {
                curRow = getElement(lastHighlight,"TR").rowIndex-1
                if (curRow==-1)
                  curRow = itemCell.rows.length-1
                curCell= itemCell.rows[curRow].cells.length-1

              } else {
                curCell = lastHighlight.cellIndex - 1
                curRow = getElement(lastHighlight,"TR").rowIndex
              }
            }
            doHighlight(itemCell.rows[curRow].cells[curCell])
            break;
           if (lastHighlight==null) {
              curCell = menuActive._childItem
              curRow = curCell.rows.length-1
            }
            else {
              curCell = getRootTable(lastHighlight)
              if (getElement(lastHighlight,"TR").rowIndex==0)
                curRow = curCell.rows.length-1
              else
                curRow = getElement(lastHighlight,"TR").rowIndex-1
            }
            doHighlight(curCell.rows[curRow].cells[0])
            break;
        }
      }
    }
	
	function CheckIt() 
	{
		
		var el = event.srcElement;
		//alert(el.tagName);
		if ((el.tagName != "TD") || (getRootTable(el).id!="menuBar")) 
		{
			cleanupMenu(menuActive)
			clearHighlight(menuActive)
			active=false
			lastHighlight=null
		}
	}
	

	
   function hideElement(elmID)
 {
  for (i = 0; i < document.all.tags(elmID).length; i++)
  {
   obj = document.all.tags(elmID)[i];
   obj.style.visibility = 'hidden';
  }
  if (document.table_selected.frmreaction + "" != "undefined")
    document.table_selected.frmreaction.origin_country_id.style.visibility='hidden';
  }
 function showElement(elmID)
  {
   for (i = 0; i < document.all.tags(elmID).length; i++)
   {
    obj = document.all.tags(elmID)[i];
    obj.style.visibility = '';
   }
  if (document.table_selected.frmreaction + "" != "undefined")
    document.table_selected.frmreaction.origin_country_id.style.visibility='';
  }
</script>