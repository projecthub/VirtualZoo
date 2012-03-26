package {
	import flash.display.Sprite;
	import zoo.*;

	public class VirtualZoo extends Sprite{
		private var pet:VirtualPet;
		
		public function VirtualZoo(){
			pet=new VirtualPet("Stan");// создается новый объекта класса ВИртуалПет с именем Стэн.
			pet.eat(new Apple());
			pet.eat(new Sushi());
		}
	}
}
