#VISUAL DISCRIMINATION TASK
scenario = "Visual Discrimination Task";

default_font_size = 20;
default_font = "Arial";
default_text_color = 0,0,0;
default_background_color = 255,255,255;
active_buttons = 3;
button_codes = 1,2,3; #enter #left #right
response_matching = simple_matching;
stimulus_properties = ExpPhase, string, Stimulus, string, SameOrDifferent, string, Type, string, CorrectAnswer, string; 
event_code_delimiter = ",";
pcl_file = "VisualDiscrimination.pcl";
begin;

#INSTRUCTIONS

trial {
 trial_duration = forever;
 trial_type = specific_response;
 terminator_button = 1;
 
 stimulus_event {
  picture {
   background_color = 255, 255, 255;
   
   text {background_color = 255,255,255; font_color = 0,0,139,200; font = "Arial";
     caption = "A következő feladatban képeket fog látni.\nArra kérjük Önt, hogy gombnyomással jelezze, hogy a két kép között lát-e eltérést.\n
Amennyiben lát eltérést, nyomja meg a BAL gombot.\nAmennyiben nem lát eltérést, nyomja meg a JOBB gombot.\n
A továbblépéshez nyomja meg az ENTER gombot.";
    } instruction1_text;
    x = 0; y = 0;
  }instruction1_pic;
  target_button = 1;
 }instruction1_event;
}instruction1_trial;

trial {
 trial_duration = forever;
 trial_type = specific_response;
 terminator_button = 1;

 stimulus_event {
  picture {
   background_color = 255, 255, 255;
   
   text {background_color = 255,255,255; font_color = 0,0,139,200; font = "Arial";
     caption = "Először pár gyakorló képet fog látni.\nKérjük figyelje meg, hogy lát-e eltérést a két kép között.\n
Amennyiben lát eltérést, nyomja meg a BAL gombot.\nAmennyiben nem lát eltérést, nyomja meg a JOBB gombot.\n
A továbblépéshez nyomja meg az ENTER gombot.";
    } instruction2_text;
    x = 0; y = 0;
  }instruction2_pic;
  target_button = 1;
 }instruction2_event;
}instruction2_trial;

#PRACTICE

trial {    
   trial_duration = 2000;
   trial_type = fixed;
	terminator_button = 2, 3;
	# the trial needs to contain a stimulus event in order for us to define event codes for logging, see .pcl
	stimulus_event {
		picture {
			bitmap { filename = ""; preload = false; } practice_bmp;			
			x = 0; y = 0;
			bitmap { filename = ""; preload = false; } buttons_p;
                        x = 0; y = -300;
		} practice_pic;
	time = 0;
	} practice_event;	
} practice_trial;

#INSTRUCTION

trial {
 trial_duration = forever;
 trial_type = specific_response;
 terminator_button = 1;

 stimulus_event {
  picture {
   background_color = 255, 255, 255;
   
   text {background_color = 255,255,255; font_color = 0,0,139,200; font = "Arial";
     caption = "Ez a gyakorlási fázis vége.\n
A követekző részben 40 képpárt fog látni. Kérjük figyelje meg, hogy lát-e eltérést a két kép között.\n
Amennyiben lát eltérést, nyomja meg a BAL gombot.\nAmennyiben nem lát eltérést, nyomja meg a JOBB gombot.\n
A továbblépéshez nyomja meg az ENTER gombot.";
    } instruction3_text;
    x = 0; y = 0;
  }instruction3_pic;
  target_button = 1;
 }instruction3_event;
}instruction3_trial;


#TEST

trial {    
   trial_duration = 2000;
   trial_type = fixed;
	terminator_button = 2, 3;

	stimulus_event {
		picture {
			bitmap { filename = ""; preload = false; }test_bmp;			
			x = 0; y = 0;
			bitmap { filename = ""; preload = false; } buttons_t;
                        x = 0; y = -300;
		} test_pic;
	time = 0;
	} test_event;	
} test_trial;

#THANKS

trial{
 trial_duration = forever;
 trial_type = specific_response;
 terminator_button = 1; #enter

 stimulus_event {
  picture {
   background_color = 255,255,255;

   text { font_color = 0,0,139,200;
    caption = "Köszönjük a figyelmét, ez a feladat vége!\nA kilépéshez nyomja meg az ENTER gombot.";
    } thanks_text;
    x = 0; y = 0;
   } thanks_pic;
   target_button = 1;
  } thanks_event;
 } thanks_trial;
 
#ISI

trial {
 trial_duration = 1000;
 trial_type = fixed;
 
 stimulus_event {
  picture {
   background_color = 255, 255, 255;
   
   text {background_color = 255,255,255; font_color = 0,0,139,200; font = "Arial"; font_size = 40;
     caption = "+";
    } isi_text;
    x = 0; y = 0;
  }isi_pic;
 }isi_event;
}isi_trial;
