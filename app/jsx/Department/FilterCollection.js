import Backbone from 'Backbone'
import FilterModel from '../Department/FilterModel'

export default class FilterCollection extends Backbone.Collection {}

FilterCollection.prototype.model = FilterModel
