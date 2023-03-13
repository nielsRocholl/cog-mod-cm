import Foundation


let dictionary: [String: Any] = [
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
        "p7": [],
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
                "question": """
                            The schedule shows the opening hours of the Restaurant, the Grand Café and the Liquor Store.\n
                            How many hours on Thursday is the Grand Café open longer than the Liquor Store?
                            """,
                "answer": 5.5,
                "unit": "hours",
                "points": 1
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "How many minutes is the Restaurant open less than the Grand Café on Saturdays??",
                "answer": 180,
                "unit": "minutes",
                "points": 2
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "On how many days was the liquor store open in February 2021 (not a leap year)?",
                "answer": 20,
                "unit": "days",
                "points": 2
            ],
        ],
        "p11": [],
        "p12": [],
        "p13": [
            "fact": """
                    An ultra-modern windmill has a capacity of 8 MW and delivers per year\n
                    17.6 million kWh of electricity for 5500 households.
                    """,
            "question_1": [
                "question_type": "multiple_choice",
                "question": "What is the value of the letter M in MW?",
                "options": [1000, 10000, 100000, 1000000, 1000000000],
                "answer": 1000000,
                "points": 2
            ],
            "question_2": [
                "question_type": "multiple_choice",
                "question": "What is kWh the abbreviation for?",
                "options": ["Kilowatt hour", "Kilowatt", "Kilogram", "Kilometer", "Kilogram per hour"],
                "answer": "Kilowatt hour",
                "points": 1
            ],
            "question_3": [
                "question_type": "fill_in_the_blank",
                "question": "How much electricity does an average household use per year?",
                "answer": 3.2,
                "unit": "MWh",
            ],
            "question_4": [
                "question_type": "fill_in_the_blank",
                "question": """
                            A wind farm has 4 ultra-modern wind turbines.\n
                            What is the total power of these windmills?
                            """,
                "answer": 0.032,
                "unit": "GW",
            ],
        ],
        "p14": [
            "img": "question_p14.png",
            "question_1": [
                "question_type": "fill_in_the_blank",
                "question": """
                            When copying a folder on the computer, you can see below the graph which part has already been copied.
                            \nHow many megabytes are copied in total?
                            """,
                "answer": 2138.30,
                "unit": "MB",
                "points": 3
            ],
            "question_2": [
                "question_type": "fill_in_the_blank",
                "question": "How many gigabytes still need to be copied?",
                "answer": 1134.30,
                "unit": "MB",
                "points": 2
            ]
        ],
        "p15": [],
        "p16": [],
        "p17": [
            "img": "question_p17.png",
            "question_1": [
                "question_type": "multiple_choice",
                "question": "How high is the statue approximately?",
                "options": ["2.5 meters", "3.5 meters", "6.5 meters", "12 meters"],
                "answer": "6.5 meters",
                "points": 2
            ],
            "question_2": [
                "question_type": "multiple_choice",
                "question": "How long is the statue approximately?",
                "options": ["1 meters", "2 meters", "3 meters", " 7 meters"],
                "answer": "7 meters",
                "points": 3
            ],


        ],
        "p18": [
            "fact": "A household uses an average of 95,625 liters of water every year. That results in a water bill of about € 76.50. An average household consists of 2,125 persons.",
            "question_1": [
                "question_type": "multiple_choice",
                "question": "Approximately how many households are there?",
                "options": ["8000", "80.000", "8 million", "8 billion"],
                "answer": "8 million",
                "points": 1
            ],
            "question_2": [
                "question_type": "multiple_choice",
                "question": "How many cubic meters of water does one Dutch person use on average per year?",
                "options": ["40", "45", "50", "40.000", "45.000"],
                "answer": "45",
                "points": 2
            ],
            "question_3": [
                "question_type": "multiple_choice",
                "question": "How many billion euros is the joint water bill of all people?",
                "options": ["0.6", "6", "60", "600"],
                "answer": "600",
                "points": 2
            ],
        ],
        "p19": [],
        "p21": [],
    ],
]
