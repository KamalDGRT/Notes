struct Question {
    var quest : String
    var option1 : String
    var option2 : String
    var option3 : String
    var option4 : String
    var ca : String
    var ans : String
    
    init(
        quest : String,
        option1 : String,
        option2 : String,
        option3 : String,
        option4 : String,
        ca : String,
        ans : String = ""
    ) {
        self.quest = quest
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.ca = ca
        self.ans = ans
    }
}

var Topic1 = [Question]() // Facts about India
var Topic2 = [Question]() // Geography
var Topic3 = [Question]() // History
var Topic4 = [Question]() // Constitution of India
var Topic5 = [Question]() // United Nations Organization
var Topic6 = [Question]() // Science and Technology
var Topic7 = [Question]() // Lieterature
var Topic8 = [Question]() // Personalitites

Topic1.append(Question(
    quest :"Largest artificial lake in India is",
	option1 :"  Pushkar Lake",
	option2 :"  Dal Lake",
	option3 :"  Govind Sagar(Bhakra)",
	option4 :"  Nainital Lake",
	ca :"C"
))

Topic1.append(Question(
	 quest :"State in India with the lowest literacy is",
	 option1 :"  Arunachal Pradesh",
	 option2 :"  Mizoram",
	 option3 :"  Manipur",
	 option4 :"  None of these.",

	 ca :"A"
))

Topic1.append(Question(
	 quest :"India's first TV Centre was set up at :",
	 option1 :"  Calcutta",
	 option2 :"  Mumbai",
	 option3 :"  Delhi",
	 option4 :"  Poona",

	 ca :"C"
))

Topic1.append(Question(
	 quest :"Which is the India's longest platform?",
	 option1 :"  Delhi",
	 option2 :"  Calcutta",
	 option3 :"  Sonepur",
	 option4 :"  Kharagpur",

	 ca :"D"
))

Topic1.append(Question(
	 quest :"Highest rank in the Indian Army is",
	 option1 :"  Captain",
	 option2 :"  Major General",
	 option3 :"  General",
	 option4 :"  Colonel",

	 ca :"C"
))

Topic1.append(Question(
	 quest :" City of Gardens ?",
	 option1 :"  Mysore",
	 option2 :"  Gulburga",
	 option3 :"  Bangalore",
	 option4 :"  Shimoga",

	 ca :"C"
))

Topic1.append(Question(
	 quest :"Where are Vijayanta Tanks manufactured?",
	 option1 :"  Salem",
	 option2 :"  Avadi",
	 option3 :"  Mysore",
	 option4 :"  Alwaye",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"India's first earth Satellite station is situated at:",
	 option1 :"  Thumba (near Trivandrum)",
	 option2 :"  Arvi (near Pune)",
	 option3 :"  Sriharikota on Andhra Coast",
	 option4 :"  None of these.",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"Chakra of the National Flag of India has",
	 option1 :"  30 spokes",
	 option2 :"  36 spokes",
	 option3 :"  24 spokes",
	 option4 :"  None of these.",

	 ca :"C"
))

Topic1.append(Question(
	 quest :"Postage stamps were issued in India in",
	 option1 :"  1852",
	 option2 :"  1854",
	 option3 :"  1892",
	 option4 :"  None of these.",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"Supreme Commander of the Armed Forces",
	 option1 :"  Chief of Army Staff",
	 option2 :"  President of India",
	 option3 :"  Prime Minister",
	 option4 :"  Defence Minister",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"Percentage of land covered by forests",
	 option1 :"  19.47%",
	 option2 :"  40%",
	 option3 :"  17.57%",
	 option4 :"  None of these",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"Ajanta Caves situated are situtated in",
	 option1 :"  Andhra Pradesh",
	 option2 :"  Maharashtra",
	 option3 :"  Madhya Pradesh",
	 option4 :"  Tamil Nadu",

	 ca :"B"
))

Topic1.append(Question(
	 quest :"Sri Harikota is situated in which state?",
	 option1 :"  Bihar",
	 option2 :"  Tamil Nadu",
	 option3 :"  Andhra Pradesh",
	 option4 :"  Maharashtra",

	 ca :"C"
))

Topic1.append(Question(
	 quest :"Largest Zoo in India ",
	 option1 :"  Delhi Zoo",
	 option2 :"  Mumbai Zoo",
	 option3 :"  Zoological Garden (Alipore : Calcutta)",
	 option4 :"  None of these.",

	 ca :"A"
))

// ---------------------------------------------------------------

