# CodeChallengeResume

This project shows my resume fetching the data from github gist using the **Model View Controller** architecture. It has a home screen with "Personal Info", "Laboral History" and "School History" sections, then you can access to the details tapping on each section.

<img src="https://user-images.githubusercontent.com/38329040/60139601-2092c180-9774-11e9-8af1-78f4a50249c0.png" width="276" height="598"> <img src="https://user-images.githubusercontent.com/38329040/60139602-2092c180-9774-11e9-8481-c33ca85bf6f9.png" width="276" height="598"> <img src="https://user-images.githubusercontent.com/38329040/60139603-2092c180-9774-11e9-9b59-772ed551a672.png" width="276" height="598">

## Tools

This project was build using **Xcode 10.1** and **Swift 4.2**.


## Networking

This project use only native libraries to be able to send asynchronous HTTP requests and feed the appplication. The application get the data from a github gist.


## Testing

This project use a technique called **Mocking** to test Internet requests. In that way we avoid asynchronous tests and  dependency on the server side.

<img src="https://user-images.githubusercontent.com/38329040/60139604-2092c180-9774-11e9-9354-7635e394007f.png" width="382" height="442">
