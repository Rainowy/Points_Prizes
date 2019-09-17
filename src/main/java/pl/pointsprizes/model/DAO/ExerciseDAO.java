package pl.pointsprizes.model.DAO;


import pl.pointsprizes.model.Entity.Exercise;
import pl.pointsprizes.model.Entity.Goals;
import pl.pointsprizes.model.Entity.User;
import pl.pointsprizes.services.DbServicePFP;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ExerciseDAO {
    //static java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

    private User currentUser;

    public User getCurrentUser() {
        return currentUser;
    }

    /**
     * Zapisuje Zadanie do bazy i ustawia currentUser i dodaje punkty użytkownikowi
     **/
    public void setCurrentUser(Exercise exercise, User currentUser) {

        this.currentUser = currentUser;                   //ustawia usera
        this.save(exercise);                              //zapisuje zadanie

        int currentPoints = currentUser.getUser_points(); //pobiera aktualne punkty użytkownika
        int exercisePoints = exercise.getExe_points();    //pobiera punkty za zadanie
        currentPoints += exercisePoints;                  //sumuje powyższe

        User updateUserPoints = currentUser;
        updateUserPoints.setUser_points(currentPoints);   //modyfikuje punkty użytkownika
        UserDao.updateInDb(updateUserPoints);
    }

    public static void save(Exercise exercise) {

        if (exercise.getId() == 0) {
            addToDb(exercise);
        } else {
            //updateInDb(exercise);
        }
    }

    /**
     * Dodaje nowe zadanie
     **/
    public static void addToDb(Exercise exercise) {

        String query = "insert into exercise values (null,?,?,null,0,0,?,?,?);";        // TODO: 09.08.19 special id zrobić

        String[] params = new String[5];
        params[0] = exercise.getDescription();
        params[1] = String.valueOf(exercise.getCreated());
        // params[2] = String.valueOf(exercise.getSpecial());
        //params[3] = String.valueOf(exercise.getSpecial_id());
        params[2] = String.valueOf(exercise.getExe_points());
        params[3] = String.valueOf(User.getCurrentUser().getId());
        params[4] = String.valueOf(exercise.getGoal().getId());

        int newId = DbServicePFP.executeInsert(query, params);

        exercise.setId(newId);
    }

    /**
     * Pobiera listę ze wszystkimi zadaniami
     **/
    public static List<String[]> getData() {

        String query = "select * from exercise;";

        List<String[]> data = DbServicePFP.getData(query, null);

        return data;
    }

    public static List<Exercise> getAllExercises() {


        List<Exercise> allExercises = new ArrayList<>();

        for (String[] s : getData()) {
            Exercise exercise = getExercise(s);    // odwołuje się do metody getGoal która zwraca pojedynczy obiekt Goal
            allExercises.add(exercise);
        }
        return allExercises;
    }


    private static Exercise getExercise(String[] firstRow) {

        Timestamp created = Timestamp.valueOf(firstRow[2]); //pobiera Stringa i zamienia na Timestamp do wstawienia do bazy

        Exercise newExercise = new Exercise();
        newExercise.setId(Integer.valueOf(firstRow[0]));
        newExercise.setDescription(firstRow[1]);
        newExercise.setCreated(created);

        if (!String.valueOf(firstRow[3]).equals("null")) {          //sprawdza czy data pod updated jest null, jeśli nie to zamienia na Timestamp i wstawia
            Timestamp updated = Timestamp.valueOf(firstRow[3]);
            newExercise.setUpdated(updated);
        }
        newExercise.setSpecial(Integer.valueOf(firstRow[4]));
        newExercise.setSpecial_id(Integer.valueOf(firstRow[5]));
        newExercise.setExe_points(Integer.valueOf(firstRow[6]));
        newExercise.setUser(UserDao.getById(Integer.valueOf(firstRow[7])));
        newExercise.setGoal(GoalsDAO.getById(Integer.valueOf(firstRow[8])));

        return newExercise;
    }

    /**
     * Poboera podstawowe dane na temat zadania na podstawia id
     **/
    public static List<String[]> getBasicExerciseBasedOnUserId(int id) {

        String query = "select id, description, exe_points, created from exercise where user_id =?;";
        String[] params = {String.valueOf(id)};
        List<String[]> data = DbServicePFP.getData(query, params);

        return data;

    }

    public static List<String[]> getAllFromExerciseBasedOnUserId(int id){
        String query = "select * from exercise where user_id=?";
        String params[] = {String.valueOf(id)};
        List<String[]> data = DbServicePFP.getData(query, params);

        return data;
    }

    public static List<Exercise> getCurrentUserExercises() {

        List<Exercise> exercisesList = new ArrayList<>();

        for (String[] e : getAllFromExerciseBasedOnUserId(User.getCurrentUser().getId())) {
            Exercise exercise = getExercise(e);    // odwołuje się do metody getGoal która zwraca pojedynczy obiekt Goal
            exercisesList.add(exercise);
        }
        return exercisesList;
    }

    public static Exercise createExercise(String description, String points, String goalId){

        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

        Exercise newExercise = new Exercise();
        newExercise.setDescription(description);
        newExercise.setCreated(date);
        newExercise.setExe_points(Integer.valueOf(points));
        newExercise.setUser(User.getCurrentUser());
        newExercise.setGoal(GoalsDAO.getById(Integer.valueOf(goalId)));

        return newExercise;
    }


}

