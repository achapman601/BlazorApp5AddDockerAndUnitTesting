using BlazorApp5AddDocker;

namespace Testing
{
    public class UnitTest1
    {
        [Theory]
        [InlineData(4, 3, 7)]
        [InlineData(5, 3, 8)]
        [InlineData(3, 2, 5)]
        public void Add_ShouldWork(double x, double y, double expected)
        {
            double actual = Calculation.Add(x, y);
            Assert.Equal(expected, actual);
        } 
    }
}