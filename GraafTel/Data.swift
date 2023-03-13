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
        "p10": [],
        "p13": [],
        "p14": [],
        "p17": [],
        "p18": [],
    ],
]
