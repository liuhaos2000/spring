function createCombotree(combotreeId, url) {
    jQuery("#" + combotreeId).combotree({
        url : url,
        width : 120,
        panelWidth : 250,
        panelHeight : 250,
        lines : true,
        expandAll : true,
        onLoadSuccess:function(node, data){
        
        	//先判断 请选择是否在根节点
        	 if(jQuery("#" + combotreeId).combotree("tree").tree("find","-1")==null){
        		 var roots = jQuery("#" + combotreeId).combotree("tree").tree("getRoots");
        		 if(roots.length>0){
        			 var firstRoot = roots[0];
        			 jQuery("#" + combotreeId).combotree("tree").tree("insert",{'data':[{'id':'-1','text':'请选择'}],'before':firstRoot.target});
        		 }else{
        			 jQuery("#" + combotreeId).combotree("tree").tree("append",{'data':[{'id':'-1','text':'请选择'}]});
        		 }
        	 }
        },
        onShowPanel : function() {
            jQuery("#" + combotreeId).combotree("tree").tree("expandAll");
        }
    });
}
    
/* 更改Button */
	    function changeButton(dataGrid, operateId) {
	        var btn = jQuery("#" + operateId);
	        var ckdCount = jQuery('#' + dataGrid).datagrid("getSelections").length;
	        if (ckdCount > 0) {
	            btn.attr("disabled", false).removeClass("panelbar_hide");
	        } else {
	            btn.attr("disabled", true).addClass("panelbar_hide");
	        }
	    }

