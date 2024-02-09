# petStore.io

# Define Animal object
Animal := Object clone do (
    name := nil
    sleep := method("Animal #{name} is sleeping." println)
)

# Define Feline object
Feline := Animal clone do (
    eat := method("Feline #{name} is eating." println)
    play := method("Feline #{name} is playing." println)
    makeNoise := method("Feline #{name} makes noise." println)
)

# Define Cat instances
cat1 := Feline clone setAttributes(name := "Whiskers")
cat2 := Feline clone setAttributes(name := "Mittens")
cat3 := Feline clone setAttributes(name := "Fluffy")

# Define Canine object
Canine := Animal clone do (
    eat := method("Canine #{name} is eating." println)
    play := method("Canine #{name} is playing." println)
    makeNoise := method("Canine #{name} makes noise." println)
)

# Define Dog instances
dog1 := Canine clone setAttributes(name := "Buddy")
dog2 := Canine clone setAttributes(name := "Max")
dog3 := Canine clone setAttributes(name := "Luna")

# Define Staff object
Staff := Object clone do (
    arrive := method("Staff member arrives.")
    lunch := method("Staff member has lunch.")
    leave := method("Staff member leaves.")
)

# Define Manager object
Manager := Staff clone do (
    openStore := method(
        "0800: Manager #{name} arrives and opens the store." println
        "0800: Animals in the store make noise." println
        cat1 makeNoise
        cat2 makeNoise
        cat3 makeNoise
        dog1 makeNoise
        dog2 makeNoise
        dog3 makeNoise
    )
    closeStore := method(
        "1800: Manager #{name} closes the store." println
        "1800: Animals in the store go to sleep." println
        cat1 sleep
        cat2 sleep
        cat3 sleep
        dog1 sleep
        dog2 sleep
        dog3 sleep
    )
)

# Define Clerk object
Clerk := Staff clone do (
    feedAnimals := method(
        "0900: Clerk #{name} arrives and feeds the animals." println
        cat1 eat
        cat2 eat
        cat3 eat
        dog1 eat
        dog2 eat
        dog3 eat
    )
    playAnimals := method(
        "1100: Clerk #{name} plays with the animals." println
        cat1 play
        cat2 play
        cat3 play
        dog1 play
        dog2 play
        dog3 play
    )
    sellAnimals := method(
        "1600: Clerk #{name} sells animals." println
        if((1 to(100)) atRandom <= 20,
            "Animal sold!" println
            # Replace the sold animal with a new named instance
            randomAnimal := (1 to(2)) atRandom
            if(randomAnimal == 1,
                cat1 := Feline clone setAttributes(name := "NewCat")
            ,
                dog1 := Canine clone setAttributes(name := "NewDog")
            )
        )
    )
)

# Define Clock object
Clock := Object clone do (
    day := 1
    hour := 8

    announceHour := method(
        "Day #{day} #{hour}:00" println
        if(hour == 8, Manager openStore)
        if(hour == 9, Clerk feedAnimals)
        if(hour == 11, Clerk playAnimals)
        if(hour == 12, Manager lunch)
        if(hour == 13, Staff lunch)
        if(hour == 16, Clerk sellAnimals)
        if(hour == 17, Clerk leave)
        if(hour == 18, Manager closeStore leave)
        
        # Increment hour
        hour := hour + 1
        if(hour > 18,
            hour := 8
            day := day + 1
        )
    )
)

# Create instances
managerInstance := Manager clone setAttributes(name := "John")
clerkInstance := Clerk clone setAttributes(name := "Clem")

# Simulate store running for three days
for(day, 1, 3,
    for(hour, 8, 18,
        Clock announceHour
    )
)

