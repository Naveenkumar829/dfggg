<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <form>	
            <pre>
                <label>Name:</label>
                <input type="text" name="name" />
                
                <label>Email:</label>
                <input type="email" name="email" /></br>

               <label> PassWord:</label>
               <input type="password" name="password" id="pws"/>

               <label> Gender:</label>
               <input type="radio" name="gender" value="male" /> Male
               <input type="radio" name="gender" value="female"  /> Female
                           

                           
           
        <label>Cities lived in:</label>
        <input type="checkbox" name="cities1" value="Bengaluru" >Bengaluru
        <input type="checkbox" name="cities1" value="Hyderabad"> Hyderabad
        Address:<textarea name="address" size="50" ></textarea></br>
              Technologies:<select multiple name="tech">
                <option name=" " class="c3"> </option>
                                <option name="python" value="Python" >Python</option>
                                <option name="html" value="html" >Html</option>
                                <option name="css" value="css" >Css</option> 
                            </select>
                </pre>            
                <button type="submit">Submit Form</button> 
                <Button type="reset">Reset Form</Button>
                 </form>

</body>
</html>