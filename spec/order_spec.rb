require 'order'
describe Order do
  subject(:order) { Order.new(menu) }

  let(:menu) { double(:menu) }
  let(:basket) do
    {tacos: 1, burrito: 2}
  end

before do
  allow(menu).to receive(:include).with(:tacos).and_return(true)
  allow(menu).to receive(:include).with(:burrito).and_return(true)

  allow(menu).to receive(:price).with(:tacos).and_return(6)
  allow(menu).to receive(:price).with(:burrito).and_return(3)
end


 it 'adds meals to basket from the menu' do
   order.add(:tacos, 1)
   order.add(:burrito, 2)
  expect(order.basket).to eq basket
 end

 it 'raises error if meal is not in the menu' do
   allow(menu).to receive(:include).with(:chimichanga).and_return(false)
   expect {order.add(:chimichanga, 1)}.to raise_error "Not in the menu!"
 end

 it 'calculates order total' do
   order.add(:tacos, 1)
   order.add(:burrito, 2)
   total = 12
   expect(subject.total).to eq(total)
 end
end
