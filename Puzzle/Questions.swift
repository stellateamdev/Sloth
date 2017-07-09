//
//  Questions.swift
//  Puzzle
//
//  Created by marky RE on 5/29/2560 BE.
//  Copyright © 2560 marky RE. All rights reserved.
//

import Foundation

var questions:[Question] = []

class Questions:NSObject {
    
    
    override init() {
        var question = Question(q: "In a digital clock, how many times will the digital clock display 3 or more of the same number in a row in 1 day? If the digital clock time shown is a 12-hour format, not 24 hours format.", h: "try to think of 11:11, 12:22 etc.", w: false,ans:"34")
        questions.append(question)
         question = Question(q: "A and B have been assigned a 10 acre plot of land and split it in half so they can work independently. A can plow the land at a rate of 25 minutes per acre. B takes 50 minutes to plow, but sows seeds at four times the speed of A. If sowing seeds on the 10 acre plot pays $200, how much of that money should B get?", h:"10-acre plot of land to work together and split it in half. Is it really about an amout of time each person work?",w: false,ans:"100")
        questions.append(question)
        question = Question(q: "The first letter of the alphabet is A, and the letter B comes after the letter A. So the question is, what's the last letter of the alphabet?.",h:"letter p comes after letter l and letter t comes after letter e. Why is that?", w: false,ans:"t")
        questions.append(question)
        question = Question(q: "A,B, C and D are single-digit numbers. The following equations can all be made with these numbers.\nA + C = D\nC - B = B\nA x B = C\nA x 4 = D\nFind the values of A,B,C,D and input your answer as a four digit-number arrange in this format, ABCD",h: " C - B = B. This means that C = 2 x B. And you can get that C = 3 x A Do the rest ", w: false,ans:"2368")
        questions.append(question)
        question = Question(q: "At night, 10 candles stand burning in a room. A strong breeze blows in through an open window and extinguishes 2 of them. Now you see that one more candle has gone out. To make sure no more flames go out, you shut the window. Assuming the wind doesn't extinguish any more candles, how many candles do you have left in the morning ?",h: " Think about what \"have left in the end\"  actually  means. It means that an item continues to exist so exactly, what becomes of a burning candle when it's left alone since night till morning? ", w: false,ans:"3")
        questions.append(question)
        question = Question(q: "A glass jar holds a single cell. After one minute, 1 cell splits into 2 cells. One minute after that, the 2 cells each split again, forming a total of 4 cells. Continuing at this rate, a single cell can multiply to fill the whole jar in exactly 1 hour. Knowing this, how long in minutes would it take to fill the jar if you had started with 2  cells?",h: " Your answer is the amount of time it takes for two germs to fill the jar. If starting with 1 cell  takes 1 minute to split into 2, how much additional time is needed to fill the jar if start with 2? ", w: false,ans:"59")
        questions.append(question)
        question = Question(q: "A boy and his big brother are sitting around the kitchen table chatting. Younger brother said \" You know , if I took away 2 years from my age and gave them to you, you'd be twice my age, huh! \" \nOlder brother reply \" Well, why don't you just give me 1 more on top of that? Then I'll be 3 times your age.\" \nSo just how old is each sibling? ",h: " The brother and sister were born in the same year ", w: false,ans:"6")
        questions.append(question)
        question = Question(q: " \" ?? equals to ? divided by 1000\". \nThe \" ? \" represent only 1 letter and all the \" ? \" have the same letter.\nWhat is the letter?",h:"Think of all the possibility, could it be something that represents number, unit perhaps?", w: false,ans:"m")
        questions.append(question)
        question = Question(q: "John needs to take 12 pills, each one every day in specific order.\nThe problem is every pill looks the same so john has to write a number of order to each pill\nso, how many pills should be written by john?",h:"Think carefully, John has to take his pill on the first day he got it and he also has to take the last pill 11 days later. What does this mean?", w: false,ans:"10")
        questions.append(question)
        question = Question(q: "O, T, T, F, F, S, S, ? ,N,T what letter belongs in the \" ? \"",h:"There's 10 letters in it, count them. Notice something?", w: false,ans:"e")
        questions.append(question)
        question = Question(q: "5 cats can catch 5 mice in 5 minutes. With that in mind, how many cats does it take to catch 100 mice in 100 minutes?",h:"5 cats can catch 5 mice in 5 minutes which mean 5 cats will catch the next 5 mice in the 5 minutes. Notice something?", w: false,ans:"5")
         questions.append(question)
        question = Question(q: "A mother and daughter are chatting when the son asks this question: \"Mom, I'm 18 now, but just how old are you?\" The mother replies, \"Well, Let me riddle this. I'm as old as your age, plus half of my age.\" How old is the Mother?",h:"18 plus half of mother's age will equal to mother's age. Apply simple math equation to it.", w: false,ans:"36")
        questions.append(question)
           question = Question(q: "A bat and a ball cost $1.10 in total. The bat costs exactly $1.00 more than the ball. How much does the ball cost ?",h:"Think of this in math equation for start, bat plus ball equal 1.10\n what is the second equation?", w: false,ans:"0.05")
        questions.append(question)
        question = Question(q: "You bought a mouse that's born right before your eyes. This mouse can gives birth once a month, birthing 15 babies each time. Baby mice can give birth 3 months after they are born. In 1 year from now, how many mice will you have ?",h:"How can a mouse give birth? does the word \"two\" familiar to you?", w: false,ans:"0")
        questions.append(question)
        question = Question(q: "10 - 6 = 4\n10+ 6 = 4\n 9 + 6 = ?.\nWhat is the answer of 9 + 6 ?",h:"The number is about time", w: false,ans:"3")
        questions.append(question)
        question = Question(q:"There's an election in Cake Town for major and there are 3 candidates . In this town there's 40 person in it.What is the fewest number of votes does the acandidate need in order to secure their victory, assume that each candidate will be voted by the town member.",h:"If you've got 37 votes while others got only 1 vote, that's the best case scenario of you winning right?. Then what about your worst case scenario of you winning is?", w: false,ans:"20")
        questions.append(question)
        question = Question(q: "You want to get home which is on the 3rd floor of the apartment. It took 32 seconds for you to walk the stairs to your room but then your neighbor told you that your wife is cheating on you at the 7th floor so you go up to that floor by stairs.How much time it took for you to go to 7th floor from 3rd floor?",h:"how many flights stairs did you have to walk from first floor to 3rd floor?", w: false,ans:"64")
        questions.append(question)
        question = Question(q: "The distance 4 horses can run around the racetrack is listed below.\nHorse A: 3 laps per minute.\nHorse B: 4 laps per minute.\nHorse C: 5 laps per minute\nHorse D: 6 laps per minute. The horses are at the starting line and start running in the same direction.\nHow many minutes will pass before all 4 horses meet up at the starting line again?",h:"number of laps doesn't matter, look closely at the time.", w: false,ans:"1")
        questions.append(question)
        question = Question(q: "An unknown number of people are riding a train. At the 1st station, 1/6 of the people on board get off. At the next station, 1/5 of the remaining passengers get off. Then the next stations 1/4 get off, then 1/3, and then 1/2. Then, at the final station, all passengers remaining on the train exit as well. Assuming no one got on the train during the ride, what is the fewest number of people that could have been riding on the train when it set out?",h:"1/6 got off then 1/5 then keep going like this until 1 got off so last station only 1 person got off, do you now know the answer?", w: false,ans:"6")
        questions.append(question)
        question = Question(q: "You ask your friend's \"How old are your kids now?\"\nShe replied: \"Our baby girl sarah is now 1 years old. If you multiply her age by those of her older brother John and brother Conner, the product is 25. If you add all of their ages together, you'll get a sum of 11.\"\nWhat is the age of Conner?",h:"Can John and Conner perhaps twin?", w: false,ans:"5")
        questions.append(question)
        question = Question(q: "12311_1213 what is the number in the \" _ \"",h:"The rules of this number is the month followed by date.", w: false,ans:"1")
        questions.append(question)
        question = Question(q: "You drop a tennis ball into the hole which is impossible to retrieve by hand and digging the ground is not an option since the onwer will not allow it but luckily, the ground is hard clay and you have something that can retrieve the ball.\n What is it, answer in 5 letters",h:"It's something that its state is liquid, think of something liquid that everyone has to drink.", w: false,ans:"water")
        questions.append(question)
        question = Question(q: "Three girls are talking about how many sweets they each have.\nA: B has the most!\nB: If C gave me one sweet, I'd have twice as many as A does.\nC: It'd be better if B gave me two sweets. Then we'd all have the same amount.\nHow many sweets are there in total?",h:"A minus B is 2 sweets and B minus C is 4 sweets. Assume that the result of minus is absolute", w: false,ans:"9")
        questions.append(question)
        question = Question(q: "Below are three siblings: A, B, and C.\nA: \"I have one older brother and three younger sisters.\"\nB: \"I have two older brothers and two younger sisters.\"\nC: \"I have three older brother and one younger sister.\" What's the smallest possible number of siblings there can be in the family?",h:"There are more than 5 siblings but just a bit more.", w: false,ans:"6")
        questions.append(question)
        question = Question(q: "1 male is standing in front of a child.\n2 males are standing behind a female.\n1 male and 1 female are standing behind a male.\nA female is standing behind a child.\nWhat's the minimum number of people present in the scene described?",h:"The child is male", w: false,ans:"3")
        questions.append(question)
        question = Question(q: "You’re running a race and pass the person in 2nd place. What place are you in now? answer in number only.",h:"ํYou're not at 1st place", w: false,ans:"2")
        questions.append(question)
        question = Question(q: "Some months have 30 days, and some months have 31 days. How many months has 28 days",h:"ํFebruary has 28 days, so as january", w: false,ans:"12")
        questions.append(question)
        question = Question(q: "If there are three apples and you take two away, how many apples do you have?",h:"ํquestion is how many do you have, not how many you have left.", w: false,ans:"2")
        questions.append(question)
        question = Question(q: "There is a word and six letters it contains. Take one away and twelve is what remains. What word is it?",h:"could the word be about a multiple of twelve?", w: false,ans:"dozens")
        questions.append(question)
        question = Question(q: "When you roll a die, the chances of rolling a 3 are 1/6. The chances of rolling a 3 twice in a row are 1/36, and the chances of rolling a 3 three times in a row are 1/216.\nLet's assume you roll a dice three times and get a 3 each time. Your chances of rolling a three on your next roll are 1 in how many?",h:"how many dice do you have to roll?", w: false,ans:"6")
        questions.append(question)
        question = Question(q: " What word in the English Language is always spelled incorrectly?",h:"The word is in the question.", w: false,ans:"incorrectly")
        questions.append(question)
        question = Question(q: "There are boxes of present labeled 1-60 for Tommy's birthday. Tommy ask his best friend which box belong to him. He replied \"My box is the box that its number cannot be made by adding together any combination of these: 0, 1, 2, 4, 7, 15, 31. (Using each one only once per)\"\n What is Tommy's bestfriend box number",h:"31-60 can be made with these combination so 31 is out of option. How about numbers before 31?", w: false,ans:"30")
        questions.append(question)
        question = Question(q: "While you're waiting for lift to go to the 31th floor. You starts thinking about the lift he's about to take. If the lift takes 20 seconds to go from the 1st floor to the 6th floor, how many seconds will it take for him to reach the 31th floor?",h:"from 1st floor to 6th floor, how many stops the elevator make?", w: false,ans:"120")
        questions.append(question)
        question = Question(q: "A train with a length of 100m takes 30 seconds to travel over a 400m bridge. Assuming that the train's speed is constant, how many kilometres per hour is it travelling at?",h:"travel over a bridge mean 400m plus train's length of 100m so when the train travel over a bridge.The total distance is 500m, you should be able to continue now.", w: false,ans:"60")
        questions.append(question)
        question = Question(q: "roman number equation\nI + XI = X \nWhat's the fewest number of matches that you have to move.\nNote: you can do anything with this equation",h:"You can do anything with the equation. Rotate it might help perhaps?", w: false,ans:"0")
        questions.append(question)
        question = Question(q: "\"I was riding on a double-decker bus, and the tour guide on the upper level told me that, including myself, there were 30 tourists in the lower level and 40% of lower level tourists in the upper level.\" How many people total were in the bus?",h:"Did you forget to count the bus employees?", w: false,ans:"44")
        questions.append(question)
        question = Question(q: "The following words are written on a famous mathematician's grave.\"Following the 1/6th of my life I spent as a child, I spent 1/12th of my life as a young man. Then, 1/7th of my life later, I got married. 5 years after my wedding, I was blessed with a child, but sadly, he only lived half the time I was alive before passing away. Today, four years after his death, I too will depart from this world.\" Can you crack the puzzle and answer how many years the mathematician lived?",h:"The lowest common denominator of 2, 6, 7, and 12 seems to be the same as the length of the mathematician's life expressed in years. Do the linear equation to find the answer.", w: false,ans:"84")
        questions.append(question)
        question = Question(q: "A 2.5m deep water tank has water poured into it for 8 hours, starting at 9am. The water level rises by 60cm in this time. However, it seems that water is leaking out again at night, because the next morning the water level has dropped by 20cm.If the water level continues to rise 40cm a day in this way, on what day will the tank first overflow?\nAnswer in number.",h:"At 5pm on day 1, the water level is 60cm.\nAt 9am on day 2, it's 40cm.\nAt 5pm on day 2, 1m.\nAt 9am on day 3, 80cm. Notice anything?", w: false,ans:"6")
        questions.append(question)
        question = Question(q: "I think my watch is five minutes slow, but it's actually five minutes fast.\nMy friend thinks his watch is five times fast, but it's actually five minutes slow!\nIf we try to show up at our meeting point at the same time following only the time on our watches, how many minutes earlier than my friend will I arrive?\nAlso, if I happen to arrive later than my friend, put a minus sign (-) in front of the answer.",h:"I'll arrive at our meeting point 10 minutes early. Since the conditions for my friend are the exact opposite of mine, he will arrive 10 minutes late. So then, what's the difference between our two arrivals?", w: false,ans:"20")
        questions.append(question)
        question = Question(q: "When you returned to you dorm, you discovered a strange piece of paper next to your calculator.Your roommate must have been trying to tell you something before he left.\nThe note says \"101 X 5.\"\n What could this mysterious note mean?",h:"calculate the equation and don't look at it as a number.", w: false,ans:"sos")
        questions.append(question)
        question = Question(q: "0 + 1 = dog\n6 +3 = dog\n7 + 9 = dog cat\n11 + 17 = cat cat\n0 + 2 = cat\n6 +7 = dog dog\n11 + 12 = cat dog\nIf the above is true, then what is the smallest for ? that will make the following equation true:1 + ? = dog dog dog",h:"Dog means an odd number.\nCat means an even number.\nIf you need a three-digit number made up three odd numbers, what's the smallest value possible for each digit?", w: false,ans:"110")
        questions.append(question)
        question = Question(q: "Let's replace the numbers in the equation 12+12=24. A is now one, B is now two, and C is now four, which gives up the new equations AB+AB=BC.\nNow think about another such equation, AB+B=BA, where the letters may have different values from the sample equation above.\nWhat numbers could replace the A to make this second equation true? Keep in mind that A and B are different numbers.",h:"If you added B and B together, the digit in the ones place (the last digit) of the resulting sum would equal A.\nSince no two single digit numbers can add up to more than 18, you know the number in the tens place of the sum of B+B must be one. The only other value that influences the tens place in the solution is the A in AB+B.\nTherefore, A+1 must equal B.", w: false,ans:"8")
        questions.append(question)
        question = Question(q: "Four people are talking at the end of a very enjoyable evening party. Comparing watches, they realize that none of them have the correct time.\nA: \"My watch is always 20 minutes slow!\"\nB: \"This old thing is 10 minutes slow.\n\"C: \"I set mine 5 minutes fast!\"\n.D: \"Mine is 10 minutes fast.\"\nWhat time is it? answer in X:XX format",h:"A's watch is 20 minutes slow.\nA's watch reads 1:05.\nSo what's the correct time?", w: false,ans:"1:25")
        questions.append(question)
        question = Question(q: "A rope ladder hangs from the side of a boat floating in the ocean, with the water coming up to the 7th rung. The ocean is calm, with almost no waves.\nIf the water rises by 40cm every hour, and the rungs of the ladder are 30cm apart, which rung will the water level be at in three hours? answer in number only",h:"The water rise but also the boat.", w: false,ans:"7")
        questions.append(question)
        question = Question(q: "The travelers shown below are an hour away from their destination. 14 people are divided into two cars (7 people maximum per car), but one of the cars just broke down, leaving only one vehicle for the rest of the trip.\nUsing just the one car to drive back and forth, how many hours will it take to get everyone to the destination?",h:"When picking up the second round of passengers, can you load up all 7 people who are waiting? Don't forget about the driver", w: false,ans:"5")
        questions.append(question)
        question = Question(q: "How many times does the number nine appear within whole numbers between one and 100?",h:"Just count, maybe a paper and a pen might help.", w: false,ans:"20")
        questions.append(question)
        question = Question(q: "A has always been terrible at math. He's asked to multiply a certain number by 9, then add 7 but instead he multiplies by 7 and adds 9. When he tries to do the problem correctly, he ends up getting the same answer as when he made the mistake the first time. It's all an accident, but what is that \"certain number\" ",h:"Try creating an equation.\nThere's only one answer.", w: false,ans:"1")
        questions.append(question)
        question = Question(q: "A man walks into a bar and order \"H I J K L M N O\".\nWhat on earth is his order?",h:"H all the way to O, is it a formula of some kind?", w: false,ans:"water")
        questions.append(question)
        question = Question(q: "There's 60 people in football club, 60 people in basketball club and 30 people in both football club and basketball club.\n How many people are there that is only in football club or basketball club.",h:"try to minus people who is in both club", w: false,ans:"90")
        questions.append(question)
        question = Question(q: "A is an astronaut and he visits new planet.This planet has new species call \"fishian\".\nWhen he counts them the result is 600 fishian so the question is\nHow many aliens are there on that planet.",h:"How many alien on \"that planet\" you have to think in different perspective.", w: false,ans:"1")
        questions.append(question)
    }
    func getQuestions() -> [Question] {
        var temp:[Question] = []
        if let data = UserDefaults.standard.data(forKey: "questions"),
            let qList = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Question] {
              temp = qList
        } else {
            print("There is an issue")
        }
        for i in 0..<temp.count {
            if (temp[i].won != questions[i].won ) {
                questions[i].won = temp[i].won
            }
        }
        return questions
    }
    }
