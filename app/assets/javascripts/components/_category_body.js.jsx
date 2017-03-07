var CategoryBody = React.createClass({
    getInitialState() {
        return { categories: [] }
    },


    componentDidMount() {
        $.getJSON('/api/v1/categories.json', (response) => { this.setState({ categories: response }) });
    },



    handleSubmit(category) {
        var newState = this.state.categories.concat(category);
        this.setState({ categories: newState })
    },


    handleDelete(id) {
        $.ajax({
            url: `/api/v1/categories/${id}`,
            type: 'DELETE',
            success:() => {
               this.removeCategory(id);
            }
        });
    },

    removeCategory(id) {
        var newCategories = this.state.categories.filter((category) => {
            return category.id != id;
        });

        this.setState({ categories: newCategories });
    },



    handleUpdate(category) {
        $.ajax({
                url: `/api/v1/categories/${category.id}`,
                type: 'PUT',
                data: { category: category },
                success: () => {
                    this.updateCategories(category);

                }
            }
        )},

    updateCategories(category) {
        var categories = this.state.categories.filter((i) => { return i.id != category.id });
        categories.push(category);

        this.setState({categories: categories });
    },


    render() {
        return (
            <div>
                <NewCategory handleSubmit={this.handleSubmit}/>
            </div>
        )
    }
});