Topic2.append(Question(
    quest : "Which is the world's oldest capital city?",
    option1 : "  Damascus",
    option2 : "  Bolivia",
    option3 : "  Lesotho",
    option4 : "  Peru",
    ca : "B"
))

Topic2.append(Question(
    quest : "The earth's rotation does not cause________",
    option1 : "  Tides",
    option2 : "  Phases of the moon",
    option3 : "  Deflection of ocean currents",
    option4 : "  Difference in time between two meridians",
    ca : "D"
))

Topic2.append(Question(
    quest : "Which is the largest ocean ?",
    option1 : "  Atlantic Ocean",
    option2 : "  Pacific Ocean",
    option3 : "  Indian Ocean",
    option4 : "  Arctic Ocean",
    ca : "B"
))

Topic2.append(Question(
    quest : "Which is the most populous city in the world?",
    option1 : "  New York",
    option2 : "  Paris",
    option3 : "  London",
    option4 : "  Tokyo",
    ca : "D"
))

Topic2.append(Question(
    quest : "What is the diameter of earth approximately?",
    option1 : "  7700 miles",
    option2 : "  7800 miles",
    option3 : "  7900 miles",
    option4 : "  8000 miles",
    ca : "C"
))

Topic2.append(Question(
    quest : "On which river is Lucknow situated ?",
    option1 : "  Ganga",
    option2 : "  Jamuna",
    option3 : "  Mahanadi",
    option4 : "  Gomti",
    ca : "D"
))

Topic2.append(Question(
    quest : "Which is the leading Industrial country in Asia?",
    option1 : "  Singapore",
    option2 : "  Japan",
    option3 : "  Pakistan",
    option4 : "  Thailand",
    ca : "B"
))

Topic2.append(Question(
    quest : "What is the world's biggest desert?",
    option1 : "  Sahara",
    option2 : "  Libyan",
    option3 : "  Gobi",
    option4 : "  Thar",
    ca : "A"
))

Topic2.append(Question(
    quest : "Planned city of India is ",
    option1 : "  Varanasi",
    option2 : "  Auroville",
    option3 : "  Hyderabad",
    option4 : "  New Delhi",
    ca : "B"
))

Topic2.append(Question(
    quest : "Which is the largest continent?",
    option1 : "  Eur-Asia",
    option2 : "  Africa",
    option3 : "  North America",
    option4 : "  South America",
    ca : "A"
))

Topic2.append(Question(
    quest : "Where is Zebra found?",
    option1 : "  Africa",
    option2 : "  Australia",
    option3 : "  Asia",
    option4 : "  Europe",
    ca : "A"
))

Topic2.append(Question(
    quest : "Where is the world's longest river?",
    option1 : "  U. S.",
    option2 : "  Iraq",
    option3 : "  Iran",
    option4 : "  U.S. ",
    ca : "D"
))

Topic2.append(Question(
    quest : "How much time earth takes to revolve round the Sun?",
    option1 : "  365 days",
    option2 : "  365 1/4 days",
    option3 : "  365 1/2 days",
    option4 : "  365 3/4 days",
    ca : "D"
))

Topic2.append(Question(
    quest : "Where is Central Building Research Institute located?",
    option1 : "  Roorkee",
    option2 : "  Chennai",
    option3 : "  Bhavangar",
    option4 : "  Ranchi",
    ca : "A"
))

Topic2.append(Question(
    quest : "Which is the largest delta?",
    option1 : "  Himalayas",
    option2 : "  Sunderbans",
    option3 : "  Amazon",
    option4 : "  Everest",
    ca : "B"
))

//--------------------------------------------------------------------------------

Topic3.append(Question(
    quest : "Why Alexander had attacked 'Porus'?",
    option1 : "  to win his kingdom",
    option2 : "  to win his friendship",
    option3 : "  to plunder his wealth",
    option4 : "  to increase his territories",
    ca : "C"
))

Topic3.append(Question(
    quest : "What was the court language of Mughals?",
    option1 : "  Persian",
    option2 : "  Arabic",
    option3 : "  Urdu",
    option4 : "  Turkish",
    ca : "A"
))

Topic3.append(Question(
    quest : "When was First Atom Bomb exploded?",
    option1 : "  1945",
    option2 : "  1946",
    option3 : "  1948",
    option4 : "  1949",
    ca : "B"
))

Topic3.append(Question(
    quest : "In which year 'Quit India' movement was launched by I.N.C ?",
    option1 : "  1938",
    option2 : "  1942",
    option3 : "  1943",
    option4 : "  1944",
    ca : "B"
))

