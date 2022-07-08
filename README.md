# Classical-Rental-Car-Database

- Project Topic: Database that holds rental classical car names, models, owners etc.
- Database: I used Microsoft SQL Server.
- E-R Diagram: I used draw.io for drawing the E-R diagram.

# Database Diagram and Tables

This database holds 10 tables and made in Turkish. But I translated some parts into English.

| **Tables**                                                | **Usage**                                        |
|-----------------------------------------------------------|--------------------------------------------------|
| CARS(araclar)                                             | Holds the classical car brands, models, year etc.|
| CAR FEATURES(aracozellikleri)                             | Holds the brands features.                       |
| CATEGORIES(kategoriler)                                   | Holds the automotive classes.                    |
| RENTAL STATIONS(kiralama_istasyonlari)                    | Holds the places that we can rent classical car. |
| RENTAL STATIONS PHONES(kiralama_istasyonlari_telefonlari) | Holds the phone numbers of rental stations.      |
| RENTAL POINT(kiralama_noktasi)                            | Holds the place that we can take the rental car. |
| CUSTOMERS(musteriler)                                     | Holds the customer names, mails etc.             |
| CUSTOMER DISCOUNTS(musteriindirimleri)                    | Holds the customers that have discounts.         |
| CUSTOMER PAYMENTS(musteriodemeler)                        | Holds the payment method and installments.       |
| RESERVATIONS(rezervasyonlar)                              | Holds the reservations.                          |

# E-R Diagram

![E-R Diagram](https://user-images.githubusercontent.com/96497510/178055324-31bce376-5102-4b0c-bd4c-48a665b57598.jpg)

# Database Features

- 10 Table
- 1 Stored Procedure
- 1 Trigger
- 1 Function
