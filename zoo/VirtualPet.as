package zoo{
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	
	internal class VirtualPet{
		private static var maxNameLenght:int=20;
		private static var maxCalories:int=2000;
		private static var caloriesPerSecond:int=100;
		
		private var petName:String;
		private var currentCalories:int=VirtualPet.maxCalories/2;
		private var digestIntervalID:int;
		
		public function VirtualPet(name:String):void{
			setName(name);
			digestIntervalID=setInterval(digest, 1000);
		}
		
		public function eat (foodItem:Food):void{
			if (currentCalories==0){//Если калории опускаются до 0, животное умирает
				trace (getName()+" is dead. You can't feed it.");
				return;
			}
			
			if (foodItem is Apple){//происходит приведение к типу Apple
				if (Apple(foodItem).hasWorm()){//Если в еде червяк, то животное его не съест
					trace ("The "+foodItem.getName()+" had a worm. " + getName()+" didn't eat it.");
					return;
				}
			}
			
			var newCurrentCalories:int=currentCalories+foodItem.getCalories();
			if (newCurrentCalories>VirtualPet.maxCalories){//правило для прибавления калорий при поедании пищи
				currentCalories=VirtualPet.maxCalories;
			}else{
				currentCalories=newCurrentCalories;
			}
			trace (getName()+" ate some "+foodItem.getName()+"."
			+" It now has "+currentCalories+" calories remaining."); 
		}
		
		public function getHunger():Number{//отвечает за голод животного
			return currentCalories/VirtualPet.maxCalories;
		}
		
		public function setName(newName:String):void{//Устанавливает новое имя для Животного
			//Если длина заданного нового имени
			//больше maxLength символов..
			if (newName.length>VirtualPet.maxNameLenght){
				//..обрезать имя
				newName=newName.substr(0, VirtualPet.maxNameLenght);
			}else if (newName==""){
				// в противном случае, если заданное новое имя является
				// пустой строкой, завершить выполнение метода, не изменяя
				// значение переменной petName
				return;
			}
			
			// присвоить новое имя животному
			petName=NewName;
			}
			
			public function getName():String{//вызывает имя Животного
				return petName;
			}
			
			private function digest():void{//отвечает за потребление пищи и смерть животного. Несколько копирует верхнуюю функцию
				// Если в результате потребления очередной порции калорий
				// значение переменной currentCalories животного
				// станет равной 0 или меньше...
				if (currentCalories-VirtualPet.caloriesPerSecond<=0){
					// прекратить вызов метода digest()
					clearInterval(digestIntervalID);
					// и очистить желудок животного
					currentCalories=0;
					// и сообщить о смерти животного
					trace (getName()+" has died.");
				}else{
					// иначе употребить оговоренное количество калорий
					currentCalories-=VirtualPet.caloriesPerSecond;
					// сообщить о новом состоянии животного
					trace (getname()+" digest some food. It now has "
					+currentCalories+" calories remaining.");
					}
			}
	}
}