Topic3.append(Question(
    quest : "Goa was liberated on ________",
    option1 : "  16th September 1958",
    option2 : "  16th October 1959",
    option3 : "  17th November 1960",
    option4 : "  18th December 1961",
    ca : "D"
))

Topic3.append(Question(
    quest : "In which year was Jesus Christ born?",
    option1 : "  1 BC",
    option2 : "  1 BC",
    option3 : "  4 BC",
    option4 : "  None of these",
    ca : "C"
))

Topic3.append(Question(
    quest : "In which year was Jesus Christ crucified?",
    option1 : "  50 AD",
    option2 : "  43 AD",
    option3 : "  33 AD",
    option4 : "  190 AD",
    ca : "C"
))

Topic3.append(Question(
    quest : "Who was the 1st President of United States of America?",
    option1 : "  William George",
    option2 : "  James   Garfield",
    option3 : "  Abraham Lincoln",
    option4 : "  George Washington",
    ca : "D"
))


Topic3.append(Question(
    quest : "The Aryans came to India from",
    option1 : " Central Asia",
    option2 : "  South-East Asia",
    option3 : "  West Europe",
    option4 : "  East Europe",
    ca : "A"
))

Topic3.append(Question(
    quest : "Taj Mahal was built in",
    option1 : "  14th Century A.D.",
    option2 : "  15th Century A.D.",
    option3 : "  16th Century A.D.",
    option4 : "  17th Century A.D.",
    ca : "D"
))

Topic3.append(Question(
    quest : "In which year was Mahatma Gandhi assassinated?",
    option1 : "  1 October 1958",
    option2 : "  15 August 1947",
    option3 : "  30 January 1948",
    option4 : "  26 January 1950",
    ca : "D"
))

Topic3.append(Question(
    quest : "The slogan \"Jai Jawan Jai Kisan\" was launched by_____",
    option1 : "  Mahatma Gandhi",
    option2 : "  Pt. Jawaharlal Nehru",
    option3 : "  Mrs. Indira Gandhi",
    option4 : "  Lal Bahadur Shastri",
    ca : "D"
))

Topic3.append(Question(
    quest : "The first Viceroy of India was___",
    option1 : "  Lord Canning",
    option2 : "  Lord Mountbatten",
    option3 : "  Lord William Bentik",
    option4 : "  Lord Wavell",
    ca : "A"
))

Topic3.append(Question(
    quest : "Who was the founder of Modern Germany ?",
    option1 : "  Mattermich",
    option2 : "  Bismarck",
    option3 : "  Cavour",
    option4 : "  Sun-Yat-Sen",
    ca : "B"
))

Topic3.append(Question(
    quest : "Who was the 1st person to sail around the world?",
    option1 : "  Robert Peary",
    option2 : "  Magellan",
    option3 : "  Amundse",
    option4 : "  Mihirsen",
    ca : "B"
))

// -----------------------------------------------------------------------------

Topic4.append(Question(
    quest: "From which date the Constitution of India came into effect?",
    option1 : "  26 January 1950",
    option2 : "  15 August 1949",
    option3 : "  20 January 1950",
    option4 : "  14 November 1952",
    ca : "A"
))

Topic4.append(Question(
    quest : "Who was the 1st Governor General of Free India ?",
    option1 : "  Rajagopalachari",
    option2 : "  Lord Mountbatten",
    option3 : "  Rajendra Prasad",
    option4 : "  None of these",
    ca : "A"
))

Topic4.append(Question(
    quest : "Which one is India's National Animal?",
    option1 : "  Tiger",
    option2 : "  Lion",
    option3 : "  Elephant",
    option4 : "  Cow",
    ca : "A"
))

Topic4.append(Question(
    quest : "Which one is the National Bird of India?",
    option1 : "  Nightingale",
    option2 : "  Pigeon",
    option3 : "  Peocock",
    option4 : "  Swan",
    ca : "C"
))

Topic4.append(Question(
    quest : "Which one is the National Flower of India?",
    option1 : "  Rose",
    option2 : "  Lotus",
    option3 : "  Jasmine",
    option4 : "  Hibiscus",
    ca : "B"
))

Topic4.append(Question(
    quest : "The President of India holds office for a period of :",
    option1 : "  6 years",
    option2 : "  5 years",
    option3 : "  4 years",
    option4 : "  7years",
    ca : "B"
))

