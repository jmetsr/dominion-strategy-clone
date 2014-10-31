# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "Theory", session_token: "2hVVud1oWa-vMnc0oIc7ZA",
password_digest: BCrypt::Password.create("Theory"), admin: true, id: 31)
User.create(username: "rrenaud", session_token: "2hVVud1oja-vMnc0oIc7ZA",
password_digest: BCrypt::Password.create("rrenaud"), admin: true, id: 32)
User.create(username: "Awaclus", session_token: "2hVVud1oja-vMnc7oIc7ZA",
password_digest: BCrypt::Password.create("Awaclus"), admin: false, id: 33)
User.create(username: "Sparafucile", session_token: "2iVVud1oja-vMnc7oIc7ZA",
password_digest: BCrypt::Password.create("Sparafucile"), admin: false, id: 34)
Board.create(title: "News and Announcements", admin_id: 31, id: 31)
Board.create(title: "Feedback", admin_id: 31, id: 32)
Board.create(title: "Rules Questions", admin_id: 31, id: 33)
Board.create(title: "Simulation", admin_id: 31, id: 36)
Topic.create(title: "Sorry about the outage!", user_id: 31, body: "Our provider had a power outage.  Then when the forum tried to reboot itself it tried to do so using a cache file that was somehow corrupted.
Or, in plain English, after blacking out from having drank too much, the forum came home and repeatedly tried to get in using its backup key that it hides under the welcome mat (which had gotten deformed) instead of the key it normally carries around (which was perfectly fine).",
board_id: 31, id: 40)
Reply.create(topic_id: 40, user_id: 32, content: "Never do that again.")
Reply.create(topic_id: 40, user_id: 33, content: "At least the forum didn't take a drunken trip to Waffle House.")
Reply.create(topic_id: 40, user_id: 32, content: "The outage made you moody didn't it?")
Topic.create(title: "Post counts", user_id: 31, body: "...seem somewhat scummy today. But I'm sure it's just a temporary one day thing.",
board_id: 31)
Topic.create(title: "The forums might go down for a little while today", user_id: 32, body: "I am taking the free Linode memory upgrade on the server that runs the forum.  Linode says this should take about 20 minutes after it starts.
", board_id: 31, id: 41)
Reply.create(topic_id: 41, user_id: 31, content: "We're guessing it will happen around 5:00-5:30PM EDT but it is unclear when exactly it will be.")
Reply.create(topic_id: 41, user_id: 33, content: "*insert dramatic music cue*")

Topic.create(title: "Miscellaneous errors", user_id: 31, body: "If you spot some kind of error or mistake that is probably too small to make its own thread, feel free to post it here!", board_id: 32, id: 44)
Reply.create(topic_id: 44, user_id: 31, content: 'For example, Tables pointed out that on the main site, card texts with "Gain a Spoils" was missing the "from the spoils pile" clause.' )
Reply.create(topic_id: 44, user_id: 32, content: 'For example, Tables pointed out that scott_pilgrim pointed out that on the main site, card texts with "Gain a Spoils" was missing the "from the spoils pile" clause.')

Topic.create(title: "Respect", user_id: 33, body: "An insignificant suggestion: Rename respect to VP? It works for Innovation, too.", board_id: 32, id: 45)
Reply.create(topic_id: 45, user_id: 31, content: 'But then youd also need to change lots of peoples titles to "KC-Monument", "Bishop-Fortress" or "Goons".')
Reply.create(topic_id: 45, user_id: 32, content: '
Re: "Respect"
Sorry!  The respect plugin is just that -- a plugin -- and I have remarkably little control over it.  This is one of those things I have no control over.')
Topic.create(title: "Need help with a simulation", body:"I want to simulate Hermit-Feodum BM

Strategy:

Get 2 Hermits to trash your estates and Feoda and gain Silvers (3rd one when your deck is more than 20 cards)
and gain Hermit with Hermit whenever you only have a < $3 hand (and turn the played hermit into a madman)

Buy Feodum when you have more than 9 silver or when you have a Hermit coming up before the next reshuffle (with at least 80% chance)
( hermits left in draw pile >0 && cards left in drawpile [mod 5] / cards left in draw pile <= 0,2)

-Trash Feodum over Estate, but only trash Feodum if you trashed 2 or less Feoda so far.

-Buy Province over Feodum when you have less than 18 Silver.

-Buy silver on all other turns .

My knowledge in coding for the simulator isn't enough to do that.
Can you help me?)", board_id: 36, user_id: 34)
Topic.create(title: "Kings courting a card that gets trashed", body: "o basically I'm wondering how do you know which cards you can kings court or procession or that style when it says trash this card.

I know things like pillage will get played all 3 times. Do things like kings courting a knight that hits their knight after the first 2 cards still keep going? I think madman can't get doubled? Or maybe I'm wrong there also.

On the note of madman it says return it to supply. Does that happen immediatly or does madmen count for things like peddler still in lowering the cost.",
board_id: 33, user_id: 33)
Topic.create(title: "Does Prince remain set aside?", body: "If I Prince an Action card, and at the end of the game, I have 18 cards in my deck, not counting Prince + the card set aside. Are gardens worth 1VP or 2VP?", board_id: 33, user_id: 31)
Topic.create(title: "Wandering Minstrel, draw/discard mechanics", body: "Hello everyone, I play alot of Dominion with my office mate and today we had a disagreement on a draw/discard mechanics and we need a third person opinion to resolve it. So, here is the hypothetical situation: small deck with alot of Wandering Minstrels. My office mate believes that the cards discarded by 'not an action' mechanic of the Wandering Minstrel should be kept in a 'separate' discard pile and you should not be able to get to them during the same turn even if you have enough +card. I believe that the cards discarded should go into the normal discard pile and if you have enough draw power there is nothing stopping you from getting them.",
board_id: 33, user_id: 34)
