import Foundation


let dictionary: [String: Any] = [
    "initial_test": [
        "question_1": [
            "img": "question_1.png",
            "question_type": "connect",
            "domain": "1.1",
            "KTI": "application",
            "question": "What do the numbers on the map mean?",
            "options_and_answers": [
                "13,64": "distance",
                "17,83": "speed",
                "6:28": "time",
                "18": "road number",
                "2021": "year",
            ]
        ],
        "question_2": [
            "img": "None",
            "question_type": "option_list",
            "domain": "1.1",
            "KTI": "application",
            "question": "Select the correct unit",
            "questions": [
                "question_a": [
                    "question": "A cup of coffee contains 200",
                    "options": ["milliliter", "liter", "kilogram", "gram"],
                    "answer": "milliliter"
                ],
                "question_b": [
                    "question": "A hamburger costs 200",
                    "options": ["euro", "euro cent", "gram", "dollar"],
                    "answer": "euro cent"
                ],
                "question_c": [
                    "question": "The distance between two lanterns is 100",
                    "options": ["meter", "kilometer", "centimeter", "millimeter"],
                    "answer": "meter"
                ],
                "question_d": [
                    "question": "A newborn baby elephant weighs 90",
                    "options": ["kilogram", "gram", "centimeter", "ton"],
                    "answer": "kilogram"
                ],
                "question_e": [
                    "question": "A tumble dryer dries at 60",
                    "options": ["degree celsius", "gram", "ampere", "ton"],
                    "answer": "degree celsius"
                ]
            ]
        ],
        "question_3": [
            "img": "question_3.png",
            "question_type": "multiple_choice",
            "domain": "1.1",
            "KTI": "insight",
            "question": "What is the name of this measurement instrument?",
            "options": ["centimeter", "ruler", "hygrometer", "protractor"],
            "answer": "ruler"
        ],
        "question_4": [
            "img": "None",
            "question_type": "fill_in_the_blank",
            "domain": "1.2",
            "KTI": "application",
            "question": "Calculate",
            "questions": [
                "question_a": [
                    "first_part": "5 dm + 40 cm + 4 mm = ",
                    "answer": "904",
                    "second_part": "mm"
                ],
                "question_b": [
                    "first_part": "2.1 km + 8 hm + 350 dm = ",
                    "answer": "2935",
                    "second_part": "m"
                ],
                "question_c": [
                    "first_part": "3.5 dm + 5 cm + 2.5 dm = ",
                    "answer": "65",
                    "second_part": "cm"
                ],
            ]
        ],
        "question_5": [
            "img": "question_5.png",
            "question_type": "fill_in_the_blank",
            "domain": "1.2",
            "KTI": "application",
            "question": "On the thermometers you can see the temperature in degrees Celsius and Fahrenheit.\nRead the answers to the questions on the thermometers.",
            "questions": [
                "question_a": [
                    "first_part": "What temperature 100 in degrees Celsius translate to in degrees Fahrenheit?",
                    "answer": "212",
                    "second_part": "°F"
                ],
                "question_b": [
                    "first_part": "What temperature is the left thermometer showing in degrees Celsius?",
                    "answer": "24",
                    "second_part": "°C"
                ],
                "question_c": [
                    "first_part": "What is the difference between the number of degrees Celsius and the temperature in Fahrenheit?",
                    "answer": "32",
                    "second_part": "degrees"
                ],
            ]
        ],
    ],
    "skilltree": [
        "p1": [],
        "p2": [],
        "p3": [],
        "p4": [],
        "p5": [],
        "p6": [
            "img": "question_p6.png",
            "question_1":
            [
                "question_type": "fill_in_the_blank",
                "question": "This traffic sign hangs above the entrance of a tunnel. What is the maximum height?",
                "answer": "31",
                "unit": "dm",
                "points": 2
            ],
            "question_2":
            [
                "question_type": "fill_in_the_blank",
                "question": "A motor home has a height of 260 cm. A roof box with a height of 0.45 m is attached to this motorhome. What is the height of the camper with the roof box?",
                "answer": 3.05,
                "unit": "m",
                "points": 2
            ],
            "question_3":
            [
                "question_type": "multiple_choice",
                "question": "Can this camper with roof box on it pass under this tunnel?",
                "options": ["Yes", "No"],
                "answer": "yes",
                "points": 1
            ],
        ],
        "p7": [
            "question 1": [
                "question_type": "fill_in_the_blank",
                "question": "1.3 kg + 350 g",
                "answer": 1650,
                "unit": "g",
                "points": 1
            ],
            "question 2": [
                "question_type": "fill_in_the_blank",
                "question": "3.7 tons + 420 kg",
                "answer": 4.12,
                "unit": "tons",
                "points": 2
            ],
            "question 3": [
                "question_type": "fill_in_the_blank",
                "question": "0.8 g + 90 mg",
                "answer": 170,
                "unit": "mg",
                "points": 2
            ],
        ],
        "p8": [
            "fact": "The annual amount of waste produced per inhabitant in the Netherlands is 490kg.",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "How many kilograms of waste does a family produce 4 people per year?",
                "answer": 1960,
                "unit": "kg",
                "points": 1
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": """
                            17.3 million people live in the Netherlands.\n
                            How many million kilograms of waste are produced annually by the inhabitants of the Netherlands?
                            """,
                "answer": 8477,
                "unit": "million kg",
                "points": 2
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "How many tons of waste is that per year?",
                "answer": 8477000,
                "unit": "ton",
                "points": 2
            ],
        ],
        "p9": [
            "fact": """
                    Potting soil weighs 360 kg/m3
                    \n1 m3 = 1000 dm3
                    \n1 dm3 = 1 litre
                    """,
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "How many kilograms does 1 bag of potting soil weigh?",
                "answer": 7.2,
                "unit": "kg",
                "points": 2
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": """
                            A truck driver transports bags of potting soil with a weight of 7.5 kg per bag.\n
                            Zin truck may load a maximum of 7 tons.\n
                            How many bags of potting soil can the driver load?
                            """,
                "answer": 933,
                "unit": "bags",
                "points": 3
            ],
        ],
        "p10": [
            "img": "question_p10.png",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "How many hours is the Grand Café open longer compared to the Sluiterij?",
                "answer": 5.5,
                "unit": "hours",
                "points": 1
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "How many quarters of an hour is the Restaurant extra open on Saturday compared to the Grand Café?",
                "answer": 12,
                "unit": "quaters of an hour",
                "points": 2
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "How many days was the Sluiterij open in Febraury 2020",
                "answer": 20,
                "unit": "days",
                "points": 2
            ],
        ],
        "p11": [
            "fact": "It is 9:15 in London"
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "What is the time in Amsterdam?",
                "answer": 10:15,
                "points": 1
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "Shahim takes a plane from Amsterdam to Los Angeles. His plane departures at 14:25. The flight takes 11 hours and 40 minutes. At what time does he arrive in the local timezone?",
                "answer": 17:05,
                "points": 4
            ],
        ],
        "p12": [],
        "p13": [
            "fact": "A windmill has a power of 8 MW and produces 17.6 million kWh of electricity for 5500 households",
            "question_1": [
                "question_type": "mulitple choice",
                "question": "What does the M stand for in MW",
                "options": ["1000", "10000", "100000", "1000000", "1000000000"],
                "answer": "1000000",
                "points": 2
            ],
            "question_2": [
                "question_type": "multiple choice",
                "question": "What does the abbreviation kWh stand for?",
                "options": ["kleinewattuur", "kilowattuur", "klikowattuur", "kwattuur"],
                "answer": "kilowatuur",
                "points": 2
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "What is the total power of a windmill park that consists of 4 windmills",
                "answer": 0.032,
                "unit": "GW",
                "points": 2
            ],
        ],
        "p14": [
            "img": "question_p14.png",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "How much MB is copied in total?",
                "answer": 11600,
                "unit": "MB",
                "points": 1
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "How much GB has to be copied from this point onwards?",
                "answer": 11.2375,
                "unit": "GB",
                "points": 2
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "Copying 11.6 GB takes 2 minutes in total, what is the copy speed in MB/s?",
                "answer": 96.7,
                "unit": "MB/s",
                "points": 2
            ],
        "p15": [],
        "p16": [],
        "p17": [
            "img": "question_p17.png",
            "question_1": [
                "question_type": "multiple_choice",
                "question": "What is roughly the height of the statue?",
                "options": ["2.5", "4", "6.5", "9"],
                "answer": "6.5",
                "unit": "m",
                "points": 2
            ],
            "question_2": [
                "question_type": "multiple_choice",
                "question": "Looking at the height, what is the ratio between the horse and human head?",
                "options": ["1/1", "1/2", "1/8", "1/15", "1/20"],
                "answer": "1/8",
                "points": 3
            ],
        "p18": [
            "fact": "In the Netherlands, a household consists of 2.125 people on average. One household uses on average 95625 liters of water, which costs 76.50 euros",
            "question_1": [
                "question_type": "mulitple_choice",
                "question": "How many households does the Netherlands roughly have?",
                "options": ["8000", "80000", "8000000", "8000000000"],
                "answer": "8000000",
                "points": 2
            ],
            "question_2": [
                "question_type": "multiple_choice",
                "question": "How many kubic meters of water does one dutch person on average use per year?",
                "options": ["40", "45", "50", "40000", "45000"],
                "answer": "45",
                "unit": "m^3",
                "points": 2
            ],
        ],
        "p19": [],
        "p20": [],
        "p21": [],
        "q1.2.11": [
            "img": "q1.2.11.png",
            "question 1": [
                "question_type": "fill_in_the_blank",
                "question": "What is the distance to the market?",
                "answer": 200,
                "unit": "m"
            ],
            "question 2": [
                "question_type": "fill_in_the_blank",
                "question": "From this board onwards, compare the distance between the board and Herzogenrath and Vaals, how much further is Herzogenrath?",
                "answer": 77,
                "unit": "hm"
            ],
        ],
        "q1.2.12": [
            "img": "q1.2.12.png",
            "question 1": [
                "question_type": "fill_in_the_blank",
                "question": "What is the length of the woodem beam in meters?",
                "answer": 3,
                "unit": "m"
            ],
            "question 2": [
                "question_type": "fill_in_the_blank",
                "question": "What is the width of one wooden beam in centimeters?",
                "answer": 4.4,
                "unit": "cm"
            ],
            "question 3": [
                "question_type": "fill_in_the_blank",
                "question": "One wooden beam costs 6.75, how many beams can you buy for 60.75?",
                "answer": 9
            ],
            "question 4": [
                "question_type": "fill_in_the_blank",
                "question": "If you buy 9 beams, what is the total length in centimeters of your order?",
                "answer": 2700
            ],
        ],
        "q1.4.10": [
            "fact": "Today is the 7th of February and this year is a leap year.",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "It is the birthday of Wim in 23 days, on which date is the birthday of Wim?",
                "answer": 01-03-2020
            ],
        ],
        "q1.3.8": [
            "fact": "On average, one person uses 165 kg of paper each year and the Netherlands has 17 million citizens.",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "What is the total amount of paper used in the Netherlands for each year?",
                "answer": 2805000000,
                "unit": "kg"
            ],
        ],
        "q1.3.12": [
            "fact": "A liter of water weighs 1 kg and a liter of milk weighs 1.03 kg. Farmers earn 37.50 euros for every 100 kg of milk",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": "How many liter corresponds to 100 kg of milk (round to a whole number)?",
                "answer": 97,
                "unit": "liter"
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "What does a farmer earn for each liter of milk (round to 2 decimals)?",
                "answer": 0.30
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "How much grams is 1 liter of milk heavier compared to 1 liter of water?",
                "answer": 30,
                "unit": "gram"
            ],
        ],
        
    ],
]
