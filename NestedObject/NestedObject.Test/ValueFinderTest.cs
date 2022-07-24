using System;
using NestedObjectHelper;
using Xunit;
using FluentAssertions;

namespace NestedObject.Test
{
    public class ValueFinderTest
    {
        [Fact]
        public void WhenIPassSimpleObject_ShouldReturn_Excepted_Value()
        {
            var simpleObject = new { Name = "Kevin", Age = "10" };
            var keyToFind = "Name";

            var valueFinder = new ValueFinder();
            var value = valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().NotBeNull();
            value.Should().Be(simpleObject.Name);

        }

        [Fact]
        public void WhenIPassInvalidKey_ShouldThrowException()
        {
            var simpleObject = new { Name = "Kevin", Age = "10" };
            var keyToFind = "Name2";

            var valueFinder = new ValueFinder();
            Action value = () => valueFinder.GetValue(simpleObject, keyToFind);
            
            value.Should().Throw<NestObjectKeyNotFoundException>();
        }

        [Fact]
        public void WhenIPassNestedObject_ShouldReturn_Excepted_Value()
        {
            var simpleObject = new
            {
                Name = "Kevin", 
                Age = "10",
                a = new {
                    a1 ="Hello"
                }
            };
            var keyToFind = "a/a1";

            var valueFinder = new ValueFinder();
            var value = valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().NotBeNull();
            value.Should().Be(simpleObject.a.a1);

        }

        [Fact]
        public void WhenIPass_2Level_NestedObject_ShouldReturn_Excepted_Value()
        {
            var simpleObject = new
            {
                Name = "Kevin",
                Age = "10",
                a = new
                {
                    a1 = "a1",
                    ab = new
                    {
                        ab1 = "ab1"
                    }
                }
            };
            var keyToFind = "a/ab/ab1";

            var valueFinder = new ValueFinder();
            var value = valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().NotBeNull();
            value.Should().Be(simpleObject.a.ab.ab1);

        }


        [Fact]
        public void WhenIPass_3Level_NestedObject_ShouldReturn_Excepted_Value()
        {
            var simpleObject = new
            {
                Name = "Kevin",
                a = new
                {
                    a1 = "a1",
                    ab = new
                    {
                        ab1 = "ab1"
                    }
                },
                b = new
                {
                    b1 = "b1",
                    ba = new
                    {
                        ba1 = "ba1"
                    }
                },
                Age = "10",
            };
            var keyToFind = "b/ba/ba1";

            //var keyToFind = "Age";

            var valueFinder = new ValueFinder();
            var value = valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().NotBeNull();
            value.Should().Be(simpleObject.b.ba.ba1);

        }

        [Fact]
        public void WhenIPass_3Level_NotExisitsKey_ShouldThrowException()
        {
            var simpleObject = new
            {
                Name = "Kevin",
                Age = "10",
                a = new
                {
                    a1 = "a1",
                    ab = new
                    {
                        ab1 = "ab1"
                    }
                },
                b = new
                {
                    b1 = "b1",
                    ba = new
                    {
                        ba1 = "ba1"
                    }
                },
            };
            var keyToFind = "b/c1";

            var valueFinder = new ValueFinder();
            Action value = () => valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().Throw<NestObjectKeyNotFoundException>();

        }

        [Fact]
        public void WhenIPass_3Level_ContinueKeyNotExists_ShouldThrowException()
        {
            var simpleObject = new
            {
                Name = "Kevin",
                Age = "10",
                a = new
                {
                    a1 = "a1",
                    ab = new
                    {
                        ab1 = "ab1"
                    }
                },
                b = new
                {
                    b1 = "b1",
                    ba = new
                    {
                        ba1 = "ba1"
                    }
                },
            };
            var keyToFind = "b/c1/t1";

            var valueFinder = new ValueFinder();
            Action value = () => valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().Throw<NestObjectKeyNotFoundException>();

        }

        [Fact]
        public void WhenIPass_EmptyKeyToFind_ShouldThrowException()
        {
            var simpleObject = new
            {
                Name = "Kevin",
                Age = "10",
                a = new
                {
                    a1 = "a1",
                    ab = new
                    {
                        ab1 = "ab1"
                    }
                },
                b = new
                {
                    b1 = "b1",
                    ba = new
                    {
                        ba1 = "ba1"
                    }
                },
            };
            var keyToFind = "";

            var valueFinder = new ValueFinder();
            Action value = () => valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().Throw<ArgumentNullException>();

        }

        [Fact]
        public void WhenIPass_NullObject_ShouldThrowException()
        {
            var simpleObject = default(object);
            var keyToFind = "Name";

            var valueFinder = new ValueFinder();
            Action value = () => valueFinder.GetValue(simpleObject, keyToFind);


            value.Should().Throw<ArgumentNullException>();

        }
    }
}
