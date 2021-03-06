
VAR speaker = "null"
VAR FinalQuest = 0
VAR SpeakMarks = 0
VAR SpeakMike = 0
VAR SpeakMarv = 0
VAR HelpBarry = 0
VAR StonksComplete = 0
VAR FlapComplete = 0
VAR WaterComplete = 0
VAR FlapDisguise = 0
VAR booze = 0
VAR QueenTalk = 0
VAR deitzquest = ""
VAR mafiaquest = 0
VAR painmafio = 0
VAR fabmafio = 0
VAR stonckmafio = 0
VAR mafiaquesthandler =0
VAR economyrestarted = 0
VAR mafiadoor =0
VAR flapdoor = 0
VAR dondoor = 0
VAR maindoor =0
VAR sweat =0
VAR featheractivate =0
VAR sweatactivate =0
VAR visitstonk = 0
VAR visitflap = 0
VAR visitsquat = 0
VAR firstactivate = 0
LIST inventory = feather, dress

LIST machineparts = Atomic_Flange, Enriched_Plutonium_Gasket, Flapper_Seal, Temporal_Fill_Valve, Time_Tommy_Gun

->start

===start===
{
-WaterComplete ==1 && FlapComplete ==1:
~mafiadoor =1
}
+[End Conversation]->NoHUD


==NoHUD==
~ speaker = "null"
+[BigBarry]->BigBarry
+[Stonk1]->Stonk1
+[Stonk2]->Stonk2
+[Stonk3]->Stonk3
+[Stonk4]->Stonk4
+[Stonk5]->Stonk5
+[Stonk6]->Stonk6
+[Stonk7]->Stonk7
+[StonkMarks]->StonkMarks
+[StonkMichael]->StonkMichael
+[StonkMarv]->StonkMarv
+[StonkGangster]->StonkGangster
+[QueenQuinn]->QueenQuinn
+[Flap1]->Flap1
+[Flap2]->Flap2
+[Flap3]->Flap3
+[Flap4]->Flap4
+[Flap5]->Flap5
+[Flap6]->Flap6
+[Flap7]->Flap7
+[FlapGangster]->FlapGangster
+[FlapGuard]->FlapGuard
+[Brandy]->Brandy
+[SquatterKing]->SquatterKing
+[Squat1]->Squat1
+[Squat2]->Squat2
+[Squat3]->Squat3
+[Squat4]->Squat4
+[Squat5]->Squat5
+[Squat6]->Squat6
+[Squat7]->Squat7
+[Squat8]->Squat8
+[Squat9]->Squat9
+[TheRat]->TheRat
+[DoorGuard1]->DoorGuard1
+[DoorGuard2]->DoorGuard2
+[CapoCastiglioni]->Castiglioni
+[Mafio1]->Mafio1
+[Mafio2]->Mafio2
+[Mafio3]->Mafio3
+[Mafio4]->Mafio4
+[Mafio5]->Mafio5
+[TheDon]->ThatBoy
+[FabMafio]->FabMafio
+[PainMafio]->PainMafio
+[StonkMafio]->StonkMafio
+[TimeMachine]->TimeMachine
+[FullGameIntro]->FullGameIntro
+[TheButton]->TheButton

End Conversation #noconvo

==BigBarry==
~ speaker = "Big Barry"
{ 
-HelpBarry == 0:
->InitConvo
-HelpBarry ==1 && not(SpeakMarks ==1 && SpeakMike ==1 && SpeakMarv ==1):
->ReConvo
-HelpBarry ==1 && (SpeakMarks ==1 && SpeakMike ==1 && SpeakMarv ==1 && not StonksComplete ==1):
->JobComplete
-StonksComplete ==1:
->Thanks
}

=Thanks
Have unemployment benefits been invented yet? 
{
-FinalQuest ==1:
+[Hey, the Don sent me. He says you know how to, uh, restart the economy?]->Economy
}
+[End Conversation]->NoHUD

=Economy
~FinalQuest =2
What?! The DON sent you? Oh, no... I always knew this day would come...

