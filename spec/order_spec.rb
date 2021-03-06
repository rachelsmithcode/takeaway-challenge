require "./lib/order.rb"

describe Order do
  subject(:order) {described_class.new}
  let(:item1) {double(:item1)}
  let(:item2) {double(:item2)}

  before do
      allow(item1).to receive(:name)       {"Salmon roll"}
      allow(item1).to receive(:price)      {7.0}
      allow(item2).to receive(:name)       {"Tuna roll"}
      allow(item2).to receive(:price)      {8.5}
  end

  describe "#initialize" do

    it "creates a blank array to store the ordered items in" do
       expect(order.show_list.length).to eq 0
     end

  end

  describe "#add_item to order_list" do

    it "can store more than one ordered items in the order list" do
      order.add_item(item1)
      order.add_item(item2)
      expect(order.show_list).to eq [item1, item2]
    end

  end

  describe "#show_list" do

    it "shows a clone of the order list on request" do
      order.add_item(item1)
      expect(order.show_list).to eq [item1]
    end
  end

  describe "#check_order" do

    it "prints a formatted version of the order to the screen" do
      order.add_item(item1)
      expect(order.check_order).to receive(:puts).with("\t#{item1.name}....£#{item1.price}\n")
    end
  end

  describe "#total" do

    it "calculates the total of the price of each item on the order list" do
      order.add_item(item1)
      expect(order.total).to eq 7.0
    end

  end

  describe "#print_final_order" do

    it "returns a list of the items in the order and thier total cost" do
      order.add_item(item1)
      expect(order.print_final_order).to receive(:puts).with("\t#{item1.name}....£#{item1.price}\nThe total cost of your order is: £#{instance_variable_get(:@total)}.")
    end

  end

#investigate reduce and inject for calc totals and the Law of Demeter(separation of classes)
end
