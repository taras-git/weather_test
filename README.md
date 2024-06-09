# weather_app

Flutter application to get the current temperature in a city.

The project is using API from openweathermap.org

To run the application on simulators please obtain the **API key** first by registering/signing in to the openweathermap.org and find your unique API key on your account page under the "API key" tab.

The **API key** is passed via environmental variable to the application.
For that please navigate to the project folder in the terminal window or in an IDE, and run the command (do not forget to substitute the **APPID** with the actual **API key** obtained from openweathermap.org):
`flutter run --dart-define appid=APPID`

After that please search a city by clicking on the search icon. The current temperature will be displayed on the Home Screen.

You can toggle Celsius and Fahrenheit from the AppBar thermometer icon