Topic4.append(Question(
    quest : "Vice - President of India is elected by",
    option1 : "  Rajya Sabha",
    option2 : "  Lok Sabha",
    option3 : "  Both Houses of Parliament at a joint session.",
    option4 : "  None of these.",
    ca : "C"
))

Topic4.append(Question(
    quest : "India owes its political Integration to the genius :",
    option1 : "  Jawaharlal Nehru",
    option2 : "  Lord Mountbatten",
    option3 : "  Sardar Vallabhai Patel",
    option4 : "  Rajagopalachari",
    ca : "C"
))

Topic4.append(Question(
    quest : "What is/are the essential element(s) of the State?",
    option1 : "  Territory",
    option2 : "  Government",
    option3 : "  Sovereignty",
    option4 : "  All of the above.",
    ca : "D"
))

Topic4.append(Question(
    quest : "Who was the first speaker of Lok Sabha?",
    option1 : "  N. Sanjiva Reddy",
    option2 : "  G.V. Mavalankar",
    option3 : "  Hukum Sing",
    option4 : "  M.  Ayyangar",
    ca : "B"
))

Topic4.append(Question(
    quest : "Who is the Chairman of the Rajya Sabha?",
    option1 : "  Prime Minister",
    option2 : "  Speaker of the Lok Sabha ",
    option3 : "  Vice-President",
    option4 : "  Leader of opposition",
    ca : "C"
))

Topic4.append(Question(
    quest : "What is the age of retirement for High Court Judge?",
    option1 : "  60 years",
    option2 : "  62 years",
    option3 : "  65 years",
    option4 : "  58 years",
    ca : "B"
))

Topic4.append(Question(
    quest : "What are the main causes of poverty in India ?",
    option1 : "  Political",
    option2 : "  Social",
    option3 : "  Economic",
    option4 : "  All of the above",
    ca : "D"
))

Topic4.append(Question(
    quest : "Minimum voting age in India is",
    option1 : "  18 years.",
    option2 : "  21 years.",
    option3 : "  20 years.",
    option4 : "  None of the above.",
    ca : "A"
))

Topic4.append(Question(
    quest : "Who was the first Chairman of the Rajya Sabha ?",
    option1 : "  Hukum Singh",
    option2 : "  S. Radhakrishnan",
    option3 : "  G.  Pant",
    option4 : "  G.L.s Nanda",
    ca : "B"
))


// ---------------------------------------------------------------

Topic5.append(Question(
    quest : "Where is the Headquaters of the UNESCO located ?",
    option1 : "  Paris",
    option2 : "  Geneva",
    option3 : "  Hague",
    option4 : "  Washington",
    ca : "A"
))

Topic5.append(Question(
    quest : "U.N.O. came into existence from",
    option1 : "  26th January",
    option2 : "  August",
    option3 : "  24th October",
    option4 : "  1st January",
    ca : "B"
))

Topic5.append(Question(
    quest : "Locate the Headquartes of the World Bank",
    option1 : "  Washington",
    option2 : "  New York",
    option3 : "  Montreal",
    option4 : "  Geneva",
    ca : "A"
))


Topic5.append(Question(
    quest : "How many countries are given 'Veto Power' ?",
    option1 : "  5 countries",
    option2 : "  3 countries",
    option3 : "  6 countries",
    option4 : "  7 countries",
    ca : "A"
))


Topic5.append(Question(
    quest : "No. of Judges in the International Court of Justice",
    option1 : "  9",
    option2 : "  11",
    option3 : "  13",
    option4 : "  15",
    ca : "D"
))


Topic5.append(Question(
    quest : "Which country is not a member of the U.N.O. ?",
    option1 : "  India",
    option2 : "  Burma",
    option3 : "  Norway",
    option4 : "  Taiwan",
    ca : "D"
))


Topic5.append(Question(
    quest : "When was the U.N.O. formed? ",
    option1 : "  1942",
    option2 : "  1943",
    option3 : "  1944",
    option4 : "  1945",
    ca : "D"
))


Topic5.append(Question(
    quest : "Which is not the official languge of U.N.O.?",
    option1 : ". English",
    option2 : "French",
    option3 : "Arabic",
    option4 : "Italian",
    ca : "D"
))


Topic5.append(Question(
    quest : "General Assembly of UNO meets ",
    option1 : "  twice a year",
    option2 : "  thrice a year",
    option3 : "  once a year",
    option4 : "  once in two years",
    ca : "C"
))


Topic5.append(Question(
    quest : "Which day is observed as the 'U.N. Day'?",
    option1 : "  October 4",
    option2 : "  April 8",
    option3 : "  October 24",
    option4 : "  None of these",
    ca : "C"
))


