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
				$($qid).html($no);

				//end within abc function	
			}

		//end for ajax
		});

	//end for function b
	});


	$(".upvotes").submit(function(c){
		c.preventDefault();
		console.log($(this).attr("method"));
		console.log($(this).attr("action"));
		console.log($(this).serialize());
		$.ajax({
			type: $(this).attr("method"),
			url: $(this).attr("action"),
			data: $(this).serialize(),
			dataType: "json",

			success: function(abs){
				console.log(abs);
				$answer_id_up = "#" + abs[0][0]+".upvotes";
				$answer_id_down = "#" + abs[0][0]+".downvotes";
				var $value_true = [];
				var $value_false = [];
				$.each(abs, function(k, v){
					$.each(v, function(i, x){
			if (x == 1) {$value_true.push(x)} else if (x == 2) {$value_false.push(x)}
					});
				});	
		
				console.log(abs);
				console.log($answer_id_up);
				console.log($answer_id_down);
				console.log($value_true);
				console.log($value_true);
				console.log($value_false);
				console.log($value_false);
				
				$($answer_id_up).html($value_true.length);	
				$($answer_id_down).html($value_false.length);	
	
				//end within abc function
			}

		//end for ajax
		});

	//end for function c
	});

				$(".downvotes").submit(function(d){

			d.preventDefault();

		console.log($(this).attr("method"));
		console.log($(this).attr("action"));
		console.log($(this).serialize());

		$.ajax({
					type: $(this).attr("method"),
					url: $(this).attr("action"),
					data: $(this).serialize(),
					dataType: "json",

					
			success: function(abs){
				console.log(abs);
				$answer_id_up = "#" + abs[0][0]+".upvotes";
				$answer_id_down = "#" + abs[0][0]+".downvotes";
				var $value_true = [];
				var $value_false = [];
				$.each(abs, function(k, v){
					$.each(v, function(i, x){
						if (x == 1) {$value_true.push(x)} else if (x == 2) {$value_false.push(x)}
					});
				});	
		
				// console.log(abs);
				console.log($answer_id_up);
				console.log($answer_id_down);				
				console.log($value_true);
				console.log($value_true);
				console.log($value_false);
				console.log($value_false);
				
				$($answer_id_up).html($value_true.length);	
				$($answer_id_down).html($value_false.length);	
		
				//end within abc function
			}

		//end for ajax
		});

//end for function d
});




//end for document
});