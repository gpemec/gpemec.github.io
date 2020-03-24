

var GR1S1 = [
	{
		"instr": "Accidente que tenga como consecuencia la muerte, la pérdida de un miembro o una lesión grave?",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	},
	{
		"instr": "Asaltos?",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	},
	{
		"instr": "Actos violentos que derivaron en lesiones graves??",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	},
	{
		"instr": "Secuestro?",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	},
	{
		"instr": "Amenazas?",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	},
    {
		"instr": "Cualquier otro que ponga en riesgo su vida o salud, y/o la de otras personas?",
		"options": ["Sí", "No"] ,
		"answers": [true, false]
	}
];

var feedback= '';
var countQ = 0;
var countTrue = 0;


function createQuizz() {
	$('.clicked').toggleClass('clicked');
	$('.submit').show();
	if(countQ === GR1S1.length){
		$('#quiz').hide();
		var scorePercentage = Math.floor((countTrue/countQ)*100);
        if(scorePercentage >= 1) {
            $('#quiz2').show();
            $('#quiz3').show();
        }
        else {
            $('#lastScreen').show();
        }
	}
	$('.option').css('cursor','pointer');
	$('.option').css('pointer-events','auto');
	$('.options').empty();
	var Qnb = countQ + 1;
	var title = '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes: ';
	var instr = GR1S1[countQ].instr;
	$('.question h1').html(title);
	$('.question p').html(instr);
	for(var i=0; i < GR1S1[countQ].options.length; i++){
		var option = "<div class='option btn' data-result='"+ GR1S1[countQ].answers[i]+"'>"+ GR1S1[countQ].options[i]+"</div>";
		$('.options').append(option);
	}
		$('.option').click(function(){
		$(this).toggleClass('clicked');
	});
	countQ++;
}

createQuizz();
$('#lastScreen').hide();
$('#quiz2').hide();
$('#quiz3').hide();
$('#answersScreen').hide();


$('.submit').click(function(){
	var nbRightAnswers = countRightAnwers();
	if ($('.clicked').length === 0){
		//no option selected, display an error message 
		alert('Selecciona 1 respuesta');
		$('.clicked').toggleClass('clicked');
		$('.option').css('cursor', 'pointer');
		$('.option').css('pointer-events', 'auto');
		
	} else {
		$('.option').css('pointer-events','none');
		if(nbRightAnswers <= 1){
			console.log('single answer') 
			if ($('.clicked').length !==1){
				alert('Selecciona solo 1 respuesta');
				$('.clicked').toggleClass('clicked');
				$('.option').css('cursor','pointer');
				$('.option').css('pointer-events','auto');
			} else {
				checkAnswer(nbRightAnswers);
                createQuizz();
			}
		} else {
			console.log('multiple answer');
			checkAnswer(nbRightAnswers);
		}
	}  
    
});


function countRightAnwers(){
	var $option = $('.option');
	var count = $option.length;
	var answer = 0;
	for(var i=0; i < count; i++){
		if($option[i].dataset.result === 'true'){
			answer ++;
		}
	}
	return answer;
}

function checkAnswer(nbRightA){
	var answersSelected = $('.clicked').length;
	if (answersSelected !== nbRightA){
		feedback = 'wrong';
		return feedback;
	} else {
		for(var i = 0; i < answersSelected; i++){
			if($('.clicked')[i].dataset.result === 'false'){
				feedback = 'wrong';
				return feedback;
			}
		}
		feedback = 'true';
		countTrue++;
	}
}