Topic5.append(Question(
    quest : "When did Pakistan become a member of the UN?",
    option1 : "  1948",
    option2 : "  1947",
    option3 : "  1950",
    option4 : "  1951",
    ca : "B"
))


Topic5.append(Question(
    quest : "Which of the following is not an organ of UNO?",
    option1 : "  IMF",
    option2 : "  UNESCO",
    option3 : "  UNICEF",
    option4 : "  None of these",
    ca : "A"
))


Topic5.append(Question(
    quest : "Which Day is observed in December 10 ?",
    option1 : "  U.N. Day",
    option2 : "  World Health Day",
    option3 : "  World Red Cross Day",
    option4 : "  Human Rights Day",
    ca : "D"
))


Topic5.append(Question(
    quest : "First Secretary-General of the U.N. belonged to",
    option1 : "  Sweden",
    option2 : "  Austria",
    option3 : "  Norway",
    option4 : "  Burma",
    ca : "C"
))


Topic5.append(Question(
    quest : "Each member of UNO can send ___ representatives.",
    option1 : "  upto 5",
    option2 : "  upto 6",
    option3 : "  upto 7",
    option4 : "  upto 8",
    ca : "A"
))

// ---------------------------------------------------------------


Topic6.append(Question(
    quest : "Inventor of Wireless Telegram is",
    option1 : "  J.L.Baird",
    option2 : "  Alfred Nobel",
    option3 : "  Marconi",
    option4 : "  Waterman",
    ca : "C"
))

Topic6.append(Question(
    quest : "Heavy Hydrogen was discovered by :",
    option1 : "  John Napper",
    option2 : "  Frank Whitt",
    option3 : "  Lister",
    option4 : "  L. Urey",
    ca : "D"
))

Topic6.append(Question(
    quest : "Cosmic Rays was discovered by :",
    option1 : "  Brequet",
    option2 : "  James Watt",
    option3 : "  Cavendish",
    option4 : "  Milikan",
    ca : "D"
))

Topic6.append(Question(
    quest : "A Photometer is used for the determination of :",
    option1 : "  altitudes",
    option2 : "  electric potential",
    option3 : "  specific gravity",
    option4 : "  intensy of illumination",
    ca : "D"
))

Topic6.append(Question(
    quest : "Quantum Theory was proposed by",
    option1 : "  J. Priestly",
    option2 : "  Marconi",
    option3 : "  Max Planck",
    option4 : "  W.K. Roentgoen",
    ca : "C"
))

Topic6.append(Question(
    quest : "What do you associate with 'Fermi' ?",
    option1 : "  South Pole",
    option2 : "  Wireless Effect",
    option3 : "  Atomic Bomb",
    option4 : "  Raman Effect",
    ca : "C"
))

Topic6.append(Question(
    quest : "Which is the Purest Form of Water?",
    option1 : "  Surface Water",
    option2 : "  Rain Water",
    option3 : "  Well Water",
    option4 : "  Mineral Water",
    ca : "B"
))

Topic6.append(Question(
    quest : "Hydrogen is a important constituent of :",
    option1 : "  Water",
    option2 : "  Petroleum",
    option3 : "  Natural Gas",
    option4 : "  Plant and Animal Resource",
    ca : "C"
))

Topic6.append(Question(
    quest : "How much blood does a man have in his body?",
    option1 : "  4 %",
    option2 : "  10 %",
    option3 : "  7 %",
    option4 : "  18 %",
    ca : "A"
))

Topic6.append(Question(
    quest : "Sugar can be tested in a Diabates patient by... ",
    option1 : "  Benedict's Test",
    option2 : "  Backford's Test",
    option3 : "  Denige Test",
    option4 : "  None of the above",
    ca : "A"
))

Topic6.append(Question(
    quest : "How does a yellow flower in Red light ?",
    option1 : "  Black",
    option2 : "  Indigo",
    option3 : "  Red",
    option4 : "  White",
    ca : "B"
))

Topic6.append(Question(
    quest : "Pituitary Gland is located at the base of",
    option1 : "  Brain",
    option2 : "  Eyes",
    option3 : "  Stomach",
    option4 : "  Heart",
    ca : "A"
))

Topic6.append(Question(
    quest : "What is the kind of energy stored in a Dam ?",
    option1 : "  Heat Energy",
    option2 : "  Kinetic Energy",
    option3 : "  Potential Energy",
    option4 : "  Surface Energy",
    ca : "C"
))

