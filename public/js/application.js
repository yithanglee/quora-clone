$(document).ready(function(){
		$(".updates").submit(function(b){

			b.preventDefault();

		console.log($(this).attr("method"));
		console.log($(this).attr("action"));
		console.log($(this).serialize());

		$.ajax({
					type: $(this).attr("method"),
					url: $(this).attr("action"),
					data: $(this).serialize(),
					dataType: "json",

					success: function(abs){
						
						$qid = ("#" + abs[0].question_id);
						$no = abs.length;
						console.log($qid);
						console.log($no);
						$($qid).html($no);

						//end within abc function
					}

		//end for ajax
		});

//end for function e
});
//end for document
});