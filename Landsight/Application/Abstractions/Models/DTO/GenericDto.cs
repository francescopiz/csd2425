namespace Landsight.Application.Abstractions.Models.Dto
{
    public interface GenericDto<T>
    {
        public T ToEntity();
    }
}
