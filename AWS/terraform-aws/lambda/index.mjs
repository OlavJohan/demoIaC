const databaseStub = [
    {
        "Fylkenavn": "Svalbard",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Jan Mayen",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Østfold",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Akershus",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Oslo",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Hedmark",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Oppland",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Buskerud",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Vestfold",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Telemark",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Aust-Agder",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Vest-Agder",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Rogaland",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Hordaland",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Sogn og Fjordane",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Møre og Romsdal",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Sør-Trøndelag",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2017"
    },
    {
        "Fylkenavn": "Nord-Trøndelag",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2017"
    },
    {
        "Fylkenavn": "Nordland",
        "Gyldig Fra": "1900",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Troms",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Finnmark",
        "Gyldig Fra": "1900",
        "Gyldig Til": "2019"
    },
    {
        "Fylkenavn": "Trøndelag",
        "Gyldig Fra": "2018",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Viken",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Innlandet",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Vestfold og Telemark",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Agder",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Vestland",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    },
    {
        "Fylkenavn": "Troms og Finnmark",
        "Gyldig Fra": "2020",
        "Gyldig Til": "1900"
    }
];

export const handler = async(event) => {
    const response = {
        statusCode: 200,
        body: JSON.stringify(databaseStub),
    };
    return response;
};