I'm sorry to say that I don't actually have any idea how to work the economy. My predecessor, Doctor Dietz, had a better idea, but he was always kinda crazy. I heard he's been trying to eat the Flappers' feathers.
+[Well, economies are a little too complicated for me - I'm just a simple time traveler. But I can go talk to Doctor Dietz.]->Nice

=Nice
Wow, really? I'd really appreciate that. I'd say you're going to save my job, but I think I'm fired anyway. But getting things working should make the Don less likely to run me over with a Model T, so that's nice. 

Oh, and when you see the Doctor, don't mention me. I think he's still mad that I told everyone he eats inanimate objects. 
->start

=JobComplete
~machineparts += Enriched_Plutonium_Gasket
What, you actually managed to get the others to help? Wow, that's the best news I've had since I learned I didn't have to do my job any more. I can't really pay you - guess you can take this. It's a piece of junk that came off the thing that destroyed the stonk exchange
~StonksComplete = 1

+[Thanks. Medium Michael's quitting. He said he wants to fish.]->Mike

=Mike
~maindoor =1
Mike's quitting? Nuts, he's our best fisherman. Oh, well, I guess we're all going to have to learn to fend for ourselves anyway, what with the economy crashing and all. Let me get the door for you.

(Big Barry snaps his fingers)

The door's unlocked. Careful, though - things have gotten pretty weird deeper in the building. I mean REAL weird. You'll see what I mean.
->start

=ReConvo
Have you convinced the other brokers to clean yet? ...look, I know the answer is no. I already know. Please just talk to them. I can't stop crying.
->start

=InitConvo
Oh, hi, I didn't see you there, seeing how you're... small. I'm sorry if I don't sound enthused, it's been a hard day.
+[What's the matter?]->Exposit1
+[Are you a Modernist? Because you're boring the crap out of me.]->ScrewYou

=Exposit1
Somebody crashed the stonk exchange and caused the Great Depression. Well, no use crying over spilled milk and all that, but have you seen this place? It's a mess. Worse, all of the other brokers seem to be quitting. I need to get this place cleaned up before my daughter gets here and thinks I'm a failure!

The deeper parts of the building are off-limits until I can get the others under control.
+[All right, I'll see what I can do.]->DialogComplete
+[You should just accept that you're a failure. Failure.]->ScrewYou


=ScrewYou
(Barry sheds a single tear)
->start

=DialogComplete
You can try, but I don't know if you'll have much luck. All of the Medium brokers are very strong-willed - I gave them too much power! 

Good luck.
~ HelpBarry =1
->start



==Stonk1==
~ speaker = "Stonk Broker"
I'd be upset that you just caused the Great Depression, but I'm too busy not working to care. Let me know if you want to go fishing with us.
->start

==Stonk2==
~ speaker = "Stonk Broker"
{
-visitstonk !=1:
~ booze = booze + 1
~ visitstonk = 1
If there's one thing I love doing, it's not working. Thanks for crashing the economy! Have a bottle of scotch!
-else:
What, was the one bottle not good enough? You wanna put up your dukes, pal? It was FREE BOOZE. You time travelers are all the same!
}

->start

==Stonk3==
~ speaker = "Stonk Broker"
What? Huh? You want to speak to the boss? What? 

Oh, sorry, I had my earplugs in. Yeah Barry's kinda hard to miss, seeing how he's approximately twenty feet tall. What? You want to chat with that nerd? Ha! If you do, tell him he's balled up real good! Ha! Ha!
->start

==Stonk4==
~ speaker = "Stonk Broker"
Huh, haven't seen you before. You a new employee? Word of advice: don't talk to Marv, guy's crazy. Keeps talking about some kind of "future" where the world's on fire and everyone's mad all the time. 

What a load of balogna. Everybody knows that the future's gonna have flying Model T's and men'll be on Venus!
->start

==Stonk5==
~ speaker = "Stonk Broker"
Marks was singing the Russian national anthem earlier, so I called the police. Nobody came, though, so I guess they all quit when they learned they weren't being paid. I would, too. Hey, wait a second...
->start

==Stonk6==
~ speaker = "Stonk Broker"
Who cares about work? It's the year of the fish, baby! What are they gonna do, fire me?
->start

==Stonk7==
~ speaker = "Stonk Broker"
fish time fish time fish time fish time FISH TIME! 

don't talk to me unless you're a fish! don't look at me unless you're a fish! get out of my way! get out! 
->start

==StonkGangster==
~ speaker = "Powerful Stonck Broker"
Ahhh hooey, just snapped another pen in half by holding it too hard. You ever feel like you're not the right fit for your job?
{
-mafiaquest ==1 && stonckmafio !=1:
+[Ever think about a change of career path?]->Mafia
}
+[End Conversation]->NoHUD

=Mafia
~stonckmafio = 1
Well, every so often. You're saying you want me to join the mafios? Well, I suppose it's probably better than going fishing with all the other stonk brokers, seeing how I can't swim.

Suppose I'll go visit the Capo.
->start

==StonkMarks==
~ speaker = "Medium Marks"
{ 
-HelpBarry ==0:
->NoConvo
-SpeakMarks == 0 && HelpBarry ==1:
->InitConvo
-SpeakMarks == 1:
->ReConvo
}

=NoConvo
(He seems to think he's speaking Russian, though most of it sounds like accented gibberish. He's not paying you any mind)
->start

=ReConvo
all right i clean i clean
->start

=InitConvo
Hello, Capitalist pig! Revolution finally at hand! No more must we bend to the whims of the oppressor! The shattered yoke of the economy has finally turned us free!
+[That's, uh, great. You wanna help clean up this mess?]->No
+[Oh, man, you've been eating lead paint, huh.]->No

=No
You shall never convince me to clean! I shall never return to my role as a cog in the Capitalist machine!
+[I mean, the economy already crashed. If anything, cleaning up with your fellow workers would help build a communal spirit.]->DialogComplete
+[Let's keep your "class struggle" far, far away from me.]->ScrewYou

=DialogComplete
Hey, I hadn't thought of that - pretty good point you make. All right - first we clean, then we overthrow... whatever there is left to overthrow!
~ SpeakMarks = 1
->start

=ScrewYou
What are you - oh, that's a joke about the Manifesto. Hey, shut up, it's a good book. It's my FAVORITE book. I don't... I don't want to talk to you any more!

(Medium Marks looks on the verge of tears)
->start


==StonkMichael==
~ speaker = "Medium Michael"
{ 
-HelpBarry ==0:
->NoConvo
-SpeakMike == 0 && HelpBarry ==1:
->InitConvo
-SpeakMike == 1:
->ReConvo
}

=NoConvo
no no no don't talk to me don't talk to me none of this is my fault I don't know what you're talking about!

(He clamps his hands over his ears. Something tells you he doesn't want to chat)
->start

=ReConvo
Wow, I can't wait to leave and start fishing - I mean, uh, start... feeling remorse, for what I've done. 

Look, don't you have some place to be?
->start

=InitConvo
All right, look. I saw you talking to Barry. I know you're onto me. It's time that I come clean.
+[Yeah, exactly, this place is a mess.]->Joke
+[What are you talking about?]->exposit

=Joke
Oh, I see - you mean the chaos I've caused with my lackadaisical attitude has resulted in the stonk floor becoming a metaphorical mess. Cruel, but I suppose you're right to judge me. Hate me if you will, but please, let me explain.
+[Actually, I just want you to h-]->exposit

=No
All right, sure - but on one condition. Tell the boss man I'm quitting. I don't DESERVE to work in a place where I've caused so much trouble!
+[Sure, so long as you clean. Though it sounds like you're using this as an excuse to quit so you can just fish full-time.]->DialogComplete
+[I hate fishermen. Quit on your own.]->ScrewYou

=exposit
I caused all this. Not the stonk market crash, that was some jerkass in a time machine. But this mass walkout of brokers - all of these people who want to fish? Yeah, it was my idea. 

Fishing's always been my one true passion, so when the market crashed I thought it was my opportunity. But now I see that my actions have consequences - I've caused so much trouble for everyone...
+[Uh, yeah, I guess. How about you help clean up, then?]->No

=DialogComplete
Ha ha, what? Nooo. No. You're real funny. You should go into stand-up. Ha.

...uh yeah, just tell Barry I'm quitting and we'll be square.
~ SpeakMike = 1
->start

=ScrewYou
What, like all fishermen? That's a pretty broad generalization. Come talk to me again when you learn to be a little less JUDGMENTAL, pal.
->start


==StonkMarv==
~ speaker = "Medium Marv"
{ 
-HelpBarry ==0:
->NoConvo
-SpeakMarv == 0 && HelpBarry ==1:
->InitConvo
-SpeakMarv == 1:
->ReConvo
}

=NoConvo
(He's staring into space. He doesn't seem to react to anything you do or say)
->start

=ReConvo
Uh... hm... Zip? Horsefeathers? No, I don't think either of those mean anything. Hm...
{
-deitzquest == "start" && sweat!=1:
+[Hey, Marv? Can I have some of your sweat?]->MarvSweat
}
->start

=MarvSweat
~sweat = 1
(Marv thinks for a moment)

All right.

(He flexes every muscle in his body, all at once, and a single drop of sweat rolls off his brow. You catch it in your hands)

Be sure not to drop it, pal! I only got so much sweat!
->start

=InitConvo
What? Woah, it's you! Hey, I saw you talking to Barry. He probably wants me to clean. Say - is that a time machine?
+[Are you always this... energetic?]->No
+[Wait, go back, I missed what you said.]->No

=No
You can't fool me, I know that's a time machine! L

isten - I'll help you clean up but you have to take me back to the future with you. Deal? 

Wowee, I can't wait to see all the neat tech the future will have! I hope flagpole sitting has finally become an Olympic Sport!
+[(Lie) Yeah, I'll totally bring you to the future. Time paradox? More like MIME paradox, am I right?]->DialogComplete
+[Did you just say "wowee"? Maybe it's better I pretend like I don't know you.]->ScrewYou

=DialogComplete
Wow! Thanks, pal! You're the cat's meow! You're the bee's knees! Wow! You're a darb! Wow! A real egg! Gee! Hip to the jive! Yow! Yeah, you're real hot stuff! You're, uh, nifty! A real... big shot! Um... you're uh... er...

...Look, can you just walk away? I gotta think up some more slang phrases.
~ SpeakMarv = 1
->start

=ScrewYou
Wowee, that's harsh!
->start

==QueenQuinn
~ speaker = "Queen Quinn"
{
-QueenTalk ==0:
->IntroText
-QueenTalk ==1 && booze ==0:
->Trailoff
-QueenTalk ==1 && booze <3 && booze >0:
->ReturnTalk2
-booze >2 && FlapComplete !=1:
->ReturnTalk3
-FlapComplete ==1:
->QuestDoneTalk
}

=QuestDoneTalk
Hello again, honey. Looking resplendent, as always. Hmmm hm hmmm....
->start

=ReturnTalk2
The booze collection is coming along great, honey. Just a few more tumblers and I'll feel as easy as I look. But not like that.

I'll be waiting... 
->start

=ReturnTalk3
~FlapComplete = 1
~machineparts += Flapper_Seal
Ahh, you're finally back. It's been quite the time in your absence - apparently news broke that I cared too much about getting my scotch, so I lost my throne.

Funnily enough, it was Brandy who was elected Queen immediately thereafter - and she lost the throne just as quickly because of how uptight she was about her drinks. Quite funny. Should require a lot of paperwork. Wonderful, isn't it?
+[Uh... yes. How wonderful.]->QueenComplete

=QueenComplete
Yes, yes, don't worry, honey, I know you're anxious to get your part back. Here. And I've thrown in a little something extra - I put in a good word with the mafios for you, so at least one of their goons should be gone from the back.

What? Was that not what you thought I meant by "a little something extra?" You're hilarious, honey!
+[Take care, I guess.]->Sendoff
+[So, if Brandy's been impeached, who's Queen now?]->QueenExposit

=Sendoff
Thanks for all your help, honey. Don't hesitate to come on back if you need anything from me in the future!
->start


=QueenExposit
Oh, well, I've found that it's much easier to relax since I've lost my throne. Seeing how the other gals let me keep my crown, I think I'll be reelected soon, and this whole cycle will start over.
+[Sounds a little... nightmarish.]->Sendoff2

=Sendoff2
Yes.

Thanks for all your help. Don't hesitate to come on back if you need anything from me in the future.
->start


=IntroText
Hmmm hmmm hmmm.... oh! You look smashing, honey. Hmm hmmm....

+[Uh... hi. I'm looking for parts for... a machine.]->MachineTalk
+[Hi miss. You, uh, don't look so bad yourself?]->FLIRT

=MachineTalk
A machine? I hope you're not taking me for a mechanic! Hahaha....

+[No, seriously, I need machine parts. Do you have any?]->Trailoff

=FLIRT
Oh, my oh my, are you flirting with me? Well, you certainly do look sumptuous. Wouldn't mind taking a nibble out of you. Arf! Hehe.
+[uh]->embarrass
+[huh]->embarrass
+[hummuna]->embarrass

=embarrass
Oh, aren't you precious! Don't worry, honey, I was joking... well, mostly. What can I do for you?
+[I'm sort of a time traveler. My machine broke down on the stonk floor and-]->Continue

=Continue
Oh, say no more, honey. This crystal on my crown rolled into The Party a few hours ago - I think it belongs to you. I'd love to give it back - but I wonder if you might be able to help me out with a little something first?
+[I guess I've got all the time in the world! Ha! Get it? Time?]->QueenQuest
+[Hold on, you admitted that that crystal is mine. Just give it back now.]->PreTrailoff

=PreTrailoff
Hmm? Did you say something?

(Queen Quinn looks close to losing interest in the conversation)
+[You know what, never mind. What do you need done?]->QueenQuest
+[I said "Give me back my machine part before I throw a temper tantrum."]->Trailoff


=QueenQuest
Grand, honey, absolutely grand. So, the Queen of The Party - yours truly - needs to be the swingin'-est gal in the whole ball - but it's so hard to relax without a glass of something strong and cool. 

Brandy's cut me off - she's the worst, but you have to love her - if you could get me three tumblers of scotch or bourbon, I'd be happy to turn over your part - and perhaps throw in a little something extra, too? What do you say?
+[hummuna]->Confirm
+[hhh]->Confirm

=Confirm
~ QueenTalk = 1
Lovely, honey. You might want to ask around all of the rooms - a lot of people have bottles squirreled away, Prohibition or no. 

Hurry back. I'll be waiting...
->start

->start
=Trailoff
(Whatever you said is lost on her - she's humming to herself and swaying off-time. Might need to come back later)
->start


==Flap1
~ speaker = "Flapper"
Dance, baby! Or don't! There aren't any rules in The Party! Except that you must be F A B U L O U S! 

I'm serious, it's in Chapter 2, Section 13, Statute B12. Look it up, baby! Someone's provided you with the bylaws, I'm sure?
->start

==Flap2
~ speaker = "Flapper"
Have you submitted your paperwork for those shoes? I wouldn't let Queen Quinn see you if not! She might not seem like she minds, but she does! I think. I mean, even if she does mind she's not supposed to show it.

Look, your shoes are ugly. Ok? Get some better ones.
->start

==Flap3
~ speaker = "Flapper"
Does "affidavit" have one or two "t"s?
->start

==Flap4
~ speaker = "Flapper"
Left, two, three, and turn, and right, two three... four? Two? Damn it. Er, three, four, backstep, two, three, grapevine...

Sorry, rehearsing for my court appearance later today. I wore the wrong kind of feather and it's been a whole big debacle.
->start

==Flap5
~ speaker = "Flapper"
{
-visitflap !=1:
~ booze = booze + 1
~ visitflap = 1
I winsh I could shtop drinking, but being shober ishn't how you relacksh. I can't feel my toesh. Bottomsh up, hun! *hic* Here, have one! Meansh I don't hafta drink sho many!
-else:
(*Hic*)
}
->start

==Flap6
~ speaker = "Flapper"
Next election will be some point in the next few weeks, or maybe the next few hours! The devil may care! 

Actually, I'm in charge of managing the election, so I care. The fact that it could happen at any moment prevents me from sleeping. I care a lot. Don't tell anyone, I'll be exiled. Goodness, isn't the price of fabulousness high?
->start

==Flap7
~ speaker = "Flapper"
Hey, keep your voice down. Didn't you know that Argenta got exiled to the Waterfront for having a dress 3/4ths of an inch too long? Don't get worked up - it'll make you look like you care. Watch it.
->start

==FlapGangster
~ speaker = "Fabulous Flapper"
I'm a little new to The Party. I like it, but it's kinda weird. Most of the girls cry when they think no one's looking, and I think some lady was sent out earlier - I haven't seen her since. 

But I do feel pretty fashionable... 
{
-mafiaquest ==1 && fabmafio !=1:
+[Ever think about a change of scene?]->Mafia
}
+[End Conversation]->NoHUD

=Mafia
~fabmafio = 1
Oh, I suppose every girl wants to go out and see the world. I'm at that flighty age, you know. Very well - I'll go visit the Capo. I've heard he's quite handsome!
->start

==FlapGuard
~ speaker = "Flapper Guard"
{
-inventory !=dress:
->FlapMad
-else:
->FlapApprove
}
=FlapMad
My word, darling, you're much too drab. I don't foresee you EVER being invited to The Party. Maybe the Waterfront would have you! Ha!
->start

=FlapApprove
~flapdoor = 1
Darling, your dress is GORGEOUS! Goodness, why aren't you inside already? Go on, go on!
->start

==Brandy
~ speaker = "Brandy"
{
-booze == 0:
->IntroText
-booze > 0 && FlapComplete !=1:
->BrandyMad
-FlapComplete ==1 && booze >2:
->BrandyFinal
}

=BrandyFinal
Perhaps there's a lesson to be learned here: if you lose, it's because the others are plotting against you.

Shouldn't you be busy leaving me alone?
{
-deitzquest == "start":
+[Hey, can I have the feather? Like the one on your head?]->FeatherHandler
}
+[End Conversation]->NoHUD

=BrandyMad
Hang on a moment. Is that... do you have alcohol on you? Is that scotch? Bourbon?

(She sniffs deeply)

Give it to me. You're not allowed to have that! Don't you know that it's prohibition times?! Eighteenth Amendment, jackass!!!
{
-deitzquest == "start":
+[Hey, can I have the feather? Like the one on your head?]->FeatherHandler
}
+[Why don't you call the police, lady? Oh wait, they all quit!]->Police
+[Sorry, I've gotta bring this back to Queen Quinn. If she has any extra, you can have that.]->Queen
+[I don't know what you're talking about.]->Police

=Police
(Brandy lets out a low, deep hiss, sounding more like a snake than a person. It might be better to keep your distance from her for a while, unless you want to get bit)
->start

=Queen
I should have known it would be her! She'd do anything to hold on to her feathered crown! Well she won't, if I have anything to say about it! You tell her to watch herself!
->start


=QueenImport
Am I supposed to care? It doesn't matter who wants my substances-they're MY substances to give out! Queen or not, she gains no special service if I don't say so. 

You could take a number - but by the time I see to you, you'll be BACK IN THE TWENTY-FIRST CENTURY!!!
->start

=IntroText
Oh, goodie. Another wet-behind-the-ears time traveler floats in from off the street. Think I'm going to look past your gauche 21st-century getup just because you've got some high heels and a sequined dress? Honey, you've got a thing or two to learn about fashion.
{
-QueenTalk == 1:
+[We can fight later - Right now I need booze for Queen Quinn.]->QueenImport
}
{
-deitzquest == "start":
+[Hey, can I have the feather? Like the one on your head?]->FeatherHandler
}
+[Not too friendly, are you?]->Brandy2
+[You're dead in my time.]->BrandyLeave

=FeatherHandler
{
-FlapComplete !=1:
(Brandy's eyes swell to the size of dinner plates. Her teeth grind into one another so fiercly you can see her jaw trembling and hear the sound in the air. An extremely visceral image of her wrapping her fingers around your throat and throttling the life out of you plays in your head)

(That seems like a no. Maybe you should come back when she's a little less... violent)
->start
-FlapComplete ==1 && inventory !=feather:
~inventory += feather
Sure, whatever. Just leave me alone. 

(She takes the feather from her head and shoves it into your hands)
->start
-FlapComplete ==1 && inventory ==feather:
(Brandy fixes you with a halfhearted glare, then looks away)
->start
}

=Brandy2
I don't HAVE to be friendly, sweetheart - I control all of the booze coming in or out of The Party! 
->start

=BrandyLeave
If the 21st century is churning out people as DOWDY you, I don't think I'd WANT to be alive!
->start

==SquatterKing
~ speaker = "Doctor Dietz"
{
-deitzquest == "" && WaterComplete !=1:
->IntroDialog
-deitzquest == "" && WaterComplete ==1:
->DeitzDone
-deitzquest == "start":
->ReturnHandler
}

=DeitzDone
The flavor is like no other, the texture - oh, uh, I mean, my research is coming along splendidly. Something you need?

{
-FinalQuest ==2:
+[Hey, I talked to Big Barry and he said you can help us restart the economy. He says hi, by the way.]->Economy
}
+[End Conversation]->NoHUD

=Economy
~FinalQuest = 3
Oh, the Don's finally come knocking, eh? I'm surprised it's taken him this long. Maybe he was hoping Communism would take over.

...don't tell him I said that, I don't want to get whacked. 
+[I won't if you help me fix the economy.]->Economy2

=Economy2
The economy isn't broken, you just need to turn it off and turn it on again. 

+[Are you kidding me?]->Nojoke
+[No, seriously, is this a joke?]->Nojoke

=Nojoke
I'm quite serious. There's a button on the back. Just press it twice and you should be good to go.

If you don't believe me, go give it a try.

+[All right, I guess.]->NoHUD
+[If this is so easy, why hasn't someone already done it?]->Shrug

=Shrug
Think about it, time traveler. Have you seen anyone walking around? How are we going to press any buttons if we can't move?
+[I really don't want to think about this any harder than I have to. Bye.]->NoHUD

=ReturnHandler
You've returned, I see.
{
-inventory !=feather:
I still need the feather of a particularly embittered Flapper. Be warned - it may take some doing.
}
{
-sweat !=1:
I still need the sweat of a particularly jumpy stonk broker. You may need to use your hands to catch it. Vials aren't cheap.
}
{
-inventory == feather && featheractivate !=1:
+[Got your feather.]->ReturnHandler2
}
{
-sweat==1 && sweatactivate !=1:
+[Got your sweat. Eugh, just take it.]->ReturnHandler3
}
+[End Conversation]->NoHUD

=ReturnHandler2
~featheractivate = 1
Excellent. Let me see what I still need...
{
-sweatactivate !=1:
Sweat still. Go find me some.
->start
-else:
Excellent! You've found all the ingredients for my soup.

+[Your soup?]->GotItAll
}

=ReturnHandler3
~sweatactivate = 1
Excellent. Let me see what I still need...
{
-featheractivate !=1:
I still require a Flapper feather.
->start
-else:
Excellent! You've found all the ingredients for my soup.

+[Your soup?]->GotItAll
}

=GotItAll
~deitzquest = ""
~WaterComplete = 1
~machineparts +=Temporal_Fill_Valve
Er, my... cure for poverty. Yes. I've supplied you with a part for your machine for your help - and I've also put in a good word with the local mafios. You should see one less roadblock on your way deeper into the stonk exchange building.

Now please excuse me, I am most certainly not going to eat dinner.
->start


=IntroDialog
Hm, your garb is... interesting. You seem different. Perhaps you can assist me.

I am Doctor Dietz. I seek to cure poverty. Will you help?
+[Oh good, I was thinking things around here seemed a little too sane.]->MockMe
+[Help you... cure poverty.]->MockMe

=MockMe
Yes, ha ha ha, jokes all around. Hilarious. But the problem is that I have a part for a certain machine that recently crashed upon the stonk floor, and I know that said machine shall not work correctly without this part.

So. I think it would do you well to assist me.
+[All right, all right, no need to get testy. What is it you want?]->Explanation
+[If you think a crackpot in a sewer pipe is going to bully me, you need your head examined.]->ShotDown

=Explanation
As I mentioned, I am making a pill to cure poverty, yes? But my resources are... limited, as you may perhaps have observed. I need two things:

-The body of a stonk broker, to boil
-A Flapper feather

That is all. Run along.
+[Hang on - you need to boil a person?]->BoilThem
+[What exactly do you intend to do with a feather?]->Feathers

=BoilThem
Well, I need a stonk broker's essence - it fortifies the pill, you understand.

What's with that look? Oh, fine, fine, you bleeding heart. Just get some sweat from one if you're really too cowardly to boil one alive. Try to find one who is particularly jumpy, he'll have more concentrated sweat.
+[What about the feather?]->Feathers2

=Feathers
A bit of an... odd situation, that. The Flappers sometimes keep some rather interesting types of feathers, feathers I've heard can have unique economic properties. 

It dips a little into alchemy, but I assure you that there's more science to this than it sounds.
+[What about the stonk broker?]->BoilThem2

=BoilThem2
Well, I need a stonk broker's essence - it fortifies the pill, you understand.

What's with that look? Oh, fine, fine, you bleeding heart. Just get some sweat from one if you're really too cowardly to boil one alive. Try to find one who is particularly jumpy, he'll have more concentrated sweat.
+[All right, I'll get you your feather and sweat.]->FinalConfirm

=Feathers2
A bit of an... odd situation, that. The Flappers sometimes keep some rather interesting types of feathers, feathers I've heard can have unique economic properties. 

It dips a little into alchemy, but I assure you that there's more science to this than it sounds.
+[Ooookay, if you say so. I'll find your weird items.]->FinalConfirm

=FinalConfirm2
~deitzquest = "start"
Good. Report back to me once you've collected some sweat. Just use your hands. 

Yes, I know. 

Run along, I have work to do
->start

=FinalConfirm
Beware the Flappers - some of them harbor a fighting spirit the likes of which I did not see even during my time in the Great War. Try to acquire a feather from a particularly embittered individual, it should bring the flavor - er, the strength of the implement out.
+[And the sweat?]->FinalConfirm2


=ShotDown
(Doctor Dietz looks a little hurt by your words, but doesn't say anything more)
->start

==Squat1
~ speaker = "Squatter"
A new visitor? Quite rare, quite rare indeed. Come squat with me if you've the time - I have new verses about the human condition I would so love to get constructive criticism on. 

These are certainly trying times, are they not?
->start


==Squat2
~ speaker = "Squatter"
Using an opened sardine can and a box of matches, I invented a device that can convert fish viscera into an incredibly cheap, long-burning fuel source that could replace gasoline in the years to come.

It is a shame that I have since lost this device somewhere in one of our many garbage piles. Blast. Don't bother looking for it, I'm sure it wouldn't be that useful in the years to come anyhow.
->start

==Squat3
~ speaker = "Squatter"
A time traveler, are you? I've been toying with the concept myself. Quite unstable, and thus not much worth the risk - though I am, of course, not beliguring your choices. 

Each of us live predestined lives - we can only make the best with what we are given.
->start

==Squat4
~ speaker = "Squatter"
If I looked out upon the sea in time,
would I see us as all within the brine
our many parted world all bent to shake 
and in my bones and blood begin to quake?

I - oh, forgive me, I was composing a sonnet. 
->start

==Squat5
~ speaker = "Squatter"
{
-visitsquat !=1:
~ booze = booze + 1
~ visitsquat = 1
The scarcity of this modern age allows me to reflect on the fortunes that I have had. Though I may consume the rotted skins of moldering potatoes for most of my daily bread, I can at least, through suffering, find transcendence. 

Want some booze? Here. Take one.
-else:
Here for more booze? Perhaps you should reflect on the scarcity of this modern age.

Go somewhere else.
}

->start

==Squat6
~ speaker = "Squatter"
Ah had ta sell ma left kidneh for 'nuff money t' get through th' week.
->start

==Squat7
~ speaker = "Squatter"
Though a time traveler may have manually crashed the stonk market and thrust us into this grim predicament, I believe one could see the inevitable writing on the wall brought on by the years of excess following the Great War. 

Really, we are ALL to blame - though if I found that time traveler I would soundly throttle them before tearing them to pieces. 
->start

==Squat8
~ speaker = "Squatter"
A gull swims through oil
We sing songs in the gutter 
I eat both my boots.
->start

==Squat9
~ speaker = "Squatter in Exceptional Pain"
I am in exceptional pain.
{
-mafiaquest ==1 && painmafio !=1:
+[Ever think about a change of... pose?]->Mafia
}
+[End Conversation]->NoHUD

=Mafia
~painmafio = 1
I'm not sure I can move, think my joints might be locked. Still, I'll try to see the Capo - maybe if I head out of the damp air my limbs'll... just start working? 

Look, I don't know, it's worth a try and I'm sick of eating trash.
->start

==TheRat
~ speaker = "THE RAT"
Squeenk. 

So you know how everybody in the 20s forward says "rats" when something bad happens? Yeah, that's because of me. I'm that rat. Singular. Not multiple rats. I chew holes in their socks, I cause plagues, I'm a pretty bad dude. Basically a war criminal. I should be arrested, but as I am a rat I would not be fit to stand trial. 

Try it, punk. You'll be laughed out of court and I'll go free - and you better believe I'll be back to bite your toes. Don't look at me. Don't pass me in the street. I'm a bad dude.
->start

==DoorGuard1
~ speaker = "Door Guard"
Funny how yous talkin' to me when yous should be smashed into a teensy little disc. Yous think that's funny? Yous should go into comedy so I can smash yous flat onstage... 
->start

==DoorGuard2
~ speaker = "Door Guard"
I'm the guard that only tells lies. Now, see, you gotta figure out if that's a lie, or if that's the truth. It's a paradox, see?

Look, if you keep staring at me I'm gonna punch yer lights out. Now you gotta figure out if I'm telling the truth or not...
->start

==Castiglioni
~ speaker = "Capo Castiglioni"
{
-mafiaquest == 0:
->Intro
-mafiaquest ==1 && (painmafio ==1 && fabmafio ==1 && stonckmafio ==1):
->QuestDone
-else:
->QuestNotDone
}
=Intro
You? I know you. You were one'a them unconscious stonk brokers out on that there trading floor. I knowed yer smell. Yeah, I took one'a yer tech-y machine-y parts and yer gonna help me if you want it back, got me?
+[It's better than getting kneecapped. What do you need?]->Help
+[(Mocking cowboy noises)]->Angry

=QuestDone
{
-mafiaquesthandler ==1:
->QuestDoneHandler
}
Ya found me three new mafios? Well blame! They said it couldn't happen!
+[Always happy to help my friendly neighborhood organized crime racket.]->QuestRealDone
+[I'm pretty great.]->QuestRealDone

=QuestRealDone
~mafiaquesthandler = 1
~machineparts += Atomic_Flange
~dondoor = 1
Here's that mechanical part I talked about - make good use'a it. Also, the Don wants t' see ya - don't leave him waitin'!
->start

=QuestDoneHandler
Thanks again for all yer help, pardner. I mean, uh, wise guy.
->start

=QuestNotDone
What in sam hill are you doin' back here? Do I see three new mafios? Nah! Get me three or don't come back!
->start

=Help
Awrite, so, we got only a handful of remaining mafios, see? Them eccy-nammic crash done caused us some trouble. So what you's gotta do is go about and recruit me some new soldiers - at least three. 

I dunno where you'll find 'em - everybody knows that folks with the mafios' powerful body type ain't so easy t' find - but I reckon you'll have to make do if you want your part back.

Run along now, little doggie, and find me some new hands. Git!
~mafiaquest = 1
->start


=Angry
(You can't see Castiglioni's face, but judging by his silence you suspect he's mad at you)
->start


==Mafio1
~ speaker = "Mafio"
Profit margins are down. Makes sense, seeing how it's, y'know, the Great Depression, but all the same I'd rather be making money, y'know? 

I'd shoot my stonk broker but the little guy's wearing a fishing hat and I just don't have the heart for it. Maybe later.
->start

==Mafio2
Usually when there's a massive economic crash the joke is "oh wow ha ha all of those economists are in crisis mode," but it's actually just us. It's the '20s, dude, do you honestly think government controls everything without like 200 mafios involved for every politician? EXACTLY. How's organized crime gonna get us out of this one? 

I can shoot up Donny the Quick's deli for not paying protection money when he chooses not to, but right now Donny the Quick's out on the street. Not so fast any more...
~ speaker = "Mafio"
->start

==Mafio3
Deflation, inflation, reinflation, GDPs... I've been looking at paperwork for the past 48 hours. What? I'm a legitimate businessman! 

Just, sometimes, y'gotta whack a couple wise guys to get your point across. Wish I could whack all this paperwork...
~ speaker = "Mafio"
->start

==Mafio4
~ speaker = "Mafio"
We've had to let a lot of members of the family go, just ain't got the money to pay 'em. Castiglioni's lookin' to swell our ranks, but how're we gonna get some new, able blood in here? We can't even get the old recruits back, they all started up this big knitting circle. No going back for them...
->start

==Mafio5
~ speaker = "Tritone Tremolo Timmy"
Don't make me play my "violin" at you, baby! If you get what I'm sayin'!...I'm sayin' that it's actually a fiddle, and I play real badly. I mean real badly. Your ears'll bleed, baby! Look out!
->start

==ThatBoy
~ speaker = "The Don"
{
-economyrestarted ==0 && FinalQuest == 0:
->Intro
-economyrestarted ==0 && (FinalQuest < 3 && FinalQuest > 0):
->Middlemafio
-economyrestarted ==1 && FinalQuest !=4:
->Pleasedmafio
-economyrestarted ==1 && FinalQuest ==4:
->Finalmafio
}

=Middlemafio
(The Don gestures at you and grumbles in his pseudo-Italian speak. You probably should come back when you've made more headway in restarting the economy)
->start

=Finalmafio
(The Don is still muttering to himself. Only the word "ratto" is distinguishable in the flurry of mumbled syllables)
->start

=Pleasedmafio
~machineparts += Time_Tommy_Gun
~FinalQuest = 4
(The Don's Italian noises have a decidedly pleased sound to them. He pushes a time machine part into your hands and blows you a kiss. He then immediately returns his attention to his desk, mumbling about "rats" and something called "RICO")

(Seems like an understated reaction for repairing the entire economy, but maybe it's better to take what you can get here)
->start

=Intro
(By your estimate this is the leader of the mafios, but it's almost impossible to tell. His Italian accent is so thick that you suspect even a native speaker would have absolutely no idea what he's saying)
+[Ha ha, yes, totally, uh, sir. What is it you need?]->ThatBoy2
+[Oh, me too, me too! My daughter also just got married!]->MadBoy

=ThatBoy2
(The Don's tone becomes personable - you seem to have guessed his intention right. Good job?)

(You can decipher a little more now - you think he's talking about restarting the economy. But that will take years of careful planning and government cooperation... Unless...)
+[Unless?]->ThatBoy3
->start

=ThatBoy3
~FinalQuest = 1
(Oh. He wants you to restart the economy like... restarting an engine. He says it's a matter of just pressing a button, and that Big Barry knows more)

(There's something else about "break your kneecaps" and "burn you alive", so it's probably safe to assume this is an offer you can't refuse)

(May as well go see Big Barry)
->start

=MadBoy
(The Don's voice gains about 20 decibels. You probably said the wrong thing - it might be safer to put some distance between the two of you)
->start


==FabMafio
~ speaker = "Fabulous Mafio"
Well, I liked where I was, but being here is nice too. Though the mafiosos here cry even more than the girls in The Party did!
->start

==PainMafio
Man, you would not believe how tough it was to get over here. I'm still in a tremendous amount of pain, but at least I've moved up in the world. 
~ speaker = "Mafio in Extreme Pain"
->start

==StonkMafio
You know, I thought things'd be easier here, but we still deal with a lot of pencils, and I keep obliterating them into a fine powder. If anything, these guys are MORE upset than the stonk brokers were. 
~speaker = "Stonck Mafio"
->start

==TimeMachine
~speaker = "endgame"
{
-firstactivate ==0:
->FirstActivate
-else:
->NormalActivate
}
=FirstActivate
Oh dear! You seem to have crashed your time machine into the New York stonk exchange! It happens to the best of us.
~firstactivate = 1
The impact left you unconscious, and when you came to, you found that a number of your time machine parts were missing! Better go find them, unless you fancy trying your luck with the space-time continuum. It's proabably pretty flexible, right?
+[Start]->NoHUD

=NormalActivate
If you think you have enough machine parts, you can try to return to the 21st century. If you don't have all 5 parts, however, there's no telling what might happen when you turn it on!
+[Activate Time Machine]->TimeHandler
+[Back]->NoHUD

=TimeHandler
{
-LIST_COUNT(machineparts) ==0:
->WorstEnd
-LIST_COUNT(machineparts) ==2 || LIST_COUNT(machineparts) == 1:
->BadEnd
-LIST_COUNT(machineparts) ==3 || LIST_COUNT(machineparts) == 4:
->OKEnd
-LIST_COUNT(machineparts) == 5:
->GoodEnd
}
=WorstEnd
You attempt to turn the time machine on. With none of its parts replaced, it coughs once, makes a few deep, wracking noises, and then proceeds to EXPLODE.

You're relatively unscathed, but you're also trapped in the '20s with an economic depression that you caused. Have fun!
->END

=BadEnd
You activate the time machine. As you've only placed a couple parts back where they were supposed to go it doesn't sound quite right... but it's probably fine.

The machine shudders, the flow of time begins - and stops. Funny, that felt a little quick. As you step outside your machine you realize that you've traveled about a week into the future. Maybe it was enough time for everyone to forget that you caused the Great Depression? They probably forgot, right?

Good luck!
->END

=OKEnd
You've found most of your parts - the machine might not work well, but it should be enough to take you back to the present.

As you step into the machine you feel time flow around you - but after a few minutes of travel you feel the machine stop in a juttering crash!

As you step out of the machine you realize that you've returned almost to the present, but a few years too early - late 2007, says the readout in your machine. And what is this - but your machine has crashed into the entire supply of money to all of the banks in America!

Oh, no! You've caused the Great Recession!
->END

=GoodEnd
With all its parts replaced, your time machine doesn't just hum - it sings. You step into the time machine and turn the dial, and in no more than a few minutes you've returned to the futuristic year of 2012. 

Ahh, thank god for the future! No more economic peril, no concerns about war or political corruption - just the good ol' present!

...

Welp, that's enough of that. Time to go back in the time machine!
->END

==FullGameIntro
~ speaker = "start"
Oh dear! You seem to have crashed your time machine into the New York stonk exchange! It happens to the best of us.

The impact left you unconscious, and when you came to, you found that a number of your time machine parts were missing! Better go find them, unless you fancy trying your luck with the space-time continuum. It's proabably pretty flexible, right?
+[Start]->NoHUD

==TheButton
~speaker = "button"
{
-FinalQuest !=3:
(Some kind of button. The sheer complexity of its operation boggles your mind - you'd have to talk to a real professional to figure out how to operate it)
+[End Conversation]->NoHUD
-FinalQuest ==3:
(This must be the button Dietz was talking about. Pressing it should restart the economy)
+[Press it]->Press
+[Back]->NoHUD
}

=Press
~economyrestarted = 1
(You press the button twice. Somewhere a cash register dings.

Congratulations! You restarted the economy!)
->start
