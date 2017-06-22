/**
 * 重新计算
 */
function reCacl()
{
	var layerIndex;
	
	$.ajax({   
		type:"post",     
		url:"../VCcBomCost/Servlet?method=reCacl4this",   
		data:$('#pageForm').serialize(),
		beforeSend:function(){
			layerIndex=layer.load(
				2,
				{
					shade: [0.1,'#000'],
					offset:'50px'
				}
			);},
		success:function(result){     
			 layer.close(layerIndex);
			 $("#pageForm").submit();//刷新
		 },   
		error:function(){   
			 alert("出现了点小问题哦");   
			  layer.close(layerIndex);
		 }   
	 }); 
}