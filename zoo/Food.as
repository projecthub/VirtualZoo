package zoo{
	public class Food{
		private var calories:int;
		private var name:String;
		
		public function Food(initialCalories:int){
			// устанавливаются калории для еды
			setCalories(initialCalories);
		}
		
		public function getCalories():int{
			// возвращается значение калорий
			return calories;
		}
		
		public function getName():String{
			// возвращается имя еды
			return name;
		}
		
		public function setName(newName:String):void{
			// новое имя
			name=newName;
		}
	}
}