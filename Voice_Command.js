const lecture = [
    {name:'lecture hall 1',id: 'lecture hall 1'},
    {name:'lecture hall 2',id: 'lecture hall 2'},
    {name:'lecture hall 3',id: 'lecture hall 3'},
    {name:'lecture hall 4',id: 'lecture hall 4'},
    {name:'lecture hall 5',id: 'lecture hall 5'},
    {name:'lecture hall 6',id: 'lecture hall 6'},
    {name:'lecture hall 7',id: 'lecture hall 7'},
    {name:'lecture hall 8',id: 'lecture hall 8'},
    {name:'lecture hall 9',id: 'lecture hall 9'},
]

const hall = [
    {name:'hall 1',id: 'hall 1'},
    {name:'hall 2',id: 'hall 2'},
    {name:'hall 3',id: 'hall 3'},
    {name:'hall 4',id: 'hall 4'},
    {name:'hall 5',id: 'hall 5'},
    {name:'hall 6',id: 'hall 6'},
    {name:'hall 7',id: 'hall 7'},
    {name:'hall 8',id: 'hall 8'},
    {name:'hall 9',id: 'hall 9'},
]

const lab = [
    {name:'lab 1',id: 'lab 1'},
    {name:'lab 2',id: 'lab 2'},
    {name:'lab 3',id: 'lab 3'},
    {name:'lab 4',id: 'lab 4'},
    {name:'lab 5',id: 'lab 5'},
    {name:'lab 6',id: 'lab 6'},
    {name:'lab 7',id: 'lab 7'},
    {name:'lab 8',id: 'lab 8'},
    {name:'lab 9',id: 'lab 9'},
]

const affairs = [{name:'student affairs',id: 'student affairs'},]

let lecturePattern = lecture.map(item => `${item.name}`).join('|');
let hallPattern = hall.map(item => `${item.name}`).join('|');
let labPattern = lab.map(item => `${item.name}`).join('|');
let affairsPattern = affairs.map(item => `${item.name}`).join('|');
console.log(lecturePattern,hallPattern,labPattern,affairsPattern);

onVisualState((p) => {
    console.log(JSON.stringify(p.visual));
})

intent(`(my name is| name is) $(NAME)`, p => {
        p.play(`Hi ${p.NAME.value}`);
        p.play('where would you like to go?');
});

intent(`(go to| to) $(DESTINATION~ ${lecturePattern}|${hallPattern}|${labPattern}|${affairsPattern}|)`,p => {
    p.userData.place = `${p.DESTINATION.value}`;
    if (p.userData.place.length > 0) {
        p.play('sure');
        p.play({command:"getDestination", text: p.DESTINATION.value});
        p.play(`I will take you to ${p.DESTINATION.value}`);
        p.play('where are you now?');
    } else {
         p.play('Sorry, Please Repeat again!');
         p.play('where would you like to go?');
    }
});

intent(`(at|) $(CURRENT~ ${lecturePattern}|${hallPattern}|${labPattern}|${affairsPattern}|)`, p => {
    p.userData.place = `${p.CURRENT.value}`;
    if (p.userData.place.length > 0) {
        p.play('okay');
        p.play({command:"getCurrent", text: p.CURRENT.value});
        p.play(`setting course from ${p.CURRENT.value}`);
        p.play('Would You Like me to Do anything else?');
    } else {
         p.play('Sorry, Please Repeat again!');
         p.play('where are you now?');
    }
});

intent('(Thank you| No Thank you)', p => {
       p.play('you are welcome');
       p.play({command:"submit"})
    
});