Topic6.append(Question(
    quest : "Who discovered Law of Electrolysis ?",
    option1 : "  Snell",
    option2 : "  Farady",
    option3 : "  Dalton",
    option4 : "  Kepler",
    ca : "B"
))

Topic6.append(Question(
    quest : "Orange provides ........   ",
    option1 : "  Vitamin B",
    option2 : "  Vitamin C",
    option3 : "  Vitamin D",
    option4 : "  Vitamin E",
    ca : "B"
))

// -----------------------------------------------------------------------------



Topic7.append(Question(
	quest : "Author of 'God of Small Things'",
	option1 : "  Vikram Seth",
	option2 : "  Arundhati Roy",
	option3 : "  Anita Desai",
	option4 : "  Shoba De",
	ca : "B"
))

Topic7.append(Question(
	quest : "Who wrote 'India of My Dreams'?",
	option1 : "  Jawaharlal Nehru",
	option2 : "  Mahatma Gandhi",
	option3 : "   Subramanian",
	option4 : "  Kamal Sharma",
	ca : "C"
))

Topic7.append(Question(
	quest : "Who wrote 'My Experiments with Truth'?",
	option1 : "  Dr. Rajendra Prasad",
	option2 : "  Sardar Vallabhai Pater",
	option3 : "  Jawaharlal Nehru",
	option4 : "  Mahatma Gandhi",
	ca : "D"
))

Topic7.append(Question(
	quest : "Who wrote the play 'The Three Musketeers' ?",
	option1 : "  Victor Hugo",
	option2 : "  Alexander Dumas",
	option3 : "  Charles Dickens",
	option4 : "  H.G. Wells",
	ca : "B"
))

Topic7.append(Question(
	quest : "Who was the author of 'War and Peace'?",
	option1 : "  Adam Smith",
	option2 : "  Aldous Huxley",
	option3 : "  Charles Dickens",
	option4 : "  Leo Tolstoy",
	ca : "D"
))

Topic7.append(Question(
	quest : "'Bhagawat Gita' was written by",
	option1 : "  Maharishi Ved Vyas",
	option2 : "  Tulsidas",
	option3 : "  Sur Das",
	option4 : "  Hari Haran",
	ca : "A"
))

Topic7.append(Question(
	quest : "Who wrote the 'Autobiography of Unknown Indians' ?",
	option1 : "  Mulkh Raj Anand",
	option2 : "  Rabindranath Tagore",
	option3 : "  Nirad E. Chowdhary",
	option4 : "  Sarojini Naidu",
	ca : "C"
))

Topic7.append(Question(
	quest : "Identify the authour of 'Great Expectations'",
	option1 : "  John Galsworthy",
	option2 : "  Victor Hugo",
	option3 : "  H.G.Wells",
	option4 : "  Charles Dickens",
	ca : "D"
))

Topic7.append(Question(
	quest : "Thomas Hardy wrote the book ",
	option1 : "  'First Circle'",
	option2 : "  'Friends Not Masters'",
	option3 : "  'Faust'",
	option4 : "  'Far From the Madding Crowd'",
	ca : "D"
))

Topic7.append(Question(
	quest : "Who created the character 'Sancho Panza'?",
	option1 : "  Cervantes",
	option2 : "  T.S. Elliot",
	option3 : "  R.L. Stevenson",
	option4 : "  Enid Blyton",
	ca : "A"
))

Topic7.append(Question(
	quest : "Who wrote 'She Stoops To Conquer'?",
	option1 : "  H.G. Wells",
	option2 : "  Shakespeare",
	option3 : "  Goldsmith",
	option4 : "  Rick Riordan",
	ca : "C"
))

Topic7.append(Question(
	quest : "Who wrote the play 'Kadambari'?",
	option1 : "  Bana  Bhat",
	option2 : "  Anand Tagore",
	option3 : "  Abindranath Tagore",
	option4 : "  Kalidas",
	ca : "A"
))

Topic7.append(Question(
	quest : "Who created the character 'Hercule Poirot'?",
	option1 : "  Mathew Arnold",
	option2 : "  Somerset Maugham",
	option3 : "  Eddington",
	option4 : "  Shakespeare",
	ca : "C"
))

Topic7.append(Question(
	quest : "Who wrote the book 'Cricket-My Style' ?",
	option1 : "  Sachin Tendulkar",
	option2 : "  M.S. Dhoni",
	option3 : "  Virat Kholi",
	option4 : "  Kapil Dev",
	ca : "D"
))

