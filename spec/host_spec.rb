require "./lib/host.rb"

describe Host do
  subject(:host) {described_class.new(menu, order)}
  let(:order) {double(:order)}
  let(:menu) {double(:menu)}
  let(:item) {double(:item)}

  before do
    allow(menu).to receive(:show_items).and_return("Salmon roll....£7.0")
    allow(menu).to receive(:add_item).and_return(item)
    allow(order).to receive(:add_item).and_return(item)
    allow(order).to receive(:check_order).and_return("Salmon roll....£7.0")
    allow(order).to receive(:print_final_order).and_return("Salmon roll....£7.0\nThe total cost of your order is: £7.0.")
    allow(order).to receive(:new).and_return(order)

  end

  describe "#initialize" do

     it "creates a new instance of the order class" do
       expect(host.new_order).to eq order
     end

     it "creates a new instance of the menu class" do
       expect(host.current_menu).to eq menu
     end

  end

   describe "#show_menu" do

     it "shows the list of menu items" do
       expect(host.show_menu).to eq "Salmon roll....£7.0"
     end

   end

  describe "#add to menu" do

    it "lets you add items to the menu" do
      expect(host.add_to_menu(item)).to eq item
    end

  end

   describe "#add to order" do

     it "lets you add items from the menu to your order" do
       expect(host.add_to_order(item)).to eq item
     end

   end

   describe "#show_order" do

     it "shows all the items you currently have in your order" do
       expect(host.show_order).to eq "Salmon roll....£7.0"
     end

   end

   describe "#place_order" do

     it "clears the order and makes way for a new order" do
       host.print_recipt
       expect(host.new_order).to eq order
     end
     #Check new order as opposed to same instance from before
     #see if there is a way to test if a method has been called.

   end

   describe "#print_recipt" do

     it "prints out a list of the items and their prices and a total cost" do
       expect(host.print_recipt).to eq "Salmon roll....£7.0\nThe total cost of your order is: £7.0."
     end

   end

   describe "#send_message" do

     it "sends a message to mobile number" do
       #should have been in a separate class, check emma's repo for testing help
       
     end

   end
 end
