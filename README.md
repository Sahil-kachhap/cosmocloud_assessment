# cosmocloud_assessment

## Project Setup
- Download ZIP Folder/Clone this Repository.
- Add/Install all flutter packages listed in the pubspec.yaml file: Run `flutter pub get` in the terminal.
- Create a `.env file` in the root of the project folder structure. Then, add following keys in .env file:
  - **PROJECTID="Enter-Your-Cosmocloud-Project-Id-Here"**
  - **ENVIRONMENTID="Enter-Your-Cosmocloud-Environment-Id-Here"**

### Additional Configuration:
- Currently I am fetching 11 items in a single page (for pagination purpose), but you can modify this limit parameter by navigating to `/lib/utils/constants.dart`. Just change the limit parameter and everything will be handled accordingly.

## App Architecture
I have divided the entire App flow in 3 Layers: **Presentation**, **Domain** and **Data Layer**.

1. Presentation Folder encapsulates all the code relevant for implementing the screen designs, state management and a utility folder to keep reusable components and constant properties at one place.
2. Domain Layer/Folder consist of `usecases and entites` - `Usecases` encapsulates the core logic and code required for fetching and interacting with the cosmocloud Apis and Entities are classes that have just the relevant data that will be displayed on the screen. I have explained the difference between Entity and data layer DTO (Data Transfer Objects) below.
*You might be having a doubt, what's the need of this `usecases folder` - Usecases gives us the freedom and flexibility to switch between any state management solution. Since our core api interaction logic lies inside the usecases, we can choose any state management solution and just link them with the usecase and everything will just work fine*
3. Data Layer/Folder consists of Data sources which can either be local or remote data source, repository and DTO (Data Transfer Object).

### Difference Between Entity and DTO
- The response received from API is parsed and converted into a DTO. In this current assessment, the Employee DTO contains all the attributes of a employee (id, name, address, and contact), but there are scenarios where we don't need to use all the attributes of a Employee. For instance, in the employee list screen, we only need to display employee name and id property, so in this scenario entities comes into play. Entity contains just all those attributes of an employee that are needed to be displayed on this screen. 