Topic7.append(Question(
	quest : "Who is the authour of 'Mein Kamph' ?",
	option1 : "  Adolf Hitler",
	option2 : "  Sir Walter Scott",
	option3 : " T.S. Elliot",
	option4 : "  Bharath Raam",
	ca : "A"
))

// -----------------------------------------------------------------------------


Topic8.append(Question(
    quest : "1st President of the Indian Republic is",
    option1 : "  G. Pant",
    option2 : "  Dr. Rajendra Prasad",
    option3 : "  S. Radhakrishnan",
    option4 : "  Zakir Hussain",
    ca : "B"
))

Topic8.append(Question(
    quest : "The 1st Deputy Prime Minister of India is",
    option1 : "  G.N. Nanda",
    option2 : "  Lal Bahadur Shastri",
    option3 : "  G.  Pant",
    option4 : "  Sardar Vallabhai Patel",
    ca : "D"
))

Topic8.append(Question(
    quest : "1st Woman President of Congress is:",
    option1 : "  Rajkumari Amrit Kaur",
    option2 : "  M.S. Sarojini Naidu",
    option3 : "  Mrs. Sucheta Kripalini",
    option4 : "  Mrs. Vijaylakshmi Pandi",
    ca : "B"
))

Topic8.append(Question(
    quest : "Who led the 'Ocean to Sky' expendition?",
    option1 : "  Edmund Hillary",
    option2 : "  H. Sarin",
    option3 : "  Fin Wilson",
    option4 : "  Galileo",
    ca : "A"
))

Topic8.append(Question(
    quest : "1st woman to climb Mt. Everest is",
    option1 : "  Junko Tabei",
    option2 : "  Smita Patel",
    option3 : "  Virginia Wade",
    option4 : "  Pask Yung Sun",
    ca : "A"
))

Topic8.append(Question(
    quest : "Who reached the South-Pole first?",
    option1 : "  Robert Pearry",
    option2 : "  Amundsen",
    option3 : "  Byrd",
    option4 : "  John Cabott",
    ca : "B"
))

Topic8.append(Question(
    quest : "Who reached the North-Pole first?",
    option1 : "  Robert Pearry",
    option2 : "  Amundsen",
    option3 : "  Byrd",
    option4 : "  John Cabott",
    ca : "A"
))

Topic8.append(Question(
    quest : "1st Prime Minister of England is",
    option1 : "  Benjamin Disraeli",
    option2 : "  Robert Walpole",
    option3 : "  Lord North",
    option4 : "  Robert Blake",
    ca : "B"
))

Topic8.append(Question(
    quest : "1st President of Chinese Republic is",
    option1 : "  Mao Tse Tung",
    option2 : "  Chou-En-Lai",
    option3 : "  Sun-Yat-Sen",
    option4 : "  Lin-Yu-Tang",
    ca : "C"
))

Topic8.append(Question(
    quest : "1st Woman President of UN General Assembly is",
    option1 : "  Mrs. Sarojini Naidu",
    option2 : "  Mrs. Indira Gandhi",
    option3 : "  Mrs. Vijayalakshmi Pandit",
    option4 : "  Mrs. Sucheta Kripalini",
    ca : "C"
))

Topic8.append(Question(
    quest : " Rajagopalachari was the ___________ ",
    option1 : "  Last Governor General of Free India",
    option2 : "  First Governor General of Free India",
    option3 : "  Last Governor General of India",
    option4 : "  None of these",
    ca : "C"
))

Topic8.append(Question(
    quest : "Lord Canning was the ___________",
    option1 : "  First Governor General of India",
    option2 : "  Last Governor General of India",
    option3 : "  1st Viceroy of India",
    option4 : "  None of these",
    ca : "C"
))

Topic8.append(Question(
    quest : "Mihir Sen distinguished himself as _________",
    option1 : " India's Top Hockey Player",
    option2 : " India's renowned film director",
    option3 : "  1st Indian to swim across the English Channel",
    option4 : "  a Naxalite",
    ca : "C"
))

Topic8.append(Question(
    quest : "1st Indian to get the Nobel Prize",
    option1 : " Raja Ram Mohun Roy",
    option2 : "  Sir  V. Raman",
    option3 : "  Mrs. Sarojini Naidu",
    option4 : "  Rabindranath Tagore",
    ca : "D"
))

Topic8.append(Question(
    quest : "1st Indian to get the rank of Field Marshal",
    option1 : "  G.G. Bewoor",
    option2 : "  S.H.F.J. Manekshaw",
    option3 : "  Cariappa",
    option4 : "  None of these",
    ca : "B"
))

