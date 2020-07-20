import lombok.Getter;
import lombok.Setter;
import java.util.*;
import org.apache.commons.io.FileUtils;
import java.io.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.stream.Collectors;
@Getter
@Setter
class Todo implements Comparable<Todo>{
    private Integer userId;
    private Integer id;
    private String title;
    private Boolean completed;
   
   // para inverter basta trocar o todo por this e vice versa
   @Override
   public int compareTo(Todo todo){
       return this.title.compareTo(todo.title);
   }
}

public class ExemplosJava {
    public static void main(String args[]) {
        // === Exercicio Parte 2
        // Todo todo = new Todo();
        // todo.setUserId(1);
        // System.out.println(todo.getUserId());
        // === Exercicio Parte 3
        // ArrayList<Todo> todos = new ArrayList();
        // Todo todo = new Todo();
        // todo.setUserId(1);
        // todo.setId(10);
        // todo.setTitle("Terminar Bootcamp");
        // todo.setCompleted(false);
        // todos.add(todo);
        // System.out.println(todos.get(0).getTitle());
        // === Exercicio parte 4
        ArrayList<Todo> todos = new ArrayList();
        // try {
            
        
            // String todoJson = FileUtils.readFileToString(new File("./data/todo.txt"));
            // Type todoListType = new TypeToken<ArrayList<Todo>>() {}.getType();
            // Gson gson = new GsonBuilder().create();
            // todos = gson.fromJson(todoJson,todoListType);
            // System.out.println(todos.size());
            // // for(int i=0; i< todos.size();i++){
            // //     System.out.println(todos.get(i).getTitle());
            // // }
            
            // // et porro tempora
            // // for (Todo todo: todos){
            // //     System.out.println(todo.getTitle());
            // // }
            // // todos = (ArrayList) todos.stream()
            // //              .filter(item -> item.getTitle().equals("et porro tempora"))
            // //              .collect(Collectors.toList());
            // // todos = (ArrayList) todos.stream()
            // //              .filter(item -> item.getCompleted() == true)
            // //              .collect(Collectors.toList());
            // // for (Todo todo: todos){
            // //     System.out.println(todo.getTitle());
            // // }
            
            // // === Parte 6
            // // todos.stream()
            // //     .map(item -> item.getTitle()).forEach(item->System.out.println(item));
            // Collections.sort(todos);
            // for (Todo todo:todos){
            //     System.out.println(todo.getTitle());
            // }
           
        // } catch(IOException ex){
        //     System.out.println(ex);
        // }
        // === Parte 6

        List<Integer> n = Arrays.asList(10,4,10,1,3);
        int result = n.stream().reduce(0,(subtotal,item)->subtotal+item);
        System.out.println(result);
    }
}