
# MVC


The problem is that when people start using MVC, they start putting a lot of code in the controllers.
So inevitably the controller becomes the bottleneck because you the model could end up over there.
The view code, if you're modifying the view, it goes to the controller also.
Developers, usually put a lot of code into the controller.
Change controller is just a middleman, which is controlling or orchestrating between the model and the view.
It ends up being becoming massive and massive amounts of it is very hard to test these controllers.
It becomes very hard to test these controllers.
Now, there are ways around that, but it will
take a lot of work, like you have to create separate data sources and you have to separate out everything by components and so on.
So MVC design pattern maybe is not as flexible as MVVM.

But you can still design great apps using and we see design pattern if you take the time and love to
make sure that each component is separate.

#MVVM
More testable, cleaner controller.
Decouple view and model/business logic

The view model in this case is the data that is going to be blinded to the view so you can talk to the
view model, but you cannot directly talk to the model.
The model in this case is your domain, is your main object.
That is your business logic.
So the you can talk to the view model and view model, can talk to the view and update the view.
But we cannot directly talk to the model.
Only the view model can talk to the model.
And sometime you need to also convert the model into the view model to displayed on the screen.