// -----------------------------------------------------------------------------


// Topic.append(Question(
// 	quest : "",
// 	option1 : "",
// 	option2 : "",
// 	option3 : "",
// 	option4 : "",
// 	ca : ""
// ))



func displayQuestion(ques : Question) {
    print("Question : \n\(ques.quest)\n")
    print("Option A : \(ques.option1)")
    print("Option B : \(ques.option2)")
    print("Option C : \(ques.option3)")
    print("Option D : \(ques.option4)\n")
}

enum UserType {
    case Admin
    case Normal
}

struct User {
    var name: String
    var email: String
    var password: String
    var userType:UserType

    init(name: String, email: String, password: String, userType: UserType = .Normal) {
        self.name = name
        self.email = email
        self.password = password
        self.userType = userType
    }
}

// Will be useful while implementing Sorting Logic for the scores
func swapNumbers(a: inout Int, b: inout Int) {
    let temp = b
    b = a
    a = temp
}

// Creating an empty array of User objects
var appUsers = [User]()

// Creating an Admin user who can modify the questions and stuff
appUsers.append(
    User(
        name: "Administrator",
        email: "admin@gmail.com",
        password: "Admin123",
        userType: .Admin
    )
)

func mainMenu() -> Int? {
    print("Quiz Main Menu")
    print("--------------\n")
    
    print("1. New User")
    print("2. Already registered")
    print("3. Guest User")
    print("4. Exit Quiz")
    
    print("\nEnter your choice : ")
    let mainMenuChoice = readLine()

    // readLine() will return an optional String
    // ! means forceful unbinding
    // Converting the String to Int. Again, the Int() will return optional
    // using optional binding for unwrapping the content returned by Int()
    if let number = Int(mainMenuChoice!) { 
        if number > 4 || number < 1 {
            return nil
        }
        return number
    }
    return nil
}

func validateCredentials(email: String, password: String) -> Int? {
    var index: Int? = nil
    for i in 0..<appUsers.count {
        if appUsers[i].email == email && appUsers[i].password == password {
            index = i
            break
        }
    }
    return index
}

func userLogin() {
    print("\n------------------------------------------")
    print("               Log In Page")
    print("-------------------------------------------\n")

    print("\nEnter your email address : ")
    let userEmail = readLine()!

    print("\nEnter your Password : ")
    let userPassword = readLine()!

    let res = validateCredentials(email: userEmail, password: userPassword)

    if res != nil {
        print("Login Success")
    }
    else {
        print("Login Failed")
    }
}


func userSignUp() {
    print("\n------------------------------------------")
    print("              Sign Up Page")
    print("-------------------------------------------\n")

    print("Enter your Name : ")
    let userName = readLine()!

    print("\nEnter your email address : ")
    let userEmail = readLine()!

    print("\nEnter your Password : ")
    let userPassword = readLine()!

    // Creating a new User object
    let newUser = User(
        name: userName,
        email: userEmail,
        password: userPassword
    )

    // Adding the new user to the list of appUsers
    appUsers.append(newUser)

    print("\nNow that you have signed up, proceed to Login.")
    userLogin()
}

func showAppUsers() {
    var userCount = 0
    print("\n------------------------------------------")
    print("Displaying the List of Users present in the App")
    print("-------------------------------------------\n")

    for user in appUsers {
        userCount += 1
        print("User No: \(userCount)")
        print("Name       : \(user.name)")
        print("Email      : \(user.email)")
        print("Password   : \(user.password)")
        print("-----------------------------------------\n")
    }
    
    if userCount > 1  {
        print("There are \(userCount) users.")
    } else if userCount > 0 {
        print("There is only 1 user present.")
    } else {
        print("There are no users in the database.")
    }
}

func appStart() {
    if let mainMenuChoice = mainMenu() {
    switch mainMenuChoice {
            case 1:
                userSignUp()
            case 2:
                userLogin()
            default:
                print("Invalid Choice Entered")
        }
    }
}

// for q in Topic1 {
//     displayQuestion(ques: q)
// }

print("Topic - 1 ", Topic1.count)
print("Topic - 2 ", Topic2.count)
print("Topic - 3 ", Topic3.count)
print("Topic - 4 ", Topic4.count)
print("Topic - 5 ", Topic5.count)
print("Topic - 6 ", Topic6.count)
print("Topic - 7 ", Topic7.count)
print("Topic - 8 ", Topic8.count)

